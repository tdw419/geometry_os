// systems/infinite_map_rs/src/synapse/mod.rs
//
// The Synapse Module - Semantic routing logic for Geometry OS
// Connects human intent (LLM) to the geometric substrate.

pub mod intent;
pub mod morphology;
pub mod daemon_bridge;
pub mod synaptic_daemon_bridge;
pub mod vram_monitor;
pub mod entropy_monitor;
pub mod heuristics;
pub mod vector_bridge;
pub mod z_ai_client;

use serde::{Serialize, Deserialize};
use std::sync::Arc;
use tokio::sync::RwLock;

pub use intent::{Intent, IntentOverlay};
pub use morphology::{MorphologyCommand, MorphologyExecutor};
pub use daemon_bridge::CognitiveDaemonBridge;
pub use synaptic_daemon_bridge::SynapticDaemonBridge;
pub use heuristics::{MemoryHeuristics, MemoryType};
pub use vector_bridge::{Synapse, SynapticLayer};

/// Request for semantic memory analysis
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct MemoryAnalysisRequest {
    pub address: u64,
    pub length: usize,
    pub hex_dump: String,
    pub heuristics: MemoryHeuristics,
}


/// Commands sent from the Synaptic Bridge to the substrate (legacy)
#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum SynapticCommand {
    /// Navigate the camera to specific coordinates (x, y, z)
    Navigate(f32, f32, f32),
    /// Re-align the aesthetic parameters of the map (chaos_factor)
    RealignAesthetics(f32),
    /// Synthesize a new visual brick from description
    SynthesizeBrick(String),
}

/// The Synaptic Bridge state (legacy - being replaced by SynapticMap)
pub struct SynapticBridge {
    pub active_intent: Option<String>,
    pub confidence: f32,
    pub arousal: f32,
}

impl SynapticBridge {
    pub fn new() -> Self {
        Self {
            active_intent: None,
            confidence: 1.0,
            arousal: 0.0,
        }
    }

    pub fn set_intent(&mut self, intent: String) {
        log::info!("🧠 Synapse: New User Intent -> {}", intent);
        self.active_intent = Some(intent);
    }
}

/// The Synaptic Map - LLM-Powered Semantic Navigation Layer
/// 
/// Coordinates natural language intent with geometric transformations
pub struct SynapticMap {
    /// Bridge to the Cognitive Daemon (LLM)
    daemon: Arc<RwLock<CognitiveDaemonBridge>>,
    
    /// Intent overlay for capturing user input
    overlay: Arc<RwLock<IntentOverlay>>,
    
    /// Executor for morphology commands
    executor: Arc<RwLock<MorphologyExecutor>>,
    
    /// Active intent being processed
    active_intent: Arc<RwLock<Option<Intent>>>,
}

impl SynapticMap {
    /// Create a new Synaptic Map instance
    pub fn new(lm_studio_url: String) -> Self {
        Self {
            daemon: Arc::new(RwLock::new(CognitiveDaemonBridge::new(lm_studio_url))),
            overlay: Arc::new(RwLock::new(IntentOverlay::new())),
            executor: Arc::new(RwLock::new(MorphologyExecutor::new())),
            active_intent: Arc::new(RwLock::new(None)),
        }
    }
    
    /// Process a natural language intent
    pub async fn process_intent(&self, text: String) -> Result<Vec<MorphologyCommand>, String> {
        // Create intent
        let intent = Intent::new(text);
        *self.active_intent.write().await = Some(intent.clone());
        
        // Send to daemon for interpretation
        let daemon = self.daemon.read().await;
        let commands = daemon.interpret_intent(&intent).await?;
        
        Ok(commands)
    }
    
    /// Execute morphology commands on the visual substrate
    pub async fn execute_commands(&self, commands: Vec<MorphologyCommand>) -> Result<(), String> {
        let mut executor = self.executor.write().await;
        for cmd in commands {
            executor.execute(cmd).await?;
        }
        Ok(())
    }
    
    /// Get the current overlay state for rendering
    pub async fn get_overlay_state(&self) -> IntentOverlay {
        self.overlay.read().await.clone()
    }
    
    /// Update overlay with user input
    pub async fn update_overlay(&self, text: String) {
        let mut overlay = self.overlay.write().await;
        overlay.set_text(text);
    }
}
