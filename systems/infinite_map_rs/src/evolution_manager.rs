#![allow(dead_code, unused_imports, unused_variables)]
//! Evolution Manager - Integration with Evolution Daemon
//!
//! This module manages the connection to the evolution daemon, handles
//! neural state updates, and provides evolution metrics visualization.

use crate::evolution_protocol::{
    EvolutionClient, EvolutionMetrics, NeuralStateData, NeuralStateUpdate, MessageType, SelfState, TheoryOfMindState, CognitiveState,
    DaemonSyncPacket, TokenVisualizationData, EvolvedGenomeData,
};
use crate::neural_state_texture::{NeuralStateTexture, NeuralVisualizationMode, NeuralRendererConfig};
use crate::evolution_daemon_wrapper::PyEvolutionDaemon;
use std::sync::{Arc, Mutex};
use std::time::{Duration, Instant};
use std::collections::HashMap;
use wgpu::{self, Device, Queue};

// Phase 40.3: Neural Link
use crate::synapse::z_ai_client::ZAiClient;
use crate::cognitive::agents::AgentRole;

// Phase 35.9: Cartridge tracking
use crate::cartridge_registry::{CartridgeEntry, CartridgeRegistry};

/// Evolution manager state
pub struct EvolutionManager {
    client: Arc<Mutex<EvolutionClient>>,
    embedded_daemon: Option<Arc<Mutex<PyEvolutionDaemon>>>,
    neural_texture: Option<NeuralStateTexture>,
    metrics: Option<EvolutionMetrics>,
    // Multi-daemon support: daemon_id -> (state, strength)
    daemon_states: HashMap<String, (NeuralStateData, f32)>,
    composite_state: Option<NeuralStateData>,
    self_state: Option<SelfState>,
    theory_of_mind: Option<TheoryOfMindState>,
    cognitive_state: Option<CognitiveState>,
    token_visualization: Option<TokenVisualizationData>,
    last_update: Instant,
    update_interval: Duration,
    connected: bool,
    config: NeuralRendererConfig,
    // Phase 40.3: Z.ai Integration
    zai_client: Option<ZAiClient>,
    // Phase 35.9: Cartridge tracking
    cartridge_registry: CartridgeRegistry,
    sib_path: String,
    last_sib_check: Instant,
}

impl Clone for EvolutionManager {
    fn clone(&self) -> Self {
        Self {
            client: Arc::clone(&self.client),
            embedded_daemon: self.embedded_daemon.clone(),
            neural_texture: None, // Texture cannot be cloned, will be re-initialized
            metrics: self.metrics.clone(),
            daemon_states: self.daemon_states.clone(),
            composite_state: self.composite_state.clone(),
            self_state: self.self_state.clone(),
            theory_of_mind: self.theory_of_mind.clone(),
            cognitive_state: self.cognitive_state.clone(),
            token_visualization: self.token_visualization.clone(),
            last_update: self.last_update,
            update_interval: self.update_interval,
            connected: self.connected,
            config: self.config.clone(),
            zai_client: None,
            cartridge_registry: self.cartridge_registry.clone(),
            sib_path: self.sib_path.clone(),
            last_sib_check: self.last_sib_check,
        }
    }
}

impl EvolutionManager {
    /// Create a new evolution manager
    pub fn new(socket_path: String) -> Self {
        let client = Arc::new(Mutex::new(EvolutionClient::new(&socket_path)));
        // Initialize Z.ai client if API key is present
        let zai_client = std::env::var("ZAI_API_KEY").ok().map(ZAiClient::new);

        Self {
            client,
            embedded_daemon: None,
            neural_texture: None,
            metrics: None,
            daemon_states: HashMap::new(),
            composite_state: None,
            self_state: None,
            theory_of_mind: None,
            cognitive_state: None,
            token_visualization: None,
            last_update: Instant::now(),
            update_interval: Duration::from_millis(500), // 2Hz update rate
            connected: false,
            config: NeuralRendererConfig::default(),
            zai_client,
            cartridge_registry: CartridgeRegistry::new(),
            sib_path: "/tmp/geometry_os_sib.json".to_string(),
            last_sib_check: Instant::now(),
        }
    }

