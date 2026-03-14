#![allow(dead_code, unused_imports, unused_variables)]
//! Evolution Daemon Wrapper - PyO3 Bindings for EvolutionDaemonV8
//!
//! Provides Rust bindings for the Python EvolutionDaemonV8 class,
//! allowing the Rust compositor to directly invoke AI cognitive processing
//! through embedded Python instead of socket communication.

use std::sync::{Arc, Mutex};
use std::thread;

#[cfg(feature = "python")]
use pyo3::prelude::*;
#[cfg(feature = "python")]
use pyo3::types::PyDict;


use crate::evolution_protocol::{
    EvolutionMetrics, NeuralStateData, CognitiveState
};
use crate::python_runtime::EmbeddedPythonContext;

/// Evolution Daemon State
#[derive(Debug, Clone)]
pub struct DaemonState {
    pub evolution_count: u32,
    pub pressure_score: f64,
    pub is_running: bool,
    pub health_status: String,
    pub visual_cortex_enabled: bool,
}

impl Default for DaemonState {
    fn default() -> Self {
        Self {
            evolution_count: 0,
            pressure_score: 0.0,
            is_running: false,
            health_status: "unknown".to_string(),
            visual_cortex_enabled: false,
        }
    }
}

/// Intent message for daemon communication
#[derive(Debug, Clone)]
pub struct IntentMessage {
    pub action: String,
    pub description: Option<String>,
    pub payload: Option<serde_json::Value>,
}

impl IntentMessage {
    pub fn new(action: &str) -> Self {
        Self {
            action: action.to_string(),
            description: None,
            payload: None,
        }
    }

    pub fn with_description(mut self, desc: &str) -> Self {
        self.description = Some(desc.to_string());
        self
    }

    pub fn with_payload(mut self, payload: serde_json::Value) -> Self {
        self.payload = Some(payload);
        self
    }
}

/// PyEvolutionDaemon - Rust wrapper for Python EvolutionDaemonV8
///
/// This struct manages the Python daemon instance and provides a thread-safe
/// interface for the Rust compositor to interact with the AI system.
pub struct PyEvolutionDaemon {
    #[cfg(feature = "python")]
    daemon_instance: Option<Py<PyAny>>,
    #[cfg(feature = "python")]
    python_context: EmbeddedPythonContext,
    state: Arc<Mutex<DaemonState>>,
    daemon_thread: Option<thread::JoinHandle<()>>,
}

impl PyEvolutionDaemon {
    /// Create a new PyEvolutionDaemon instance
    pub fn new() -> Result<Self, String> {
        log::info!("Creating PyEvolutionDaemon...");

        #[cfg(feature = "python")]
        {
            // Initialize Python context
            let mut python_context = EmbeddedPythonContext::new()?;
            python_context.initialize()?;

            // Import and instantiate the daemon
            let daemon_instance = Python::with_gil(|py| -> Result<Py<PyAny>, String> {
                // Import evolution_daemon_v8
                let daemon_module = py.import("evolution_daemon_v8")
                    .map_err(|e| format!("Failed to import evolution_daemon_v8: {}", e))?;

                // Get the EvolutionDaemonV8 class
                let daemon_class = daemon_module.getattr("EvolutionDaemonV8")
                    .map_err(|e| format!("Failed to get EvolutionDaemonV8 class: {}", e))?;

                // Create an instance
                let instance = daemon_class.call0()
                    .map_err(|e| format!("Failed to create EvolutionDaemonV8 instance: {}", e))?;

                Ok(instance.into())
            })?;

            log::info!("✅ PyEvolutionDaemon created successfully");

            Ok(Self {
                daemon_instance: Some(daemon_instance),
                python_context,
                state: Arc::new(Mutex::new(DaemonState {
                    evolution_count: 0,
                    pressure_score: 0.0,
                    is_running: false,
                    health_status: "initialized".to_string(),
                    visual_cortex_enabled: false,
                })),
                daemon_thread: None,
            })
        }

        #[cfg(not(feature = "python"))]
        {
            log::info!("PyEvolutionDaemon created (stub mode - Python feature disabled)");
            Ok(Self {
                state: Arc::new(Mutex::new(DaemonState::default())),
                daemon_thread: None,
            })
        }
    }

