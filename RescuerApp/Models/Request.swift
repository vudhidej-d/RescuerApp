//
//  Request.swift
//  RescuerApp
//
//  Created by CNC on 17/12/2561 BE.
//

import FirebaseFirestore

class Request {
    
    var documentID: String
    
    var phoneNumber: String
    var requestLocation: GeoPoint
    var requestName: String
    var requestAddress: String
    
    var rescuerID: String?
    var rescuerLocation: GeoPoint?
    var rescuerName: String?
    var status: Int
    
    /// Initializes a request with a documentID auto-generated by Firestore.
    init(
        documentID: String,
        phoneNumber: String,
        requestLocation: GeoPoint,
        requestName: String,
        requestAddress: String,
        rescuerID: String,
        rescuerLocation: GeoPoint,
        rescuerName: String,
        status: Int
        ) {
        self.documentID = documentID
        self.phoneNumber = phoneNumber
        self.requestLocation = requestLocation
        self.requestName = requestName
        self.requestAddress = requestAddress
        self.rescuerID = rescuerID
        self.requestLocation = requestLocation
        self.status = status
    }
    
    init (documentID: String,
          phoneNumber: String,
          requestLocation: GeoPoint,
          requestName: String,
          requestAddress: String,
          status: Int) {
        self.documentID = documentID
        self.phoneNumber = phoneNumber
        self.requestLocation = requestLocation
        self.requestName = requestName
        self.requestAddress = requestAddress
        self.status = status
    }
    
    init (phoneNumber: String,
          requestLocation: GeoPoint,
          requestName: String,
          requestAddress: String,
          status: Int) {
        let requestRef = Firestore.firestore().collection("requests").document()
        self.documentID = requestRef.documentID
        self.phoneNumber = phoneNumber
        self.requestLocation = requestLocation
        self.requestName = requestName
        self.requestAddress = requestAddress
        self.status = status
    }
    
    init? (document: DocumentSnapshot) {
        
        guard let data = document.data() else { return nil }
        
        self.documentID = document.documentID
        self.phoneNumber = data["phoneNumber"] as! String
        self.requestLocation = data["requestLocation"] as! GeoPoint
        self.requestName = data["requestName"] as? String ?? "Not Founded"
        self.requestAddress = data["requestAddress"] as? String ?? "Not Founded"
        self.status = data["status"] as! Int
        
        if ((data["status"] as! Int == 1) || (data["status"] as! Int == 2)) {
            
            self.rescuerID = data["rescuerID"] as? String
            self.rescuerLocation = data["rescuerLocation"] as? GeoPoint
            self.requestName = data["requestName"] as? String ?? "Not Founded"
            self.requestAddress = data["requestAddress"] as? String ?? "Not Founded"
            self.rescuerName = data["rescuerName"] as? String
            
        }
        
    }
    
    init? (document: QueryDocumentSnapshot) {
        let data = document.data()
        print(data)
        self.documentID = document.documentID
        self.phoneNumber = data["phoneNumber"] as! String
        self.requestLocation = data["requestLocation"] as! GeoPoint
        self.requestName = data["requestName"] as? String ?? "Not Founded"
        self.requestAddress = data["requestAddress"] as? String ?? "Not Founded"
        self.status = data["status"] as! Int
        
        if ((data["status"] as! Int == 1) || (data["status"] as! Int == 2)) {
            
            self.rescuerID = data["rescuerID"] as? String
            self.rescuerLocation = data["rescuerLocation"] as? GeoPoint
            self.requestName = data["requestName"] as? String ?? "Not Founded"
            self.requestAddress = data["requestAddress"] as? String ?? "Not Founded"
            self.rescuerName = data["rescuerName"] as? String
            
        }
    }
}
