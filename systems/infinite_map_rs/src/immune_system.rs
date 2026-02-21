//! Immune System - Crash Detection and Automated Repair
//!
//! Detects system failures and applies automated fixes to maintain ecosystem health.
//! Implements the "immune response" aspect of the evolutionary paradigm.

use crate::tile::{Tile, RuntimeState};
use crate::infinite_map::InfiniteMap;
use std::collections::HashMap;
use serde::{Deserialize, Serialize};

/// Immune system for detecting and repairing system failures
pub struct ImmuneSystem {
    /// Known failure patterns and their fixes
    failure_patterns: HashMap<String, FailurePattern>,
    /// Repair history
    repair_history: Vec<RepairEvent>,
    /// Quarantine zone for infected tiles
    quarantine: HashMap<String, QuarantinedTile>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct FailurePattern {
    pub error_signature: String,
    pub repair_strategy: RepairStrategy,
    pub success_rate: f64,
    pub detection_count: u32,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum RepairStrategy {
    /// Restart the tile
    Restart,
    /// Roll back to parent genotype
    Rollback,
    /// Apply specific code patch
    Patch { code_changes: HashMap<String, String> },
    /// Isolate the tile
    Quarantine,
    /// Replace with healthy clone
    CloneReplace { source_tile_id: String },
}

#[derive(Debug, Clone)]
pub struct RepairEvent {
    pub tile_id: String,
    pub failure_type: String,
    pub strategy_applied: RepairStrategy,
    pub success: bool,
    pub timestamp: f64,
}

#[derive(Debug, Clone)]
pub struct QuarantinedTile {
    pub tile: Tile,
    pub quarantine_time: f64,
    pub infection_level: f64,
}

impl ImmuneSystem {
    pub fn new() -> Self {
        let mut system = Self {
            failure_patterns: HashMap::new(),
            repair_history: Vec::new(),
            quarantine: HashMap::new(),
        };

        system.initialize_patterns();
        system
    }

    /// Initialize common failure patterns
    fn initialize_patterns(&mut self) {
        let patterns = vec![
            FailurePattern {
                error_signature: "segmentation fault".to_string(),
                repair_strategy: RepairStrategy::Rollback,
                success_rate: 0.6,
                detection_count: 0,
            },
            FailurePattern {
                error_signature: "out of memory".to_string(),
                repair_strategy: RepairStrategy::Patch {
                    code_changes: HashMap::new(), // Would contain memory optimization patches
                },
                success_rate: 0.4,
                detection_count: 0,
            },
            FailurePattern {
                error_signature: "kernel panic".to_string(),
                repair_strategy: RepairStrategy::Quarantine,
                success_rate: 0.8,
                detection_count: 0,
            },
            FailurePattern {
                error_signature: "boot timeout".to_string(),
                repair_strategy: RepairStrategy::Restart,
                success_rate: 0.7,
                detection_count: 0,
            },
        ];

        for pattern in patterns {
            self.failure_patterns.insert(pattern.error_signature.clone(), pattern);
        }
    }

    /// Scan tiles for failures and apply immune response
    pub fn scan_and_repair(&mut self, map: &mut InfiniteMap) {
        let mut repairs_needed = Vec::new();

        // Find tiles that have failed
        for tile in map.get_all_tiles() {
            if let RuntimeState::Failed { error, .. } = &tile.phenotype.runtime_state {
                repairs_needed.push((tile.id.clone(), error.clone()));
            }
        }

        // Apply repairs
        for (tile_id, error) in repairs_needed {
            self.apply_immune_response(&tile_id, &error, map);
        }

        // Check quarantine for recovery
        self.check_quarantine_recovery(map);
    }

    /// Apply immune response to a failed tile
    fn apply_immune_response(&mut self, tile_id: &str, error: &str, map: &mut InfiniteMap) {
        // Find matching failure pattern
        let strategy = self.match_failure_pattern(error);

        let success = match &strategy {
            RepairStrategy::Restart => self.restart_tile(tile_id, map),
            RepairStrategy::Rollback => self.rollback_tile(tile_id, map),
            RepairStrategy::Patch { .. } => self.patch_tile(tile_id, map),
            RepairStrategy::Quarantine => self.quarantine_tile(tile_id, map),
            RepairStrategy::CloneReplace { source_tile_id } => {
                self.clone_replace_tile(tile_id, source_tile_id, map)
            }
        };

        // Record repair event
        self.repair_history.push(RepairEvent {
            tile_id: tile_id.to_string(),
            failure_type: error.to_string(),
            strategy_applied: strategy,
            success,
            timestamp: crate::tile::current_timestamp(),
        });

        // Update pattern success rate
        if let Some(pattern) = self.failure_patterns.get_mut(error) {
            pattern.detection_count += 1;
            // Simple success rate update
            pattern.success_rate = (pattern.success_rate * (pattern.detection_count - 1) as f64 + success as i32 as f64) / pattern.detection_count as f64;
        }
    }

    /// Match error to failure pattern
    fn match_failure_pattern(&self, error: &str) -> RepairStrategy {
        for (signature, pattern) in &self.failure_patterns {
            if error.to_lowercase().contains(&signature.to_lowercase()) {
                return pattern.repair_strategy.clone();
            }
        }

        // Default to quarantine for unknown errors
        RepairStrategy::Quarantine
    }

    /// Restart a failed tile
    fn restart_tile(&self, tile_id: &str, map: &mut InfiniteMap) -> bool {
        if let Some(tile) = map.get_tile_mut(&tile_id.to_string()) {
            // Reset runtime state
            tile.phenotype.runtime_state = RuntimeState::Dormant;
            tile.phenotype.memory_usage = 0;
            tile.phenotype.cpu_usage = 0.0;
            tile.vitality = (tile.vitality * 0.8).max(0.1); // Slight vitality penalty

            tile.log("info", "Tile restarted by immune system");
            true
        } else {
            false
        }
    }

    /// Roll back tile to parent genotype
    fn rollback_tile(&self, tile_id: &str, map: &mut InfiniteMap) -> bool {
        let parent_genotype_and_id = {
            let tile = match map.get_tile(&tile_id.to_string()) {
                Some(t) => t,
                None => return false,
            };
            if let Some(parent_id) = tile.genotype.parents.first() {
                if let Some(parent) = map.get_tile(parent_id) {
                    Some((parent.genotype.clone(), parent_id.clone()))
                } else {
                    None
                }
            } else {
                None
            }
        };

        if let Some((parent_genotype, parent_id)) = parent_genotype_and_id {
            if let Some(tile) = map.get_tile_mut(&tile_id.to_string()) {
                tile.genotype = parent_genotype;
                tile.phenotype.runtime_state = RuntimeState::Dormant;
                tile.log("info", &format!("Rolled back to parent {}", parent_id));
                return true;
            }
        }
        false
    }

    /// Apply code patches to tile
    fn patch_tile(&self, tile_id: &str, map: &mut InfiniteMap) -> bool {
        // Placeholder for patch application
        // In a real implementation, this would apply specific code changes
        if let Some(tile) = map.get_tile_mut(&tile_id.to_string()) {
            tile.log("info", "Applied automated patch");
            tile.phenotype.runtime_state = RuntimeState::Dormant;
            true
        } else {
            false
        }
    }

    /// Quarantine an infected tile
    fn quarantine_tile(&mut self, tile_id: &str, map: &mut InfiniteMap) -> bool {
        if let Some(tile) = map.remove_tile(&tile_id.to_string()) {
            let quarantined = QuarantinedTile {
                tile,
                quarantine_time: crate::tile::current_timestamp(),
                infection_level: 0.8, // High infection level
            };

            self.quarantine.insert(tile_id.to_string(), quarantined);
            true
        } else {
            false
        }
    }

    /// Replace failed tile with healthy clone
    fn clone_replace_tile(&self, tile_id: &str, source_id: &str, map: &mut InfiniteMap) -> bool {
        if let Some(source) = map.get_tile(&source_id.to_string()) {
            // Create clone at same position
            let position = map.get_tile(&tile_id.to_string())
                .map(|t| t.position)
                .unwrap_or((0, 0));

            let mut clone = source.reproduce(format!("{}_clone", tile_id), position);
            clone.log("info", &format!("Cloned from {} to replace {}", source_id, tile_id));

            map.add_tile(clone);
            true
        } else {
            false
        }
    }

    /// Check quarantined tiles for recovery
    fn check_quarantine_recovery(&mut self, map: &mut InfiniteMap) {
        let current_time = crate::tile::current_timestamp();
        let mut to_release = Vec::new();

        for (tile_id, quarantined) in &mut self.quarantine {
            // Simple recovery: reduce infection over time
            quarantined.infection_level *= 0.95;

            if quarantined.infection_level < 0.1 {
                to_release.push(tile_id.clone());
            }
        }

        for tile_id in to_release {
            if let Some(quarantined) = self.quarantine.remove(&tile_id) {
                // Attempt to reintroduce the tile
                let mut tile = quarantined.tile;
                tile.log("info", "Released from quarantine");
                tile.vitality *= 0.5; // Penalty for being infected

                map.add_tile(tile);
            }
        }
    }

    /// Get immune system statistics
    pub fn get_statistics(&self) -> ImmuneStats {
        let total_repairs = self.repair_history.len();
        let successful_repairs = self.repair_history.iter().filter(|r| r.success).count();
        let success_rate = if total_repairs > 0 {
            successful_repairs as f64 / total_repairs as f64
        } else {
            1.0
        };

        ImmuneStats {
            total_repairs,
            successful_repairs,
            success_rate,
            quarantined_tiles: self.quarantine.len(),
            known_patterns: self.failure_patterns.len(),
        }
    }
}

/// Immune system statistics
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ImmuneStats {
    pub total_repairs: usize,
    pub successful_repairs: usize,
    pub success_rate: f64,
    pub quarantined_tiles: usize,
    pub known_patterns: usize,
}