    /// Set the embedded daemon instance
    pub fn set_embedded_daemon(&mut self, daemon: Arc<Mutex<PyEvolutionDaemon>>) {
        self.embedded_daemon = Some(daemon);
        eprintln!("✅ Evolution Manager: Embedded Python daemon attached");
    }

    /// Initialize the evolution manager
    pub fn initialize(&mut self, device: &Device, width: u32, height: u32) {
        // Create neural state texture
        self.neural_texture = Some(NeuralStateTexture::new(device, width, height));
        
        // Try to connect to daemon
        self.connect();
    }

    /// Connect to evolution daemon
    pub fn connect(&mut self) {
        let mut client = self.client.lock().unwrap();
        match client.connect() {
            Ok(()) => {
                self.connected = true;
                eprintln!("✅ Connected to evolution daemon");
            }
            Err(e) => {
                self.connected = false;
                eprintln!("⚠️  Failed to connect to evolution daemon: {}", e);
            }
        }
    }

    /// Check if connected to daemon
    pub fn is_connected(&self) -> bool {
        self.connected
    }

    /// Update evolution state (call this periodically)
    pub fn update(&mut self, device: &Device, queue: &Queue) {
        let now = Instant::now();
        
        // Only update at specified interval
        if now.duration_since(self.last_update) < self.update_interval {
            return;
        }

        self.last_update = now;

        // Phase 35.9: Poll for cartridge resonances
        self.poll_cartridge_resonances();

        // Try to fetch metrics
        self.fetch_metrics();
        
        // Try to fetch neural state
        self.fetch_neural_state();
        

        // Try to fetch theory of mind state
        self.fetch_theory_of_mind();
        
        // Try to fetch cognitive state (Phase 27)
        self.fetch_cognitive_state();
        
        // Update texture if we have neural data
        if let (Some(composite_state), Some(ref mut texture)) = (&self.composite_state, &mut self.neural_texture) {
            texture.update_from_neural_state(
                device,
                queue,
                composite_state,
                self.self_state.as_ref(),
                self.theory_of_mind.as_ref()
            );
        }
    }

    /// Fetch evolution metrics from daemon
    fn fetch_metrics(&mut self) {
        // Try embedded daemon first
        if let Some(daemon_arc) = self.embedded_daemon.as_ref().map(|d| Arc::clone(d)) {
            if let Ok(daemon) = daemon_arc.lock() {
                if let Ok(metrics) = daemon.get_metrics() {
                    self.metrics = Some(metrics);
                    log::debug!("📊 Evolution metrics updated (embedded)");
                    return;
                }
            }
        }

        if !self.connected {
            return;
        }
        
        let msg_result = {
            let mut client = self.client.lock().unwrap();
            client.request_metrics()
        };

        match msg_result {
            Ok(msg) => {
                if msg.message_type == MessageType::MetricsUpdate {
                    if let Ok(metrics) = serde_json::from_value::<EvolutionMetrics>(msg.payload) {
                        self.metrics = Some(metrics);
                        log::debug!("📊 Evolution metrics updated (socket)");
                    }
                }
            }
            Err(e) => {
                log::warn!("⚠️  Failed to fetch metrics: {}", e);
                self.connected = false;
            }
        }
    }

    /// Update neural state from a daemon update
    fn update_neural_state(&mut self, update: NeuralStateUpdate) {
        // Update the daemon's private state
        self.daemon_states.insert(update.daemon_id, (update.data, update.strength));
        // Recompute the composite state
        self.compute_composite_state();
    }

