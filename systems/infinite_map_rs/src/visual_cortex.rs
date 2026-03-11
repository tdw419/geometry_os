use std::path::Path;
use image::{ImageBuffer, Rgba};
use std::time::{SystemTime, UNIX_EPOCH};

pub struct VisualCortex {
    pub output_path: String,
    pub last_capture: u64,
    pub capture_interval_ms: u64,
}

impl VisualCortex {
    pub fn new(output_path: &str) -> Self {
        VisualCortex {
            output_path: output_path.to_string(),
            last_capture: 0,
            capture_interval_ms: 5000, // 5 seconds default
        }
    }

    pub fn should_capture(&self) -> bool {
        let now = SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .unwrap()
            .as_millis() as u64;
        now - self.last_capture > self.capture_interval_ms
    }

    pub fn save_retina(
        &mut self, 
        data: Vec<u8>, 
        width: u32, 
        height: u32,
        neuro: Option<crate::cortex::Neuromodulator>,
        focus: Option<(f32, f32, f32)> // x, y, zoom
    ) -> Result<(), Box<dyn std::error::Error>> {
        let img: ImageBuffer<Rgba<u8>, Vec<u8>> = ImageBuffer::from_raw(width, height, data)
            .ok_or("Failed to create image buffer from raw data")?;
        
        img.save(&self.output_path)?;
        
        self.last_capture = SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .unwrap()
            .as_millis() as u64;

        // Also save metadata sidecar for the AI to read
        let meta_path = format!("{}.meta.json", self.output_path);
        
        let (dop, ach, urg) = if let Some(n) = neuro {
            (n.dopamine, n.acetylcholine, n.urgency)
        } else {
            (0.5, 0.5, 0.0)
        };
        
        let (fx, fy, fz) = focus.unwrap_or((0.0, 0.0, 1.0));

        let meta = serde_json::json!({
            "timestamp": self.last_capture,
            "width": width,
            "height": height,
            "format": "PixelRTS-2.0-RETINA",
            "cognitive_state": {
                "dopamine": dop,
                "acetylcholine": ach,
                "urgency": urg
            },
            "proprioception": {
                "x": fx,
                "y": fy,
                "zoom": fz
            }
        });
        std::fs::write(meta_path, serde_json::to_string_pretty(&meta)?)?;

        Ok(())
    }

    pub fn save_eye_artifact(
        &mut self,
        data: Vec<u8>,
        width: u32,
        height: u32,
        tile_id: Option<usize>,
        source: Option<String>
    ) -> Result<(), Box<dyn std::error::Error>> {
        let name = if let Some(id) = tile_id {
            format!("eye_artifact_{}.png", id)
        } else if let Some(s) = source {
            format!("eye_artifact_{}.png", s)
        } else {
            "eye_artifact_latest.png".to_string()
        };

        let path = std::path::Path::new("systems/visual_shell/artifacts").join(name);
        
        // Ensure directory exists
        if let Some(parent) = path.parent() {
            let _ = std::fs::create_dir_all(parent);
        }

        let img: ImageBuffer<Rgba<u8>, Vec<u8>> = ImageBuffer::from_raw(width, height, data)
            .ok_or("Failed to create image buffer")?;
        
        img.save(path)?;
        Ok(())
    }
}
