//
//  MessageThread.swift
//  MessageBoard
//
//  Created by Christopher Aronson on 5/8/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

import Foundation

class MessageThread: Codable, Equatable {
    // MARK: - Properties
    let title: String
    let identifier: String
    var messages: [MessageThread.Message]
    
    // MARK: - JSON Struct
    struct Message: Codable, Equatable {
        let text: String
        let sender: String
        let timeStamp: Date
        
        init(text: String, sender: String, timeStamp: Date = Date()) {
            self.text = text
            self.sender = sender
            self.timeStamp = timeStamp
        }
        
    }
    
    // MARK: - Init and Functions
    init(title: String, identifier: String = UUID().uuidString, messages: [MessageThread.Message] = []) {
        self.title = title
        self.identifier = identifier
        self.messages = messages
    }
    
    static func == (lhs: MessageThread, rhs: MessageThread) -> Bool {
        return lhs.identifier == rhs.identifier && lhs.title == rhs.title && lhs.messages == rhs.messages
    }
}
