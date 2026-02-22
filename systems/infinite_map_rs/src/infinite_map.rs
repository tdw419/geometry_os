//! Infinite Map - Spatial Phylogeny of the Evolutionary Ecosystem
//!
//! The Infinite Map represents evolutionary time as space, where:
//! - X,Y coordinates = phylogenetic position
//! - Distance from origin = evolutionary time/generations
//! - Clusters = species/species
//! - Brightness = vitality/fitness
//! - Color = species type

use crate::tile::{Tile, TileId, FitnessScore};
use std::collections::{HashMap, HashSet};
use serde::{Deserialize, Serialize};
use std::sync::{Arc, Mutex};

/// The Infinite Map ecosystem
#[derive(Debug)]
pub struct InfiniteMap {
    /// All tiles in the ecosystem
    tiles: HashMap<TileId, Tile>,
    /// Tiles by position for spatial queries
    position_index: HashMap<(i32, i32), TileId>,
    /// Species populations
    species_populations: HashMap<String, HashSet<TileId>>,
    /// Phylogeny graph: child -> parents
    phylogeny: HashMap<TileId, Vec<TileId>>,
    /// Selection pressure (0.0 to 1.0)
    selection_pressure: f64,
    /// Evolution rate (mutations per generation)
    evolution_rate: f64,
}

impl InfiniteMap {
    pub fn new() -> Self {
        Self {
            tiles: HashMap::new(),
            position_index: HashMap::new(),
            species_populations: HashMap::new(),
            phylogeny: HashMap::new(),
            selection_pressure: 0.1, // Default 10% pressure
            evolution_rate: 0.05, // Default 5% mutation rate
        }
    }

    /// Add a tile to the map
    pub fn add_tile(&mut self, mut tile: Tile) {
        let id = tile.id.clone();
        let position = tile.position;
        let species = tile.species.clone();

        // Remove any existing tile at this position
        if let Some(existing_id) = self.position_index.get(&position) {
            // Move existing tile to a new position
            let new_pos = self.find_empty_position_near(position);
            if let Some(existing_tile) = self.tiles.get_mut(existing_id) {
                existing_tile.position = new_pos;
                self.position_index.insert(new_pos, existing_id.clone());
            }
        }

        // Add to phylogeny if it has parents
        for parent_id in &tile.genotype.parents {
            self.phylogeny.entry(parent_id.clone())
                .or_insert_with(Vec::new)
                .push(id.clone());
        }

        // Add to species population
        self.species_populations.entry(species)
            .or_insert_with(HashSet::new)
            .insert(id.clone());

        // Add to maps
        self.tiles.insert(id.clone(), tile);
        self.position_index.insert(position, id);
    }

    /// Remove a tile from the map
    pub fn remove_tile(&mut self, tile_id: &TileId) -> Option<Tile> {
        if let Some(tile) = self.tiles.remove(tile_id) {
            // Remove from position index
            self.position_index.remove(&tile.position);

            // Remove from species population
            if let Some(population) = self.species_populations.get_mut(&tile.species) {
                population.remove(tile_id);
                if population.is_empty() {
                    self.species_populations.remove(&tile.species);
                }
            }

            // Remove from phylogeny (children will still reference it)
            self.phylogeny.remove(tile_id);

            Some(tile)
        } else {
            None
        }
    }

    /// Get tile by ID
    pub fn get_tile(&self, tile_id: &TileId) -> Option<&Tile> {
        self.tiles.get(tile_id)
    }

    /// Get tile by position
    pub fn get_tile_at(&self, position: (i32, i32)) -> Option<&Tile> {
        self.position_index.get(&position)
            .and_then(|id| self.tiles.get(id))
    }

    /// Get mutable tile by ID
    pub fn get_tile_mut(&mut self, tile_id: &TileId) -> Option<&mut Tile> {
        self.tiles.get_mut(tile_id)
    }

    /// Get all tiles
    pub fn get_all_tiles(&self) -> Vec<&Tile> {
        self.tiles.values().collect()
    }

    /// Get tiles by species
    pub fn get_species_tiles(&self, species: &str) -> Vec<&Tile> {
        self.species_populations.get(species)
            .map(|population| {
                population.iter()
                    .filter_map(|id| self.tiles.get(id))
                    .collect()
            })
            .unwrap_or_default()
    }