    /// Compute the composite neural state by blending all daemon states
    fn compute_composite_state(&mut self) {
        if self.daemon_states.is_empty() {
            self.composite_state = None;
            return;
        }

        // Start with the first daemon's state as base
        let mut composite = self.daemon_states.values().next().unwrap().0.clone();
        let total_strength: f32 = self.daemon_states.values().map(|(_, s)| s).sum();

        if total_strength == 0.0 {
            self.composite_state = Some(composite);
            return;
        }

        // Blend using weighted average for each field
        // For vectors, blend element-wise
        let mut layer_activations = vec![0.0; composite.layer_activations.len()];
        let mut attention_weights = vec![0.0; composite.attention_weights.len()];
        let mut memory_patterns = vec![0.0; composite.memory_patterns.len()];
        let mut thought_vector = vec![0.0; composite.thought_vector.len()];

        let mut confidence = 0.0;
        let mut cognitive_load = 0.0;
        let mut attention_focus = [0.0, 0.0];
        let mut emotional_valence = 0.0;
        let mut arousal = 0.0;

        for (state, strength) in self.daemon_states.values() {
            let weight = strength / total_strength;
            for (i, &val) in state.layer_activations.iter().enumerate() {
                if i < layer_activations.len() {
                    layer_activations[i] += val * weight;
                }
            }
            for (i, &val) in state.attention_weights.iter().enumerate() {
                if i < attention_weights.len() {
                    attention_weights[i] += val * weight;
                }
            }
            for (i, &val) in state.memory_patterns.iter().enumerate() {
                if i < memory_patterns.len() {
                    memory_patterns[i] += val * weight;
                }
            }
            for (i, &val) in state.thought_vector.iter().enumerate() {
                if i < thought_vector.len() {
                    thought_vector[i] += val * weight;
                }
            }
            confidence += state.confidence * weight;
            cognitive_load += state.cognitive_load * weight;
            attention_focus[0] += state.attention_focus[0] * weight;
            attention_focus[1] += state.attention_focus[1] * weight;
            emotional_valence += state.emotional_valence * weight;
            arousal += state.arousal * weight;
        }

        composite.layer_activations = layer_activations;
        composite.attention_weights = attention_weights;
        composite.memory_patterns = memory_patterns;
        composite.thought_vector = thought_vector;
        composite.confidence = confidence;
        composite.cognitive_load = cognitive_load;
        composite.attention_focus = attention_focus;
        composite.emotional_valence = emotional_valence;
        composite.arousal = arousal;

        // For non-numeric fields, take from the strongest daemon
        let strongest_daemon = self.daemon_states.values().max_by(|a, b| a.1.partial_cmp(&b.1).unwrap()).unwrap();
        composite.thought_stream = strongest_daemon.0.thought_stream.clone();
        composite.active_regions = strongest_daemon.0.active_regions.clone();
        composite.self_state = strongest_daemon.0.self_state.clone();
        composite.theory_of_mind = strongest_daemon.0.theory_of_mind.clone();
        composite.cognitive_state = strongest_daemon.0.cognitive_state.clone();
        composite.audio_features = strongest_daemon.0.audio_features.clone();
        composite.input_state = strongest_daemon.0.input_state.clone();
        composite.token_visualization = strongest_daemon.0.token_visualization.clone();

        self.composite_state = Some(composite);
    }

    /// Fetch neural state from daemon
    fn fetch_neural_state(&mut self) {
        // Try embedded daemon first
        if let Some(daemon_arc) = self.embedded_daemon.as_ref().map(|d| Arc::clone(d)) {
            if let Ok(daemon) = daemon_arc.lock() {
                if let Ok(neural_state) = daemon.get_neural_state() {
                    // For embedded daemon, use default daemon_id and strength
                    let update = NeuralStateUpdate {
                        daemon_id: "embedded_evolution".to_string(),
                        strength: 1.0,
                        data: neural_state,
                    };
                    self.update_neural_state(update);
                    log::debug!("🧠 Neural state updated (embedded)");
                    return;
                }
            }
        }

        if !self.connected {
            return;
        }

        let msg_result = {
            let mut client = self.client.lock().unwrap();
            client.request_neural_state()
        };

        match msg_result {
            Ok(msg) => {
                if msg.message_type == MessageType::NeuralStateUpdate {
                    if let Ok(update) = serde_json::from_value::<NeuralStateUpdate>(msg.payload.clone()) {
                        self.update_neural_state(update);
                        log::debug!("🧠 Neural state updated (socket)");
                    } else if let Ok(neural_state) = serde_json::from_value::<NeuralStateData>(msg.payload) {
                        // Fallback for old format
                        let update = NeuralStateUpdate {
                            daemon_id: "legacy_daemon".to_string(),
                            strength: 1.0,
                            data: neural_state,
                        };
                        self.update_neural_state(update);
                        log::debug!("🧠 Neural state updated (legacy socket)");
                    }
                }
            }
            Err(e) => {
                log::warn!("⚠️  Failed to fetch neural state: {}", e);
                self.connected = false;
            }
        }
    }

