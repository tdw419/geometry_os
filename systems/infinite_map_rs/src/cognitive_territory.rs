use crate::camera::Camera;
use crate::renderer::Renderer;
use std::collections::VecDeque;
use std::time::{SystemTime, UNIX_EPOCH};

#[derive(Clone, Debug)]
pub struct ThoughtParticle {
    pub x: f32,
    pub y: f32,
    pub intensity: f32,
    pub token: String,
    pub timestamp: u64,
}

pub struct CognitiveTerritory {
    pub center_x: f32,
    pub center_y: f32,
    pub radius: f32,
    pub active_thoughts: VecDeque<ThoughtParticle>,
    pub sentiment_color: (f32, f32, f32), // RGB
    pub creation_time: u64,
}

impl CognitiveTerritory {
    pub fn new() -> Self {
        let start = SystemTime::now();
        let timestamp = start.duration_since(UNIX_EPOCH).expect("Time went backwards").as_secs();

        Self {
            center_x: 8192.0, // "Antigravity Prime" coordinates
            center_y: 8192.0,
            radius: 1024.0,   // Initial domain size
            active_thoughts: VecDeque::new(),
            sentiment_color: (0.0, 1.0, 0.98), // Initial Cyan (Antigravity Signature)
            creation_time: timestamp,
        }
    }

    pub fn update(&mut self) {
        // Decay old particles
        let now = SystemTime::now().duration_since(UNIX_EPOCH).unwrap().as_secs();
        
        // Remove thoughts older than 10 seconds
        while let Some(thought) = self.active_thoughts.front() {
            if now - thought.timestamp > 10 {
                self.active_thoughts.pop_front();
            } else {
                break;
            }
        }
    }

    pub fn add_thought(&mut self, token: String, intensity: f32) {
        let now = SystemTime::now().duration_since(UNIX_EPOCH).unwrap().as_secs();
        
        // Arrange particles in a spiral around the center (The Spire)
        let count = self.active_thoughts.len() as f32;
        let angle = count * 0.5; // Spiral factor
        let dist = 50.0 + (count * 2.0); // Expand outwards
        
        self.active_thoughts.push_back(ThoughtParticle {
            x: self.center_x + angle.cos() * dist,
            y: self.center_y + angle.sin() * dist,
            intensity,
            token,
            timestamp: now,
        });
    }

    pub fn get_render_state(&self) -> serde_json::Value {
        serde_json::json!({
            "type": "cognitive_territory",
            "center": { "x": self.center_x, "y": self.center_y },
            "radius": self.radius,
            "sentiment": self.sentiment_color,
            "particle_count": self.active_thoughts.len()
        })
    }
}
