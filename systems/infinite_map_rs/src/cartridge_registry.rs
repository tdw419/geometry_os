//! Cartridge Registry - Tracks dynamically created software cartridges

use serde::{Deserialize, Serialize};
use std::collections::HashMap;
use std::time::SystemTime;

/// Entry for a dynamically created cartridge
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct CartridgeEntry {
    /// Unique cartridge identifier
    pub id: String,
    /// Path to the .rts.png file
    pub path: String,
    /// X spawn position on infinite map
    pub spawn_x: f32,
    /// Y spawn position on infinite map
    pub spawn_y: f32,
    /// Generation number
    pub generation: u64,
    /// Fitness score
    pub fitness: f32,
    /// Creation timestamp
    pub created_at: SystemTime,
}

/// Registry for tracking dynamically created cartridges
#[derive(Debug, Clone, Default)]
pub struct CartridgeRegistry {
    entries: HashMap<String, CartridgeEntry>,
}

impl CartridgeRegistry {
    /// Create a new cartridge registry
    pub fn new() -> Self {
        Self {
            entries: HashMap::new(),
        }
    }

    /// Add a cartridge entry
    pub fn add_entry(&mut self, entry: CartridgeEntry) {
        self.entries.insert(entry.id.clone(), entry);
    }

    /// Get entry by ID
    pub fn get_entry(&self, id: &str) -> Option<&CartridgeEntry> {
        self.entries.get(id)
    }

    /// Get entry at/near position (with tolerance in pixels)
    pub fn get_entry_at_position(&self, x: f32, y: f32, tolerance: f32) -> Option<&CartridgeEntry> {
        self.entries.values().find(|entry| {
            (entry.spawn_x - x).abs() < tolerance
                && (entry.spawn_y - y).abs() < tolerance
        })
    }

    /// Get all entries
    pub fn get_all_entries(&self) -> Vec<&CartridgeEntry> {
        self.entries.values().collect()
    }

    /// Get entry count
    pub fn len(&self) -> usize {
        self.entries.len()
    }

    /// Check if empty
    pub fn is_empty(&self) -> bool {
        self.entries.is_empty()
    }
}
