use serde::Deserialize;
use std::collections::HashMap;
use std::path::PathBuf;
use std::time::SystemTime;
use std::fs;

#[derive(Debug, Clone, Deserialize)]
pub struct BrickEntry {
    pub brick: String,
    pub timestamp: f64,
}

pub struct MapLoader {
    manifest_path: PathBuf,
    pub entries: HashMap<(i32, i32), BrickEntry>,
    last_modified: Option<SystemTime>,
}

impl MapLoader {
    pub fn new(manifest_path: PathBuf) -> Self {
        Self {
            manifest_path,
            entries: HashMap::new(),
            last_modified: None,
        }
    }

    pub fn check_updates(&mut self) -> Result<bool, String> {
        if !self.manifest_path.exists() {
            return Ok(false);
        }

        let metadata = fs::metadata(&self.manifest_path)
            .map_err(|e| format!("Failed to read metadata: {}", e))?;
        
        let modified = metadata.modified()
            .map_err(|e| format!("Failed to get modification time: {}", e))?;

        if self.last_modified.is_none() || Some(modified) != self.last_modified {
            // Reload
            self.load_manifest()?;
            self.last_modified = Some(modified);
            return Ok(true);
        }

        Ok(false)
    }

    fn load_manifest(&mut self) -> Result<(), String> {
        let content = fs::read_to_string(&self.manifest_path)
            .map_err(|e| format!("Failed to read manifest: {}", e))?;
        
        if content.trim().is_empty() {
            return Ok(());
        }

        // Parse into temporary map with string keys "x,y"
        let raw_entries: HashMap<String, BrickEntry> = match serde_json::from_str(&content) {
            Ok(entries) => entries,
            Err(e) => {
                // If parsing fails (e.g. valid JSON but empty or schema mismatch), log warn and return 
                log::warn!("MapLoader: JSON parse error: {}", e);
                return Err(e.to_string());
            }
        };

        // Convert to (i32, i32) keys
        self.entries.clear();
        for (key, entry) in raw_entries {
            let coords: Vec<&str> = key.split(',').collect();
            if coords.len() == 2 {
                if let (Ok(x), Ok(y)) = (coords[0].trim().parse::<i32>(), coords[1].trim().parse::<i32>()) {
                    self.entries.insert((x, y), entry);
                }
            }
        }
        
        log::info!("🗺️  MapLoader: Loaded {} tiles from manifest", self.entries.len());
        Ok(())
    }
}