    /// Fetch self state from daemon
    fn fetch_self_state(&mut self) {
        if !self.connected {
            return;
        }

        let msg_result = {
            let mut client = self.client.lock().unwrap();
            client.request_self_state()
        };

        match msg_result {
            Ok(msg) => {
                if msg.message_type == MessageType::SelfStateUpdate {
                    if let Ok(state) = serde_json::from_value::<SelfState>(msg.payload) {
                        self.self_state = Some(state);
                    }
                }
            }
            Err(e) => {
                log::warn!("⚠️  Failed to fetch self state: {}", e);
            }
        }
    }

    /// Fetch theory of mind state from daemon
    fn fetch_theory_of_mind(&mut self) {
        if !self.connected {
            return;
        }

        let msg_result = {
            let mut client = self.client.lock().unwrap();
            client.request_theory_of_mind()
        };

        match msg_result {
            Ok(msg) => {
                if msg.message_type == MessageType::TheoryOfMindUpdate {
                    if let Ok(state) = serde_json::from_value::<TheoryOfMindState>(msg.payload) {
                        self.theory_of_mind = Some(state);
                    }
                }
            }
            Err(e) => {
                log::warn!("⚠️  Failed to fetch theory of mind state: {}", e);
            }
        }
    }


    /// Fetch harmonic daemon synchronization update (Phase 2)
    pub fn fetch_daemon_sync(&mut self) -> Option<DaemonSyncPacket> {
        if !self.connected {
            return None;
        }

        let msg_result = {
            let mut client = self.client.lock().unwrap();
            client.request_daemon_sync()
        };

        match msg_result {
            Ok(msg) => {
                if msg.message_type == MessageType::DaemonStatesUpdate {
                    if let Ok(packet) = serde_json::from_value::<DaemonSyncPacket>(msg.payload) {
                        return Some(packet);
                    }
                }
            }
            Err(e) => {
                log::warn!("⚠️  Failed to fetch daemon sync: {}", e);
            }
        }
        None
    }

    /// Fetch cognitive state from daemon (Phase 27)
    fn fetch_cognitive_state(&mut self) {
        // Try embedded daemon first
        if let Some(daemon_arc) = self.embedded_daemon.as_ref().map(|d| Arc::clone(d)) {
            if let Ok(daemon) = daemon_arc.lock() {
                if let Ok(state) = daemon.get_cognitive_state() {
                    self.cognitive_state = Some(state);
                    return;
                }
            }
        }

        if !self.connected {
            return;
        }

        let msg_result = {
            let mut client = self.client.lock().unwrap();
            client.request_cognitive_state()
        };

        match msg_result {
            Ok(msg) => {
                if msg.message_type == MessageType::CognitiveStateUpdate {
                    if let Ok(state) = serde_json::from_value::<CognitiveState>(msg.payload) {
                        self.cognitive_state = Some(state);
                    }
                }
            }
            Err(e) => {
                log::warn!("⚠️  Failed to fetch cognitive state: {}", e);
            }
        }
    }

    /// Get current evolution metrics
    pub fn get_metrics(&self) -> Option<&EvolutionMetrics> {
        self.metrics.as_ref()
    }

