//! Cognitive Module for ACE-RTS Integration
//!
//! This module provides the infrastructure for running Autonomous Cognitive Entities
//! as "living textures" on the Geometry OS infinite map.
//!
//! # Architecture
//!
//! The cognitive module consists of several key components:
//!
//! - **Entity Type**: Classification of textures (Static/Executable/CognitiveEntity)
//! - **Entity Manager**: Lifecycle management for cognitive entities
//! - **Binary Extractor**: Extracts ACE binaries from .rts.png textures
//! - **ACE Runtime**: WASM runtime for executing cognitive logic
//! - **Host Functions**: Texture operations accessible from WASM
//! - **Texture Updater**: Real-time texture updates during thinking
//! - **Phase 46 Agents**: Autonomous inhabitants of Source City
//!
//! # Usage
//!
//! ```rust
//! use crate::cognitive::{CognitiveEntityManager, TextureType, agents::CityAgentManager};
//!
//! // Detect texture type
//! let texture_type = TextureType::from_metadata(&metadata);
//!
//! // Register entity if cognitive
//! if matches!(texture_type, TextureType::CognitiveEntity) {
//!     manager.register_entity(texture_path)?;
//! }
//!
//! // Spawn autonomous agent
//! let mut agent_mgr = CityAgentManager::new(256);
//! agent_mgr.spawn_agent(AgentRole::Scout, 1000);
//! ```

pub mod binary_extractor;
pub mod entity_manager;
pub mod entity_type;
pub mod ace_runtime;
pub mod host_functions;
pub mod texture_updater;

// Phase 46: Autonomous Agents
pub mod agents;
pub mod hilbert_pathfinder;

// Re-export common types
pub use entity_type::{EntityType, RTSMetadata};
pub use entity_manager::{CognitiveEntityManager, ACEEntity, EntityState};
pub use host_functions::register_host_functions;
pub use binary_extractor::ACEBinaryExtractor;
pub use ace_runtime::{ACERuntime, ACEState};
pub use texture_updater::TextureUpdater;

// Phase 46 exports
pub use agents::{CityAgent, CityAgentManager, AgentRole, AgentState, AgentGoal, GoalType};
pub use hilbert_pathfinder::{HilbertPathfinder, HilbertPath, Waypoint, PathStrategy, assign_navigation_goal};

use anyhow::Result;

/// Cognitive module version
pub const VERSION: &str = env!("CARGO_PKG_VERSION");

/// Initialize cognitive system
///
/// This function initializes the cognitive system and should be called
/// during compositor startup.
pub fn init() -> Result<()> {
    log::info!("Initializing ACE-RTS Cognitive System v{}", VERSION);

    // Initialize any global state here
    // (e.g., shared memory pools, thread pools, etc.)

    Ok(())
}