    /// Get phylogenetic children of a tile
    pub fn get_children(&self, tile_id: &TileId) -> Vec<&Tile> {
        self.phylogeny.get(tile_id)
            .map(|children| {
                children.iter()
                    .filter_map(|id| self.tiles.get(id))
                    .collect()
            })
            .unwrap_or_default()
    }

    /// Get phylogenetic ancestors of a tile
    pub fn get_ancestors(&self, tile_id: &TileId) -> Vec<&Tile> {
        let mut ancestors = Vec::new();
        let mut to_visit = vec![tile_id];

        while let Some(current_id) = to_visit.pop() {
            if let Some(tile) = self.tiles.get(current_id) {
                for parent_id in &tile.genotype.parents {
                    if let Some(parent) = self.tiles.get(parent_id) {
                        ancestors.push(parent);
                        to_visit.push(parent_id);
                    }
                }
            }
        }

        ancestors
    }

    /// Apply natural selection to all tiles
    pub fn apply_natural_selection(&mut self) {
        let mut to_remove = Vec::new();

        for (id, tile) in &mut self.tiles {
            tile.apply_selection_pressure(self.selection_pressure);

            if tile.should_die() {
                to_remove.push(id.clone());
            }
        }

        for id in to_remove {
            self.remove_tile(&id);
        }
    }

    /// Trigger evolution: create offspring from fit tiles
    pub fn evolve(&mut self) {
        let mut new_tiles = Vec::new();

        for tile in self.tiles.values() {
            if tile.fitness.overall > 0.7 && tile.vitality > 0.8 {
                // Fit tile can reproduce
                let offspring_pos = self.find_empty_position_near(tile.position);
                let offspring_id = format!("{}_gen{}", tile.id, tile.genotype.generation + 1);

                let mut offspring = tile.reproduce(offspring_id, offspring_pos);

                // Apply mutations
                self.mutate_tile(&mut offspring);

                new_tiles.push(offspring);
            }
        }

        for tile in new_tiles {
            self.add_tile(tile);
        }
    }

    /// Apply mutations to a tile with gradient-guided exploration
    fn mutate_tile(&self, tile: &mut Tile) {
        // Use fitness landscape information to guide mutation direction
        let current_fitness = tile.fitness.overall;

        // Adaptive mutation rate based on fitness
        // Higher fitness = more conservative mutations (exploit)
        // Lower fitness = more exploratory mutations (explore)
        let adaptive_rate = if current_fitness > 0.7 {
            self.evolution_rate * 0.5 // Conservative when doing well
        } else {
            self.evolution_rate * 2.0 // Exploratory when struggling
        }.min(1.0);

        if rand::random::<f64>() < adaptive_rate {
            // Choose mutation strategy based on fitness landscape
            if current_fitness < 0.5 {
                // In low-fitness regions: try larger, riskier changes
                self.apply_exploratory_mutation(tile);
            } else {
                // In high-fitness regions: try small, safe improvements
                self.apply_exploitative_mutation(tile);
            }
        }
    }

    /// Exploratory mutations for low-fitness regions (hill climbing)
    fn apply_exploratory_mutation(&self, tile: &mut Tile) {
        // Try more significant changes when fitness is poor
        // These have higher risk but potentially higher reward

        // Example: Add new features or restructure code
        for (key, value) in &mut tile.genotype.kernel_params {
            if rand::random::<f64>() < 0.2 { // 20% chance per param
                // Try parameter variations
                *value = self.generate_parameter_variant(value);
            }
        }
    }

    /// Exploitative mutations for high-fitness regions (local optimization)
    fn apply_exploitative_mutation(&self, tile: &mut Tile) {
        // Small, safe changes when already performing well
        // Focus on fine-tuning existing good configurations

        for (key, value) in &mut tile.genotype.kernel_params {
            if rand::random::<f64>() < 0.05 { // 5% chance per param
                // Minor adjustments only
                *value = self.generate_minor_variant(value);
            }
        }
    }

    /// Generate parameter variant for exploration
    fn generate_parameter_variant(&self, current: &str) -> String {
        // Simple example: try doubling/halving numeric values
        if let Ok(num) = current.parse::<i32>() {
            if rand::random::<bool>() {
                (num * 2).to_string()
            } else {
                (num / 2).max(1).to_string()
            }
        } else {
            format!("{}_variant", current)
        }
    }

