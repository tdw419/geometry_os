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
//! ```ignore
//! use infinite_map_rs::cognitive::{CognitiveEntityManager, EntityType, agents::CityAgentManager, AgentRole};
//!
//! // Detect texture type
//! let entity_type = EntityType::from_metadata(&metadata);
//!
//! // Register entity if cognitive
//! if matches!(entity_type, EntityType::CognitiveEntity) {
//!     manager.register_entity(&texture_path)?;
//! }
//!
//! // Spawn autonomous agent
//! let mut agent_mgr = CityAgentManager::new(256);
//! agent_mgr.spawn_agent(AgentRole::Scout, 1000);
//! ```

pub mod ace_runtime;
pub mod binary_extractor;
pub mod entity_manager;
pub mod entity_type;
pub mod host_functions;
pub mod texture_updater;

// Phase 46: Autonomous Agents
pub mod agents;
pub mod hilbert_pathfinder;

// Re-export common types
pub use ace_runtime::{ACERuntime, ACEState};
pub use binary_extractor::ACEBinaryExtractor;
pub use entity_manager::{ACEEntity, CognitiveEntityManager, EntityState};
pub use entity_type::{EntityType, RTSMetadata};
pub use host_functions::register_host_functions;
pub use texture_updater::TextureUpdater;

// Phase 46 exports
pub use agents::{AgentGoal, AgentRole, AgentState, CityAgent, CityAgentManager, GoalType};
pub use hilbert_pathfinder::{
    assign_navigation_goal, HilbertPath, HilbertPathfinder, PathStrategy, Waypoint,
};

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