    /// Start the daemon's main lifecycle loop in a background thread
    pub fn start(&mut self) -> Result<(), String> {
        log::info!("Starting PyEvolutionDaemon...");

        #[cfg(feature = "python")]
        {
            if self.daemon_thread.is_some() {
                return Err("Daemon already running".to_string());
            }

            let daemon_instance = self.daemon_instance.clone().unwrap();
            let _ = Arc::clone(&self.state);

            let handle = thread::spawn(move || {
                log::info!("🧬 Daemon thread started");

                Python::with_gil(|py| {
                    let daemon = daemon_instance.as_ref(py);

                    // Start the daemon's run() method - this blocks
                    if let Err(e) = daemon.call_method0("run") {
                        log::error!("Daemon run method failed: {}", e);
                    }
                });

                log::info!("🧬 Daemon thread exited");
            });

            self.daemon_thread = Some(handle);
            self.state.lock().unwrap().is_running = true;

            log::info!("✅ PyEvolutionDaemon started");
            Ok(())
        }

        #[cfg(not(feature = "python"))]
        {
            log::info!("PyEvolutionDaemon started (stub mode)");
            self.state.lock().unwrap().is_running = true;
            Ok(())
        }
    }

    /// Trigger neural evolution
    pub fn trigger_evolution(&self) -> Result<(), String> {
        log::info!("🌀 Triggering neural evolution...");

        #[cfg(feature = "python")]
        {
            let daemon_instance = self.daemon_instance.as_ref().unwrap();

            Python::with_gil(|py| {
                let daemon = daemon_instance.as_ref(py);

                daemon.call_method0("initiate_neural_evolution")
                    .map_err(|e| format!("Failed to trigger evolution: {}", e))?;

                // Update state
                let mut state = self.state.lock().unwrap();
                state.evolution_count += 1;

                Ok(())
            })
        }

        #[cfg(not(feature = "python"))]
        {
            let mut state = self.state.lock().unwrap();
            state.evolution_count += 1;
            log::info!("Evolution triggered (stub mode - count: {})", state.evolution_count);
            Ok(())
        }
    }

    /// Send an intent to the daemon
    pub fn send_intent(&self, intent: &IntentMessage) -> Result<(), String> {
        log::info!("📤 Sending intent: {}", intent.action);

        #[cfg(feature = "python")]
        {
            let daemon_instance = self.daemon_instance.as_ref().unwrap();

            Python::with_gil(|py| {
                let daemon = daemon_instance.as_ref(py);

                // Get the intent_bus
                let intent_bus = daemon.getattr("intent_bus")
                    .map_err(|e| format!("Failed to get intent_bus: {}", e))?;

                // Create intent dict
                let intent_dict = PyDict::new(py);
                // let intent_dict_as_any: &PyAny = intent_dict.as_ref(); // Unused
                intent_dict.set_item("action", intent.action.clone())
                    .map_err(|e| format!("Failed to set action: {}", e))?;

                if let Some(desc) = &intent.description {
                    intent_dict.set_item("description", desc)
                        .map_err(|e| format!("Failed to set description: {}", e))?;
                }

                if let Some(payload) = &intent.payload {
                    let payload_str = serde_json::to_string(payload)
                        .map_err(|e| format!("Failed to serialize payload: {}", e))?;
                    intent_dict.set_item("payload", payload_str)
                        .map_err(|e| format!("Failed to set payload: {}", e))?;
                }

                // Emit the intent
                intent_bus.call_method1("emit_resonance", (intent_dict,))
                    .map_err(|e| format!("Failed to emit intent: {}", e))?;

                Ok(())
            })
        }

        #[cfg(not(feature = "python"))]
        {
            log::info!("Intent sent (stub mode): {}", intent.action);
            Ok(())
        }
    }

    /// Perform a health check
    pub fn perform_health_check(&self) -> Result<String, String> {
        log::info!("🔬 Performing health check...");

        #[cfg(feature = "python")]
        {
            let daemon_instance = self.daemon_instance.as_ref().unwrap();

            Python::with_gil(|py| {
                let daemon = daemon_instance.as_ref(py);

                daemon.call_method0("_perform_health_check")
                    .map_err(|e| format!("Failed to perform health check: {}", e))?;

                // Update state
                let mut state = self.state.lock().unwrap();
                state.health_status = "checked".to_string();

                Ok("Health check completed".to_string())
            })
        }

        #[cfg(not(feature = "python"))]
        {
            let mut state = self.state.lock().unwrap();
            state.health_status = "checked".to_string();
            Ok("Health check completed (stub mode)".to_string())
        }
    }

