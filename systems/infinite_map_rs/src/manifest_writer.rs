//! Manifest Writer - Shared State Bridge between Compositor and Visual Shell
//!
//! This module handles writing tile updates to the shared manifest.json file
//! that the PixiJS visual shell reads from. This enables the two systems to
//! share coordinate system and tile state.

use serde::{Deserialize, Serialize};
use std::collections::HashMap;
use std::fs;
use std::path::{Path, PathBuf};
use std::sync::{Arc, Mutex};
use std::time::{SystemTime, UNIX_EPOCH};

/// Tile entry in the manifest
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct TileEntry {
    /// Name of the brick/texture file (without extension or with .rts.png)
    pub brick: String,
    /// Unix timestamp when this tile was last updated
    pub timestamp: f64,
}

/// Manifest writer that synchronizes tile state with the visual shell
pub struct ManifestWriter {
    /// Path to the manifest.json file
    path: PathBuf,
    /// In-memory cache of tiles
    tiles: Arc<Mutex<HashMap<String, TileEntry>>>,
}

impl ManifestWriter {
    /// Create a new manifest writer
    ///
    /// # Arguments
    /// * `path` - Path to the manifest.json file (default: systems/builder/map/manifest.json)
    pub fn new<P: AsRef<Path>>(path: P) -> Result<Self, std::io::Error> {
        let path = path.as_ref().to_path_buf();
        
        // Load existing manifest if it exists
        let tiles = if path.exists() {
            let content = fs::read_to_string(&path)?;
            serde_json::from_str(&content).unwrap_or_default()
        } else {
            HashMap::new()
        };

        Ok(Self {
            path,
            tiles: Arc::new(Mutex::new(tiles)),
        })
    }

    /// Create a manifest writer with the default path
    pub fn default() -> Result<Self, std::io::Error> {
        Self::new("systems/builder/map/manifest.json")
    }

    /// Update or add a tile at the given coordinates
    ///
    /// # Arguments
    /// * `x` - Grid X coordinate
    /// * `y` - Grid Y coordinate
    /// * `brick_name` - Name of the brick/texture file
    pub fn update_tile(&self, x: i32, y: i32, brick_name: String) {
        let key = format!("{},{}", x, y);
        let timestamp = SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .unwrap()
            .as_secs_f64();

        let mut tiles = self.tiles.lock().unwrap();
        tiles.insert(key.clone(), TileEntry {
            brick: brick_name,
            timestamp,
        });

        // Write to disk
        if let Err(e) = self.write_manifest(&tiles) {
            eprintln!("Failed to write manifest: {}", e);
        } else {
            log::debug!("Updated tile at ({}, {}): {}", x, y, key);
        }
    }

    /// Remove a tile at the given coordinates
    pub fn remove_tile(&self, x: i32, y: i32) {
        let key = format!("{},{}", x, y);
        let mut tiles = self.tiles.lock().unwrap();
        
        if tiles.remove(&key).is_some() {
            if let Err(e) = self.write_manifest(&tiles) {
                eprintln!("Failed to write manifest: {}", e);
            }
        }
    }

    /// Get a tile entry at the given coordinates
    pub fn get_tile(&self, x: i32, y: i32) -> Option<TileEntry> {
        let key = format!("{},{}", x, y);
        let tiles = self.tiles.lock().unwrap();
        tiles.get(&key).cloned()
    }

    /// Get all tiles in the manifest
    pub fn get_all_tiles(&self) -> HashMap<String, TileEntry> {
        let tiles = self.tiles.lock().unwrap();
        tiles.clone()
    }

    /// Write the manifest to disk
    fn write_manifest(&self, tiles: &HashMap<String, TileEntry>) -> Result<(), std::io::Error> {
        // Ensure parent directory exists
        if let Some(parent) = self.path.parent() {
            fs::create_dir_all(parent)?;
        }

        let json = serde_json::to_string_pretty(tiles)?;
        fs::write(&self.path, json)?;
        Ok(())
    }

    /// Get a clone of the tiles Arc for sharing across threads
    pub fn get_tiles_arc(&self) -> Arc<Mutex<HashMap<String, TileEntry>>> {
        Arc::clone(&self.tiles)
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use tempfile::tempdir;

    #[test]
    fn test_manifest_writer() {
        let dir = tempdir().unwrap();
        let manifest_path = dir.path().join("test_manifest.json");
        
        let writer = ManifestWriter::new(&manifest_path).unwrap();
        
        // Add a tile
        writer.update_tile(0, 0, "test_brick.rts.png".to_string());
        
        // Verify it was written
        let content = fs::read_to_string(&manifest_path).unwrap();
        let manifest: HashMap<String, TileEntry> = serde_json::from_str(&content).unwrap();
        
        assert!(manifest.contains_key("0,0"));
        assert_eq!(manifest["0,0"].brick, "test_brick.rts.png");
    }
}
