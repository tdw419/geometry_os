//! Phase 46: Source City Loader - PROJECT OUROBOROS
//! "The Code Becomes the Map"
//!
//! Transforms the Geometry OS source code into a visual civilization on the Infinite Map.
//! Directories = Districts, Files = Buildings, Functions = Rooms.

use serde::{Deserialize, Serialize};
use std::collections::HashMap;
use std::fs;
use std::path::PathBuf;

/// Color RGB values
#[derive(Debug, Clone, Deserialize, Serialize)]
pub struct Color {
    pub r: f32,
    pub g: f32,
    pub b: f32,
}

/// A building representing a source file
#[derive(Debug, Clone, Deserialize, Serialize)]
pub struct SourceTile {
    pub id: String,
    pub path: String,
    pub x: f32,
    pub y: f32,
    pub width: f32,
    pub height: f32,
    pub depth: f32,
    #[serde(rename = "type")]
    pub tile_type: String,
    pub lines: u32,
    pub district: String,
    pub color: Color,
}

/// District summary
#[derive(Debug, Clone, Deserialize, Serialize)]
pub struct DistrictSummary {
    pub tile_count: usize,
    pub total_lines: u64,
    pub avg_complexity: f64,
    pub dominant_type: String,
}

/// Complete source city layout
#[derive(Debug, Clone, Deserialize, Serialize)]
pub struct SourceCityLayout {
    pub source_path: String,
    pub grid_size: u32,
    pub tile_count: usize,
    pub districts: HashMap<String, DistrictSummary>,
    pub tiles: Vec<SourceTile>,
}

/// Source City Loader for Project Ouroboros
pub struct SourceCityLoader {
    layout: Option<SourceCityLayout>,
    manifest_path: PathBuf,
}

impl SourceCityLoader {
    pub fn new(manifest_path: PathBuf) -> Self {
        Self {
            layout: None,
            manifest_path,
        }
    }

    /// Load the source city JSON from source_loader.py
    pub fn load(&mut self) -> Result<(), String> {
        if !self.manifest_path.exists() {
            return Err(format!("Source city JSON not found: {:?}", self.manifest_path));
        }

        let content = fs::read_to_string(&self.manifest_path)
            .map_err(|e| format!("Failed to read source city: {}", e))?;

        self.layout = serde_json::from_str(&content)
            .map_err(|e| format!("Failed to parse source city JSON: {}", e))?;

        log::info!("🏛️  Source City Loaded:");
        log::info!("    Source: {}", self.layout.as_ref().unwrap().source_path);
        log::info!("    Tiles: {}", self.layout.as_ref().unwrap().tile_count);
        log::info!("    Districts: {}", self.layout.as_ref().unwrap().districts.len());

        // Print district summary
        for (name, info) in self.layout.as_ref().unwrap().districts.iter() {
            log::info!("    📂 {}:", name);
            log::info!("       Files: {}", info.tile_count);
            log::info!("       Lines: {}", info.total_lines);
            log::info!("       Type: {}", info.dominant_type);
        }

        Ok(())
    }

    /// Get reference to loaded layout
    pub fn layout(&self) -> Option<&SourceCityLayout> {
        self.layout.as_ref()
    }

    /// Find tile at world coordinates (with tolerance)
    pub fn find_tile_at(&self, x: f32, y: f32, tolerance: f32) -> Option<&SourceTile> {
        let layout = self.layout.as_ref()?;

        for tile in &layout.tiles {
            let dx = (tile.x - x).abs();
            let dy = (tile.y - y).abs();
            if dx < tile.width / 2.0 + tolerance && dy < tile.height / 2.0 + tolerance {
                return Some(tile);
            }
        }

        None
    }

    /// Get all tiles in a district
    pub fn get_district_tiles(&self, district: &str) -> Vec<&SourceTile> {
        let layout = match &self.layout {
            Some(l) => l,
            None => return Vec::new(),
        };

        layout.tiles.iter()
            .filter(|t| t.district == district)
            .collect()
    }

    /// Convert Hilbert curve distance to 2D coordinates
    pub fn hilbert_d2xy(&self, n: u32, d: u32) -> (i32, i32) {
        let mut x = 0i32;
        let mut y = 0i32;
        let mut s = 1u32;
        let mut t = d;

        while s < n {
            let rx = 1 & (t / 2);
            let ry = 1 & (t ^ rx);

            if ry == 0 {
                if rx == 1 {
                    x = n as i32 - 1 - x;
                    y = n as i32 - 1 - y;
                }
                std::mem::swap(&mut x, &mut y);
            }

            x += s as i32 * rx as i32;
            y += s as i32 * ry as i32;
            t /= 4;
            s *= 2;
        }

        (x, y)
    }

    /// Convert 2D world coordinates to Hilbert distance (inverse of d2xy)
    pub fn world_to_hilbert(&self, x: i32, y: i32, n: u32) -> u32 {
        let mut s = 1u32;
        let mut d = 0u32;
        let mut cur_x = x as u32;
        let mut cur_y = y as u32;

        while s < n {
            let mask = s - 1;
            let rx = cur_x & mask;
            let ry = cur_y & mask;

            // Rotate/flip quadrant
            d += s * s * match (rx, ry) {
                (0, 0) => 0,
                (1, 0) => 1,
                (1, 1) => 2,
                (0, 1) => 3,
                _ => 0,
            };

            cur_x = if ry == 0 {
                if rx == 1 {
                    s - 1 - cur_x
                } else {
                    cur_x
                }
            } else {
                cur_x
            };

            std::mem::swap(&mut cur_x, &mut cur_y);
            cur_x += if ry == 0 && rx == 1 { s } else { 0 };
            cur_y += if ry == 0 && rx == 1 { s } else { 0 };

            s *= 2;
        }

        d
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_hilbert_coordinate() {
        let loader = SourceCityLoader::new(PathBuf::from("/tmp/test.json"));

        let coord = loader.hilbert_d2xy(256, 0);
        assert_eq!(coord, (0, 0));

        let coord = loader.hilbert_d2xy(256, 1);
        assert_eq!(coord, (0, 1));

        let coord = loader.hilbert_d2xy(256, 2);
        assert_eq!(coord, (1, 1));
    }
}
