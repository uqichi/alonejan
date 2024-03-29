//
//  Player.swift
//  AloneJan
//
//  Created by 田村 優吉 on 2016/06/23.
//  Copyright © 2016年 田村 優吉. All rights reserved.
//

import Foundation

class Player {
    
    var wind: WindType
    
    var point: Int
    
    var hand: [Tile]
    
    var discarded: [Tile]
    
    init(wind: WindType, point: Int = 25000) {
        self.wind = wind
        self.point = point
        self.hand = []
        self.discarded = []
    }
    
    func drawFrom(inout stack: [Tile], count: Int = 1) {
        if stack.isEmpty {
            return
        }
        for _ in 0 ..< count {
            let tsumo = stack.removeLast()
            hand.append(tsumo)
        }
    }
    
    func discardHand(index: Int) {
        self.discarded.append(hand.removeAtIndex(index))
    }
    
    func discardTsumo() {
        self.discarded.append(hand.removeLast())
    }
    
    func sortHand() {
        hand.sortInPlace({(t1, t2) -> Bool in
            if t1.type.rawValue != t2.type.rawValue {
                return t1.type.rawValue < t2.type.rawValue
            }
            return t1.number < t2.number
        })
    }
    
}