    /// Trigger self-reflection
    pub fn trigger_reflection(&self) -> Result<(), String> {
        log::info!("👁️ Triggering self-reflection...");

        #[cfg(feature = "python")]
        {
            let daemon_instance = self.daemon_instance.as_ref().unwrap();

            Python::with_gil(|py| {
                let daemon = daemon_instance.as_ref(py);

                daemon.call_method0("_perform_self_reflection")
                    .map_err(|e| format!("Failed to trigger reflection: {}", e))?;

                Ok(())
            })
        }

        #[cfg(not(feature = "python"))]
        {
            log::info!("Reflection triggered (stub mode)");
            Ok(())
        }
    }

    /// Get the current daemon state
    pub fn get_state(&self) -> DaemonState {
        #[cfg(feature = "python")]
        {
            let daemon_instance = self.daemon_instance.as_ref().unwrap();

            Python::with_gil(|py| {
                let daemon = daemon_instance.as_ref(py);

                // Read state from Python daemon
                let evolution_count: u32 = daemon.getattr("evolution_count")
                    .and_then(|v| v.extract())
                    .unwrap_or(0);

                let pressure_score: f64 = daemon.getattr("pressure_score")
                    .and_then(|v| v.extract())
                    .unwrap_or(0.0);

                let visual_cortex = daemon.getattr("visual_cortex")
                    .and_then(|v| v.getattr("enabled"))
                    .and_then(|v| v.extract())
                    .unwrap_or(false);

                let mut state = self.state.lock().unwrap();
                state.evolution_count = evolution_count;
                state.pressure_score = pressure_score;
                state.visual_cortex_enabled = visual_cortex;

                state.clone()
            })
        }

        #[cfg(not(feature = "python"))]
        {
            self.state.lock().unwrap().clone()
        }
    }

    /// Get detailed evolution metrics
    pub fn get_metrics(&self) -> Result<EvolutionMetrics, String> {
        #[cfg(feature = "python")]
        {
            let daemon_instance = self.daemon_instance.as_ref().unwrap();

            Python::with_gil(|py| {
                let daemon = daemon_instance.as_ref(py);

                // Extract metrics from daemon attributes
                let generation: u64 = daemon.getattr("evolution_count")
                    .and_then(|v| v.extract())
                    .unwrap_or(0);
                
                let pressure_score: f64 = daemon.getattr("pressure_score")
                    .and_then(|v| v.extract())
                    .unwrap_or(0.0);

                let compilation_success_rate: f64 = daemon.getattr("compilation_success_rate")
                    .and_then(|v| v.extract())
                    .unwrap_or(0.0);

                let avg_compilation_time: f64 = daemon.getattr("avg_compilation_time")
                    .and_then(|v| v.extract())
                    .unwrap_or(0.0);

                let visual_renders: u64 = daemon.getattr("visual_renders")
                    .and_then(|v| v.extract())
                    .unwrap_or(0);

                let components_built: u64 = daemon.getattr("components_built")
                    .and_then(|v| v.extract())
                    .unwrap_or(0);

                let health_status: String = daemon.getattr("health_status")
                    .and_then(|v| v.extract())
                    .unwrap_or_else(|_| "unknown".to_string());

                Ok(EvolutionMetrics {
                    generation,
                    fitness: 0.5,           // Default fitness
                    mutation_rate: 0.1,     // Default mutation rate
                    population_size: 100,   // Default population
                    best_fitness: 0.5,      // Default best fitness
                    stagnation: 0,          // No stagnation
                    pressure_score: pressure_score as f32,
                    compilation_success_rate: compilation_success_rate as f32,
                    avg_compilation_time: avg_compilation_time as f32,
                    visual_renders: visual_renders as u32,
                    components_built: components_built as u32,
                    health_status,
                    timestamp: 0.0,
                })
            })
        }

        #[cfg(not(feature = "python"))]
        {
            // Return dummy metrics for stub
            let mut metrics = EvolutionMetrics::default();
            metrics.health_status = "stub".to_string();
            Ok(metrics)
        }
    }

