//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onKeyPressed(_ sender: UIButton) {
        playSound(filename: sender.currentTitle!)
        
        sender.alpha = 0.5
        print("Start \(sender.currentTitle!)")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1
            print("End \(sender.currentTitle!)")
        }
    }
    
    func playSound(filename: String) {
        let url = Bundle.main.url(forResource: filename, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