    /// Get current neural state (composite)
    pub fn get_neural_state(&self) -> Option<&NeuralStateData> {
        self.composite_state.as_ref()
    }
    
    /// Get current cognitive state (Phase 27)
    pub fn get_cognitive_state(&self) -> Option<&CognitiveState> {
        self.cognitive_state.as_ref()
    }

    /// Get neural state texture view for rendering
    pub fn get_neural_texture_view(&self) -> Option<&wgpu::TextureView> {
        self.neural_texture.as_ref().map(|t| t.view())
    }

    /// Get neural state texture
    pub fn get_neural_texture(&self) -> Option<&wgpu::Texture> {
        self.neural_texture.as_ref().map(|t| t.texture())
    }

    /// Get neural texture size
    pub fn get_neural_texture_size(&self) -> Option<(u32, u32)> {
        self.neural_texture.as_ref().map(|t| t.size())
    }

    /// Set visualization mode
    pub fn set_visualization_mode(&mut self, mode: NeuralVisualizationMode) {
        self.config.mode = mode;
    }

    /// Get visualization mode
    pub fn get_visualization_mode(&self) -> NeuralVisualizationMode {
        self.config.mode
    }

    /// Set brightness
    pub fn set_brightness(&mut self, brightness: f32) {
        self.config.brightness = brightness.clamp(0.0, 2.0);
    }

    /// Set contrast
    pub fn set_contrast(&mut self, contrast: f32) {
        self.config.contrast = contrast.clamp(0.5, 2.0);
    }

    /// Toggle grid display
    pub fn toggle_grid(&mut self) {
        self.config.show_grid = !self.config.show_grid;
    }

    /// Get renderer config
    pub fn get_config(&self) -> &NeuralRendererConfig {
        &self.config
    }

    /// Send heartbeat to daemon
    pub fn send_heartbeat(&mut self) {
        if !self.connected {
            return;
        }

        let mut client = self.client.lock().unwrap();
        if let Err(e) = client.send_heartbeat() {
            log::warn!("⚠️  Failed to send heartbeat: {}", e);
            self.connected = false;
        }
    }

    /// Disconnect from daemon
    pub fn disconnect(&mut self) {
        let mut client = self.client.lock().unwrap();
        client.disconnect();
        self.connected = false;
        log::info!("🔌 Disconnected from evolution daemon");
    }

    /// Get metrics as formatted string for display
    pub fn get_metrics_display(&self) -> String {
        if let Some(metrics) = &self.metrics {
            format!(
                "Generation: {}\n\
                 Pressure: {:.2}\n\
                 Success Rate: {:.1}%\n\
                 Avg Compile: {:.2}s\n\
                 Visual Renders: {}\n\
                 Components Built: {}\n\
                 Health: {}",
                metrics.generation,
                metrics.pressure_score,
                metrics.compilation_success_rate * 100.0,
                metrics.avg_compilation_time,
                metrics.visual_renders,
                metrics.components_built,
                metrics.health_status
            )
        } else {
            "No metrics available".to_string()
        }
    }

    /// Get neural state summary for display
    pub fn get_neural_summary(&self) -> String {
        if let Some(state) = &self.composite_state {
            format!(
                "Daemons: {}\n\
                 Layers: {}\n\
                 Attention: {}\n\
                 Memory: {}\n\
                 Confidence: {:.2}",
                self.daemon_states.len(),
                state.layer_activations.len(),
                state.attention_weights.len(),
                state.memory_patterns.len(),
                state.confidence
            )
        } else {
            "No neural state available".to_string()
        }
    }

    /// Get token visualization data
    pub fn get_token_visualization(&self) -> Option<&TokenVisualizationData> {
        self.token_visualization.as_ref()
    }

    /// Update token visualization data
    pub fn update_token_visualization(&mut self, token_data: TokenVisualizationData) {
        self.token_visualization = Some(token_data);
    }

    /// Get the evolution client (for visual feedback)
    pub fn get_client(&self) -> Arc<Mutex<EvolutionClient>> {
        Arc::clone(&self.client)
    }

