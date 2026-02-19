//! Cognitive Bond Graph for aggregating pulse volume between tiles.

use std::collections::HashMap;
use serde::{Serialize, Deserialize};

use super::TileId;

/// Type of cognitive bond between tiles
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
pub enum BondType {
    /// Violet pulses (spatial/cognitive reasoning)
    Cognitive,
    /// Cyan pulses (semantic/meaning transfer)
    Semantic,
    /// Both types present
    Hybrid,
}

/// A bond representing accumulated pulse volume between two tiles
#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct CognitiveBond {
    pub source: TileId,
    pub dest: TileId,
    /// Normalized strength from 0.0 to 1.0
    pub strength: f64,
    pub bond_type: BondType,
    /// Raw pulse count in the aggregation window
    pub pulse_count: u64,
}

/// Graph of cognitive bonds derived from pulse aggregation
pub struct CognitiveBondGraph {
    /// Edge weights: (source, dest) -> (volume, pulse_count)
    edges: HashMap<(TileId, TileId), (f64, u64)>,

    /// Track pulse types per edge for bond classification
    edge_types: HashMap<(TileId, TileId), BondType>,

    /// Total pulse volume per tile (for normalization)
    tile_volume: HashMap<TileId, f64>,

    /// Maximum volume seen (for normalization)
    max_volume: f64,
}

impl CognitiveBondGraph {
    pub fn new() -> Self {
        Self {
            edges: HashMap::new(),
            edge_types: HashMap::new(),
            tile_volume: HashMap::new(),
            max_volume: 1.0, // Avoid division by zero
        }
    }

    /// Add a pulse event to the graph
    pub fn add_pulse(&mut self, source: TileId, dest: TileId, volume: f64, is_cognitive: bool) {
        // Ensure consistent edge ordering (smaller id first)
        let edge_key = if source < dest {
            (source, dest)
        } else {
            (dest, source)
        };

        // Update edge weight
        let entry = self.edges.entry(edge_key).or_insert((0.0, 0));
        entry.0 += volume;
        entry.1 += 1;

        // Track pulse type
        let type_entry = self.edge_types.entry(edge_key).or_insert(
            if is_cognitive { BondType::Cognitive } else { BondType::Semantic }
        );
        *type_entry = match (*type_entry, is_cognitive) {
            (BondType::Cognitive, false) | (BondType::Semantic, true) => BondType::Hybrid,
            other => other.0,
        };

        // Update tile volumes
        *self.tile_volume.entry(source).or_insert(0.0) += volume;
        *self.tile_volume.entry(dest).or_insert(0.0) += volume;

        // Update max for normalization
        if entry.0 > self.max_volume {
            self.max_volume = entry.0;
        }
    }

    /// Get all bonds above the minimum strength threshold
    pub fn get_bonds(&self, min_strength: f64) -> Vec<CognitiveBond> {
        self.edges
            .iter()
            .map(|((source, dest), (volume, count))| {
                let strength = volume / self.max_volume;
                let bond_type = self.edge_types.get(&(*source, *dest))
                    .copied()
                    .unwrap_or(BondType::Hybrid);

                CognitiveBond {
                    source: *source,
                    dest: *dest,
                    strength,
                    bond_type,
                    pulse_count: *count,
                }
            })
            .filter(|b| b.strength >= min_strength)
            .collect()
    }

    /// Get the top N bonds by strength
    pub fn get_top_bonds(&self, n: usize) -> Vec<CognitiveBond> {
        let mut bonds = self.get_bonds(0.0);
        bonds.sort_by(|a, b| b.strength.partial_cmp(&a.strength).unwrap());
        bonds.into_iter().take(n).collect()
    }

    /// Get total pulse volume for a tile
    pub fn get_tile_volume(&self, tile: TileId) -> f64 {
        self.tile_volume.get(&tile).copied().unwrap_or(0.0)
    }

    /// Get all tiles that have activity
    pub fn active_tiles(&self) -> Vec<TileId> {
        self.tile_volume.keys().copied().collect()
    }

    /// Clear all accumulated data (for new aggregation window)
    pub fn clear(&mut self) {
        self.edges.clear();
        self.edge_types.clear();
        self.tile_volume.clear();
        self.max_volume = 1.0;
    }

    /// Get statistics about the bond graph
    pub fn stats(&self) -> BondGraphStats {
        BondGraphStats {
            total_edges: self.edges.len(),
            total_volume: self.edges.values().map(|(v, _)| v).sum(),
            total_pulses: self.edges.values().map(|(_, c)| c).sum(),
            active_tiles: self.tile_volume.len(),
        }
    }
}

impl Default for CognitiveBondGraph {
    fn default() -> Self {
        Self::new()
    }
}

#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct BondGraphStats {
    pub total_edges: usize,
    pub total_volume: f64,
    pub total_pulses: u64,
    pub active_tiles: usize,
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_bond_graph_basic() {
        let mut graph = CognitiveBondGraph::new();

        // Add some pulses
        graph.add_pulse(0, 1, 10.0, true);  // Cognitive
        graph.add_pulse(0, 1, 5.0, false);  // Semantic -> becomes Hybrid
        graph.add_pulse(1, 2, 20.0, false); // Semantic

        let bonds = graph.get_bonds(0.0);
        assert_eq!(bonds.len(), 2);

        // Check bond types
        let bond_0_1 = bonds.iter().find(|b|
            (b.source == 0 && b.dest == 1) || (b.source == 1 && b.dest == 0)
        ).unwrap();
        assert_eq!(bond_0_1.bond_type, BondType::Hybrid);

        let bond_1_2 = bonds.iter().find(|b|
            (b.source == 1 && b.dest == 2) || (b.source == 2 && b.dest == 1)
        ).unwrap();
        assert_eq!(bond_1_2.bond_type, BondType::Semantic);
    }

    #[test]
    fn test_bond_graph_normalization() {
        let mut graph = CognitiveBondGraph::new();

        graph.add_pulse(0, 1, 100.0, true);
        graph.add_pulse(1, 2, 50.0, true);

        let bonds = graph.get_bonds(0.0);
        assert_eq!(bonds.len(), 2);

        // First bond should have strength 1.0 (max volume)
        let bond_0_1 = bonds.iter().find(|b| b.strength > 0.9).unwrap();
        assert!((bond_0_1.strength - 1.0).abs() < 0.01);

        // Second bond should have strength 0.5
        let bond_1_2 = bonds.iter().find(|b| b.strength < 0.6).unwrap();
        assert!((bond_1_2.strength - 0.5).abs() < 0.01);
    }

    #[test]
    fn test_top_bonds() {
        let mut graph = CognitiveBondGraph::new();

        graph.add_pulse(0, 1, 100.0, true);
        graph.add_pulse(1, 2, 80.0, true);
        graph.add_pulse(2, 3, 60.0, true);
        graph.add_pulse(3, 4, 40.0, true);

        let top_2 = graph.get_top_bonds(2);
        assert_eq!(top_2.len(), 2);
        assert!(top_2[0].strength >= top_2[1].strength);
    }
}