    /// Generate minor parameter adjustment
    fn generate_minor_variant(&self, current: &str) -> String {
        // Small incremental changes
        if let Ok(num) = current.parse::<i32>() {
            let delta = if rand::random::<bool>() { 1 } else { -1 };
            (num + delta).max(0).to_string()
        } else {
            current.to_string() // No change for non-numeric
        }
    }

    /// Find an empty position near the given coordinates
    fn find_empty_position_near(&self, (x, y): (i32, i32)) -> (i32, i32) {
        let mut radius: i32 = 1;
        loop {
            for dx in -radius..=radius {
                for dy in -radius..=radius {
                    if dx.abs() == radius || dy.abs() == radius {
                        let pos = (x + dx, y + dy);
                        if !self.position_index.contains_key(&pos) {
                            return pos;
                        }
                    }
                }
            }
            radius += 1;
            if radius > 100 { // Prevent infinite loop
                return (x + rand::random::<i32>() % 20 - 10, y + rand::random::<i32>() % 20 - 10);
            }
        }
    }

    /// Set selection pressure
    pub fn set_selection_pressure(&mut self, pressure: f64) {
        self.selection_pressure = pressure.clamp(0.0, 1.0);
    }

    /// Set evolution rate
    pub fn set_evolution_rate(&mut self, rate: f64) {
        self.evolution_rate = rate.clamp(0.0, 1.0);
    }

    /// Get map statistics
    pub fn get_statistics(&self) -> MapStatistics {
        let total_tiles = self.tiles.len();
        let total_species = self.species_populations.len();
        let avg_fitness = if total_tiles > 0 {
            self.tiles.values().map(|t| t.fitness.overall).sum::<f64>() / total_tiles as f64
        } else {
            0.0
        };

        let avg_vitality = if total_tiles > 0 {
            self.tiles.values().map(|t| t.vitality).sum::<f64>() / total_tiles as f64
        } else {
            0.0
        };

        MapStatistics {
            total_tiles,
            total_species,
            avg_fitness,
            avg_vitality,
            selection_pressure: self.selection_pressure,
            evolution_rate: self.evolution_rate,
        }
    }
}

/// Map statistics
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct MapStatistics {
    pub total_tiles: usize,
    pub total_species: usize,
    pub avg_fitness: f64,
    pub avg_vitality: f64,
    pub selection_pressure: f64,
    pub evolution_rate: f64,
}

/// Gardening actions for user interaction
pub enum GardeningAction {
    Plant { species: String, position: (i32, i32) },
    Prune { tile_id: TileId },
    Water { tile_id: TileId, amount: f64 }, // Boost vitality
    Graft { source_id: TileId, target_id: TileId, feature: String },
}

impl InfiniteMap {
    /// Execute a gardening action
    pub fn execute_gardening_action(&mut self, action: GardeningAction) {
        match action {
            GardeningAction::Plant { species, position } => {
                let tile_id = format!("planted_{}_{}", position.0, position.1);
                let mut tile = Tile::new(tile_id, position, species);
                // Initialize with basic genotype
                tile.genotype.source_code.insert("init.sh".to_string(), "#!/bin/bash\necho 'Hello World'".to_string());
                self.add_tile(tile);
            }
            GardeningAction::Prune { tile_id } => {
                self.remove_tile(&tile_id);
            }
            GardeningAction::Water { tile_id, amount } => {
                if let Some(tile) = self.tiles.get_mut(&tile_id) {
                    tile.vitality = (tile.vitality + amount).min(1.0);
                    tile.record_interaction("watering", serde_json::json!({ "amount": amount }));
                }
            }
            GardeningAction::Graft { source_id, target_id, feature } => {
                // First get the source code and clone it
                if let Some(source_code) = self.tiles.get(&source_id)
                    .and_then(|s| s.genotype.source_code.get(&feature))
                    .cloned() {
                    // Then get mutable target
                    if let Some(target) = self.tiles.get_mut(&target_id) {
                        target.genotype.source_code.insert(feature.clone(), source_code);
                        target.log("info", &format!("Grafted feature '{}' from {}", feature, source_id));
                    }
                }
            }
        }
    }
}