    /// Phase 41: Send input event (Game Mode)
    pub fn send_input_event(&mut self, key: u32) {
        if !self.connected {
            return;
        }

        let mut client = self.client.lock().unwrap();
        if let Err(e) = client.send_input_event(key) {
            log::warn!("⚠️  Failed to send input event: {}", e);
            self.connected = false;
        }
    }

    /// Convert evolved genome to Rust configuration
    pub fn genome_to_rust_config(&self, genome: &EvolvedGenomeData) -> String {
        // This is a placeholder for the actual conversion logic
        // In a real implementation, this would parse the genome's metadata
        // and generating a Rust struct initialization string
        format!(
            "pub const GENOME_{}: GenomeConfig = GenomeConfig {{ \
                id: \"{}\", \
                generation: {}, \
                fitness: {:.2}, \
                data_len: {} \
            }};", 
            genome.id.replace("-", "_"),
            genome.id,
            genome.generation,
            genome.fitness,
            genome.data.len()
        )
    }

    /// Write evolved genome to map (or send to daemon)
    pub fn write_evolved_genome(&mut self, genome: EvolvedGenomeData) {
        if !self.connected {
            return;
        }

        // Convert the genome to a protocol message
        let payload = serde_json::to_value(&genome).unwrap_or(serde_json::Value::Null);
        
        let message = crate::evolution_protocol::ProtocolMessage::new(
            MessageType::WriteEvolvedGenome,
            0,
            payload
        );

        let mut client = self.client.lock().unwrap();
        if let Err(e) = client.send_message(message) {
            log::warn!("⚠️  Failed to write evolved genome: {}", e);
            self.connected = false;
        } else {
            log::info!("🧬 Wrote evolved genome {} (Gen {}) to daemon", genome.id, genome.generation);
        }
    }

    /// Reset the evolution manager state
    pub fn reset(&mut self) {
        self.metrics = None;
        self.composite_state = None;
        self.daemon_states.clear();
        self.connected = false;
        
        // Attempt reconnection
        self.disconnect();
        self.connect();
        
        log::info!("🔄 Evolution Manager reset");
    }

    /// Get Z.ai client for direct access
    pub fn get_zai_client(&self) -> Option<ZAiClient> {
        self.zai_client.clone()
    }

    /// Phase 40.3: Neural Link - Direct Z.ai Query
    pub async fn ask_agent(&self, role: AgentRole, context: &str, goal: &str) -> anyhow::Result<String> {
        if let Some(client) = &self.zai_client {
            client.ask_agent(role, context, goal).await
        } else {
            Err(anyhow::anyhow!("Z.ai Client not initialized (Missing ZAI_API_KEY)"))
        }
    }

    /// Phase 35.9: Set custom SIB path for testing
    pub fn set_sib_path(&mut self, path: String) {
        self.sib_path = path;
    }

    /// Phase 35.9: Get cartridge registry
    pub fn get_cartridge_registry(&self) -> &CartridgeRegistry {
        &self.cartridge_registry
    }

    /// Phase 35.9.3: Get a cartridge entry by ID
    pub fn get_cartridge_entry(&self, id: &str) -> Option<&CartridgeEntry> {
        self.cartridge_registry.get_entry(id)
    }