    /// Get neural state data
    pub fn get_neural_state(&self) -> Result<NeuralStateData, String> {
        #[cfg(feature = "python")]
        {
            let daemon_instance = self.daemon_instance.as_ref().unwrap();

            Python::with_gil(|py| {
                let daemon = daemon_instance.as_ref(py);
                
                // Try to get neural_cortex which holds the state
                let neural_cortex = daemon.getattr("neural_cortex").map_err(|_| "No neural cortex")?;
                
                let confidence: f32 = neural_cortex.getattr("confidence")
                    .and_then(|v| v.extract())
                    .unwrap_or(0.5);
                    
                // For vectors, we might need more complex extraction
                // Assuming lists in Python
                let layer_activations: Vec<f32> = neural_cortex.getattr("layer_activations")
                    .and_then(|v| v.extract())
                    .unwrap_or_default();

                let attention_weights: Vec<f32> = neural_cortex.getattr("attention_weights")
                    .and_then(|v| v.extract())
                    .unwrap_or_default();
                    
                let memory_patterns: Vec<f32> = neural_cortex.getattr("memory_patterns")
                    .and_then(|v| v.extract())
                    .unwrap_or_default();
                    
                let thought_vector: Vec<f32> = neural_cortex.getattr("thought_vector")
                    .and_then(|v| v.extract())
                    .unwrap_or_default();

                Ok(NeuralStateData {
                    layer_activations,
                    attention_weights,
                    memory_patterns,
                    confidence,
                    cognitive_load: 0.5,
                    attention_focus: [0.5, 0.5],
                    emotional_valence: 0.0,
                    arousal: 0.5,
                    thought_stream: Vec::new(),
                    active_regions: Vec::new(),
                    thought_vector,
                    self_state: Default::default(),
                    theory_of_mind: Default::default(),
                    cognitive_state: Default::default(),
                    audio_features: Default::default(),
                    input_state: Default::default(),
                    token_visualization: None,
                })
            })
        }

        #[cfg(not(feature = "python"))]
        {
            Ok(NeuralStateData::default())
        }
    }

    /// Get cognitive state (Phase 27)
    pub fn get_cognitive_state(&self) -> Result<CognitiveState, String> {
        #[cfg(feature = "python")]
        {
            let daemon_instance = self.daemon_instance.as_ref().unwrap();

            Python::with_gil(|py| {
                let daemon = daemon_instance.as_ref(py);

                // Try to call method to get full cognitive state
                // For now, return default state as method may not exist yet
                // This will be enhanced when Python daemon has the method
                let _result = daemon.call_method0("get_unified_cognitive_state");

                // For now, return default cognitive state
                // TODO: Extract actual values from daemon when method is implemented
                Ok(CognitiveState {
                    mode: "idle".to_string(),
                    active_chains: Vec::new(),
                    working_memory: Vec::new(),
                    decision_confidence: 0.5,
                    error_rate: 0.0,
                    complexity: 0.5,
                    safety_score: 1.0,
                    is_reasoning: false,
                    self_confidence: 0.5,
                    alignment: 0.5,
                })
            })
        }

        #[cfg(not(feature = "python"))]
        {
            Ok(CognitiveState::default())
        }
    }

    /// Check if the daemon is running
    pub fn is_running(&self) -> bool {
        self.state.lock().unwrap().is_running
    }

    /// Stop the daemon
    pub fn stop(&mut self) -> Result<(), String> {
        log::info!("Stopping PyEvolutionDaemon...");

        #[cfg(feature = "python")]
        {
            // Note: The daemon's run() method blocks indefinitely
            // In a real implementation, we'd need to add a stop() method to the Python daemon
            // For now, we just mark it as stopped
            self.state.lock().unwrap().is_running = false;

            if let Some(_handle) = self.daemon_thread.take() {
                // We can't really join a thread that's blocked in Python
                // This is a known limitation
                log::warn!("Daemon thread cannot be cleanly stopped (Python GIL limitation)");
            }

            Ok(())
        }

        #[cfg(not(feature = "python"))]
        {
            self.state.lock().unwrap().is_running = false;
            log::info!("PyEvolutionDaemon stopped (stub mode)");
            Ok(())
        }
    }
}

impl Drop for PyEvolutionDaemon {
    fn drop(&mut self) {
        log::info!("Dropping PyEvolutionDaemon...");
        let _ = self.stop();
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_intent_message_creation() {
        let intent = IntentMessage::new("TEST_ACTION")
            .with_description("Test description");

        assert_eq!(intent.action, "TEST_ACTION");
        assert_eq!(intent.description, Some("Test description".to_string()));
    }

    #[test]
    fn test_daemon_state_default() {
        let state = DaemonState::default();
        assert_eq!(state.evolution_count, 0);
        assert_eq!(state.pressure_score, 0.0);
        assert!(!state.is_running);
    }
}
