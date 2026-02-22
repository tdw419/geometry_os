//! Tile - The Fundamental Unit of Life in Geometry OS
//!
//! A Tile represents a living organism in the evolutionary ecosystem.
//! Each Tile encapsulates the three biological layers:
//! - Genotype: Hereditary code and configuration
//! - Phenotype: Runtime expression and behavior
//! - Epigenetics: Dynamic state and learned adaptations

use serde::{Deserialize, Serialize};
use std::collections::HashMap;
use std::time::{SystemTime, UNIX_EPOCH};

/// Unique identifier for a Tile
pub type TileId = String;

/// Fitness score representing survival capability
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct FitnessScore {
    pub boot_time_ms: f64,
    pub stability_score: f64, // 0.0 to 1.0
    pub performance_score: f64, // 0.0 to 1.0
    pub user_utility: f64, // 0.0 to 1.0
    pub overall: f64, // Computed fitness
}

impl Default for FitnessScore {
    fn default() -> Self {
        Self {
            boot_time_ms: 0.0,
            stability_score: 1.0,
            performance_score: 0.5,
            user_utility: 0.5,
            overall: 0.5,
        }
    }
}

impl FitnessScore {
    /// Compute overall fitness from components
    pub fn compute_overall(&mut self) {
        // Weighted fitness function
        // Boot time: faster is better (inverse relationship)
        let boot_fitness = if self.boot_time_ms > 0.0 {
            (5000.0 / self.boot_time_ms).min(1.0) // Max 5s boot time
        } else {
            1.0
        };

        self.overall = (
            boot_fitness * 0.2 +
            self.stability_score * 0.3 +
            self.performance_score * 0.3 +
            self.user_utility * 0.2
        );
    }
}

/// Genotype: Hereditary material passed to offspring
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Genotype {
    /// Source code and configuration
    pub source_code: HashMap<String, String>, // filename -> content
    /// Kernel parameters
    pub kernel_params: HashMap<String, String>,
    /// System configuration
    pub config: HashMap<String, serde_json::Value>,
    /// Generation number
    pub generation: u32,
    /// Parent Tile IDs
    pub parents: Vec<TileId>,
}

impl Default for Genotype {
    fn default() -> Self {
        Self {
            source_code: HashMap::new(),
            kernel_params: HashMap::new(),
            config: HashMap::new(),
            generation: 0,
            parents: Vec::new(),
        }
    }
}

/// Phenotype: Runtime expression of the genotype
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Phenotype {
    /// Running state (VM, process, etc.)
    pub runtime_state: RuntimeState,
    /// Memory usage
    pub memory_usage: u64,
    /// CPU usage percentage
    pub cpu_usage: f64,
    /// Visual representation (texture/brick name)
    pub visual_brick: String,
    /// Active windows/surfaces
    pub active_surfaces: Vec<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum RuntimeState {
    /// Not running
    Dormant,
    /// Starting up
    Booting { start_time: f64 },
    /// Fully operational
    Running { pid: Option<u32>, vm_id: Option<String> },
    /// Crashed or failed
    Failed { error: String, timestamp: f64 },
}

impl Default for Phenotype {
    fn default() -> Self {
        Self {
            runtime_state: RuntimeState::Dormant,
            memory_usage: 0,
            cpu_usage: 0.0,
            visual_brick: "default.rts.png".to_string(),
            active_surfaces: Vec::new(),
        }
    }
}

/// Epigenetics: Runtime modifications and learned state
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Epigenetics {
    /// System logs and history
    pub logs: Vec<LogEntry>,
    /// User interaction history
    pub interaction_history: Vec<InteractionEvent>,
    /// Dynamic configurations learned at runtime
    pub learned_config: HashMap<String, serde_json::Value>,
    /// Cached data and optimizations
    pub cache_state: HashMap<String, Vec<u8>>,
    /// Last activity timestamp
    pub last_active: f64,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct LogEntry {
    pub timestamp: f64,
    pub level: String,
    pub message: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct InteractionEvent {
    pub timestamp: f64,
    pub event_type: String,
    pub data: serde_json::Value,
}

impl Default for Epigenetics {
    fn default() -> Self {
        Self {
            logs: Vec::new(),
            interaction_history: Vec::new(),
            learned_config: HashMap::new(),
            cache_state: HashMap::new(),
            last_active: current_timestamp(),
        }
    }
}

/// The Tile organism
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Tile {
    /// Unique identifier
    pub id: TileId,
    /// Position on infinite map
    pub position: (i32, i32),
    /// Hereditary material
    pub genotype: Genotype,
    /// Runtime expression
    pub phenotype: Phenotype,
    /// Dynamic state
    pub epigenetics: Epigenetics,
    /// Fitness score
    pub fitness: FitnessScore,
    /// Creation timestamp
    pub created_at: f64,
    /// Species/category
    pub species: String,
    /// Brightness/opacity (0.0 = faded/dying, 1.0 = thriving)
    pub vitality: f64,
}

impl Tile {
    /// Create a new Tile
    pub fn new(id: TileId, position: (i32, i32), species: String) -> Self {
        Self {
            id,
            position,
            genotype: Genotype::default(),
            phenotype: Phenotype::default(),
            epigenetics: Epigenetics::default(),
            fitness: FitnessScore::default(),
            created_at: current_timestamp(),
            species,
            vitality: 1.0,
        }
    }

    /// Create offspring from this tile
    pub fn reproduce(&self, new_id: TileId, new_position: (i32, i32)) -> Self {
        let mut offspring = Self::new(new_id, new_position, self.species.clone());

        // Inherit genotype with possible mutations
        offspring.genotype = self.genotype.clone();
        offspring.genotype.generation = self.genotype.generation + 1;
        offspring.genotype.parents = vec![self.id.clone()];

        // Reset phenotype and epigenetics for new instance
        offspring.phenotype = Phenotype::default();
        offspring.epigenetics = Epigenetics::default();

        // Inherit some learned config (Lamarckian inheritance)
        offspring.epigenetics.learned_config = self.epigenetics.learned_config.clone();

        offspring
    }

    /// Update fitness score
    pub fn update_fitness(&mut self) {
        self.fitness.compute_overall();
    }

    /// Apply natural selection pressure
    pub fn apply_selection_pressure(&mut self, pressure: f64) {
        // Reduce vitality based on fitness and pressure
        let decay = (1.0 - self.fitness.overall) * pressure;
        self.vitality = (self.vitality - decay).max(0.0);
    }

    /// Check if tile should die out
    pub fn should_die(&self) -> bool {
        self.vitality < 0.1 || matches!(self.phenotype.runtime_state, RuntimeState::Failed { .. })
    }

    /// Add log entry
    pub fn log(&mut self, level: &str, message: &str) {
        self.epigenetics.logs.push(LogEntry {
            timestamp: current_timestamp(),
            level: level.to_string(),
            message: message.to_string(),
        });
        self.epigenetics.last_active = current_timestamp();
    }

    /// Record user interaction
    pub fn record_interaction(&mut self, event_type: &str, data: serde_json::Value) {
        self.epigenetics.interaction_history.push(InteractionEvent {
            timestamp: current_timestamp(),
            event_type: event_type.to_string(),
            data,
        });
        self.epigenetics.last_active = current_timestamp();
    }
}

/// Current timestamp as f64
pub fn current_timestamp() -> f64 {
    SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .unwrap_or_default()
        .as_secs_f64()
}