    /// Phase 35.9: Poll for CARTRIDGE_CREATED resonances from SemanticIntentBus
    fn poll_cartridge_resonances(&mut self) {
        let now = std::time::Instant::now();

        // Only check every 100ms to avoid excessive file reads
        if now.duration_since(self.last_sib_check) < std::time::Duration::from_millis(100) {
            return;
        }
        self.last_sib_check = now;

        // Read shared intent bus file
        let Ok(data) = std::fs::read_to_string(&self.sib_path) else { return };
        let Ok(json_data) = serde_json::from_str::<serde_json::Value>(&data) else { return };

        let registry = json_data.get("registry").and_then(|v| v.as_object());
        let Some(registry_obj) = registry else { return };

        // Process CARTRIDGE_CREATED intents
        for (_id, intent) in registry_obj {
            let explicit = intent.get("explicit").and_then(|v| v.as_str());
            if explicit != Some("CARTRIDGE_CREATED") {
                continue;
            }

            let status = intent.get("status").and_then(|v| v.as_str());
            if status != Some("ACTIVE") {
                continue;
            }

            let implicit = intent.get("implicit").and_then(|v| v.as_object());
            let Some(implicit_obj) = implicit else { continue };

            // Extract cartridge data
            let cartridge_id = implicit_obj.get("cartridge_id")
                .and_then(|v| v.as_str())
                .unwrap_or("");
            let cartridge_path = implicit_obj.get("cartridge_path")
                .and_then(|v| v.as_str())
                .unwrap_or("");
            let spawn_x = implicit_obj.get("spawn_x")
                .and_then(|v| v.as_f64())
                .unwrap_or(0.0) as f32;
            let spawn_y = implicit_obj.get("spawn_y")
                .and_then(|v| v.as_f64())
                .unwrap_or(0.0) as f32;
            let generation = implicit_obj.get("generation")
                .and_then(|v| v.as_u64())
                .unwrap_or(0);
            let fitness = implicit_obj.get("fitness")
                .and_then(|v| v.as_f64())
                .unwrap_or(0.0) as f32;

            if cartridge_id.is_empty() || cartridge_path.is_empty() {
                continue;
            }

            // Check if already registered
            if self.cartridge_registry.get_entry(cartridge_id).is_some() {
                continue;
            }

            // Create cartridge entry
            let entry = CartridgeEntry {
                id: cartridge_id.to_string(),
                path: cartridge_path.to_string(),
                spawn_x,
                spawn_y,
                generation,
                fitness,
                created_at: std::time::SystemTime::now(),
            };

            self.cartridge_registry.add_entry(entry);

            eprintln!("🎮 Cartridge registered: {} at ({}, {})", cartridge_id, spawn_x, spawn_y);
        }
    }
}



#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_evolution_manager_creation() {
        let manager = EvolutionManager::new("/tmp/test_socket".to_string());
        assert!(!manager.is_connected());
        assert!(manager.get_metrics().is_none());
        assert!(manager.get_neural_state().is_none());
    }

    #[test]
    fn test_metrics_display() {
        let mut manager = EvolutionManager::new("/tmp/test_socket".to_string());
        
        let metrics = EvolutionMetrics {
            generation: 100,
            fitness: 0.8,
            mutation_rate: 0.01,
            population_size: 100,
            best_fitness: 0.9,
            stagnation: 0,
            pressure_score: 5.5,
            compilation_success_rate: 0.95,
            avg_compilation_time: 2.3,
            visual_renders: 50,
            components_built: 10,
            health_status: "good".to_string(),
            timestamp: 1234567890.0,
        };
        
        manager.metrics = Some(metrics);
        let display = manager.get_metrics_display();
        
        assert!(display.contains("Generation: 100"));
        assert!(display.contains("Pressure: 5.50"));
    }

    #[test]
    fn test_visualization_mode() {
        let mut manager = EvolutionManager::new("/tmp/test_socket".to_string());
        
        assert_eq!(manager.get_visualization_mode(), NeuralVisualizationMode::MultiChannel);
        
        manager.set_visualization_mode(NeuralVisualizationMode::Heatmap);
        assert_eq!(manager.get_visualization_mode(), NeuralVisualizationMode::Heatmap);
    }

    #[test]
    fn test_brightness_contrast_clamping() {
        let mut manager = EvolutionManager::new("/tmp/test_socket".to_string());
        
        manager.set_brightness(3.0);
        assert_eq!(manager.get_config().brightness, 2.0);
        
        manager.set_brightness(-1.0);
        assert_eq!(manager.get_config().brightness, 0.0);
        
        manager.set_contrast(3.0);
        assert_eq!(manager.get_config().contrast, 2.0);
    }
}
