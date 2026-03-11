// systems/infinite_map_rs/src/evolution_protocol.rs
// Evolution Protocol for Memory Graph Inspector
// Bidirectional async socket communication with evolution daemon

use crate::memory_graph::{MemoryGraph, MemoryNode, MemoryEdge};
use serde::{Deserialize, Serialize};
use serde_json;
use std::path::Path;
use tokio::io::{AsyncReadExt, AsyncWriteExt};
use tokio::net::{UnixListener, UnixStream};
use tokio::sync::mpsc;
use tokio::time::{sleep, Duration};
use std::sync::Arc;
use tokio::sync::Mutex;
use std::io::Write;
use std::os::unix::net::UnixStream as StdUnixStream;

/// Protocol message types for memory graph communication
#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum Message {
    /// Full graph update from daemon
    GraphUpdate(MemoryGraph),
    /// Node selection state change
    NodeSelection {
        node_id: String,
        selected: bool,
        timestamp: u64,
    },
    /// Visual feedback to daemon
    VisualFeedback {
        feedback_type: String,
        data: serde_json::Value,
        timestamp: u64,
    },
}

// ============================================
// Extended Evolution Protocol Types
// Types required by evolution_manager, neural_state, thought_renderer, etc.
// ============================================

/// Protocol message types enumeration
#[derive(Debug, Clone, Copy, Serialize, Deserialize, PartialEq, Eq)]
pub enum MessageType {
    NeuralStateUpdate,
    EvolutionTick,
    FeedbackReceived,
    ThoughtEmitted,
    SyncRequest,
    SyncResponse,
    MetricsUpdate,
    SelfStateUpdate,
    TheoryOfMindUpdate,
    DaemonStatesUpdate,
    CognitiveStateUpdate,
    VisualThoughtReady,
    TokenVisualizationUpdate,
    WriteEvolvedGenome,
}

/// Full protocol message with type and payload
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ProtocolMessage {
    pub message_type: MessageType,
    pub payload: serde_json::Value,
    pub timestamp: u64,
}

impl ProtocolMessage {
    pub fn new(message_type: MessageType, _count: u64, payload: serde_json::Value) -> Self {
        Self {
            message_type,
            payload,
            timestamp: std::time::SystemTime::now()
                .duration_since(std::time::UNIX_EPOCH)
                .unwrap_or_default()
                .as_millis() as u64,
        }
    }
}

/// Neural state data from the evolution daemon
#[derive(Debug, Clone, Default, Serialize, Deserialize)]
pub struct NeuralStateData {
    /// Layer activations (8 layers)
    pub layer_activations: Vec<f32>,
    /// Attention weights for memory patterns
    pub attention_weights: Vec<f32>,
    /// Memory pattern activations
    pub memory_patterns: Vec<f32>,
    /// Overall confidence level (0.0 - 1.0)
    pub confidence: f32,
    /// Current cognitive load (0.0 - 1.0)
    pub cognitive_load: f32,
    /// Attention focus point
    pub attention_focus: [f32; 2],
    /// Emotional valence (-1.0 to 1.0)
    pub emotional_valence: f32,
    /// Arousal level (0.0 - 1.0)
    pub arousal: f32,
    /// Current thought stream
    pub thought_stream: Vec<String>,
    /// Active memory regions
    pub active_regions: Vec<String>,
    /// Thought vector for visualization
    pub thought_vector: Vec<f32>,
    /// Self state
    pub self_state: SelfState,
    /// Theory of mind state
    pub theory_of_mind: TheoryOfMindState,
    /// Cognitive state
    pub cognitive_state: CognitiveState,
    /// Audio features
    pub audio_features: AudioFeatures,
    /// Input state
    pub input_state: InputState,
    /// Token visualization data for LLM thought processes
    pub token_visualization: Option<TokenVisualizationData>,
}

/// Neural state update from a daemon (for multi-daemon competitive substrate)
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct NeuralStateUpdate {
    /// Unique identifier for the daemon
    pub daemon_id: String,
    /// Strength of this daemon's influence (0.0 - 1.0)
    pub strength: f32,
    /// The neural state data
    pub data: NeuralStateData,
}

/// Self-reflection / introspection state
#[derive(Debug, Clone, Default, Serialize, Deserialize)]
pub struct SelfState {
    /// Confidence level (0.0 - 1.0)
    pub confidence: f32,
    /// Fatigue level (0.0 - 1.0)
    pub fatigue: f32,
    /// Creativity level (0.0 - 1.0)
    pub creativity: f32,
    /// Focus intensity (0.0 - 1.0)
    pub focus: f32,
    /// Focus depth for shader visualization
    pub focus_depth: f32,
    /// Current narrative / self-talk
    pub narrative: String,
}

/// User intent tracking
#[derive(Debug, Clone, Default, Serialize, Deserialize)]
pub struct UserIntent {
    /// Confidence in intent inference
    pub intent_confidence: f32,
    /// User attention focus point
    pub attention_focus: f32,
    /// User engagement level
    pub engagement_level: f32,
}

/// Theory of Mind state - modeling user's mental state
#[derive(Debug, Clone, Default, Serialize, Deserialize)]
pub struct TheoryOfMindState {
    /// User intent tracking
    pub user_intent: UserIntent,
    /// Overall alignment with user goals
    pub alignment: f32,
    /// Confidence in mind-reading
    pub mind_reading_confidence: f32,
    /// Whether misalignment has been detected
    pub misalignment_detected: bool,
    /// Inferred user frustration level
    pub user_frustration: f32,
    /// Inferred user engagement
    pub user_engagement: f32,
    /// Inferred user confusion
    pub user_confusion: f32,
    /// Inferred user goal
    pub inferred_goal: String,
    /// Alignment score with user intent
    pub alignment_score: f32,
}

/// High-level cognitive state
#[derive(Debug, Clone, Default, Serialize, Deserialize)]
pub struct CognitiveState {
    /// Current processing mode
    pub mode: String,
    /// Active reasoning chains
    pub active_chains: Vec<String>,
    /// Working memory contents
    pub working_memory: Vec<String>,
    /// Decision confidence
    pub decision_confidence: f32,
    /// Error rate estimate
    pub error_rate: f32,
    /// Cognitive complexity (0.0 - 1.0)
    pub complexity: f32,
    /// Safety score (0.0 - 1.0)
    pub safety_score: f32,
    /// Whether currently reasoning
    pub is_reasoning: bool,
    /// Self confidence level
    pub self_confidence: f32,
    /// Alignment score
    pub alignment: f32,
}

/// Audio input features
#[derive(Debug, Clone, Default, Serialize, Deserialize)]
pub struct AudioFeatures {
    /// RMS amplitude
    pub amplitude: f32,
    /// Spectral centroid
    pub spectral_centroid: f32,
    /// Pitch estimate (Hz)
    pub pitch: f32,
    /// Voice activity detection
    pub voice_active: bool,
    /// Ambient noise level
    pub noise_level: f32,
    /// Bass frequency energy (for visualization)
    pub bass_energy: f32,
    /// Treble frequency energy (for visualization)
    pub treble_energy: f32,
    /// Overall volume level
    pub volume: f32,
    /// Beat detection flag
    pub is_beat: bool,
    /// Startle response (sudden loud sound)
    pub startle: bool,
}

/// Token visualization data for LLM thought processes
#[derive(Debug, Clone, Default, Serialize, Deserialize)]
pub struct TokenVisualizationData {
    /// Current token being processed
    pub current_token: String,
    /// Token ID in vocabulary
    pub token_id: u32,
    /// Hilbert position of token in vocabulary space
    pub hilbert_position: [f32; 2],
    /// Activation strength (0.0 - 1.0)
    pub activation: f32,
    /// Layer depth (0-7 for transformer layers)
    pub layer: u32,
    /// Attention weights to other tokens
    pub attention_weights: Vec<f32>,
    /// Timestamp of this token activation
    pub timestamp: f64,
    /// Sequence position in current generation
    pub sequence_position: u32,
    /// Total sequence length
    pub sequence_length: u32,
}

/// Evolved genome data for writing to the map
#[derive(Debug, Clone, Default, Serialize, Deserialize)]
pub struct EvolvedGenomeData {
    /// Unique identifier for the genome
    pub id: String,
    /// The binary payload of the genome (RTS data or similar)
    pub data: Vec<u8>,
    /// Generation number
    pub generation: u64,
    /// Fitness score
    pub fitness: f32,
    /// Metadata/Configuration for the genome
    pub metadata: serde_json::Value,
}

/// Input device state
#[derive(Debug, Clone, Default, Serialize, Deserialize)]
pub struct InputState {
    /// Mouse velocity
    pub mouse_velocity: [f32; 2],
    /// Click frequency (clicks per second)
    pub click_frequency: f32,
    /// Typing speed (chars per second)
    pub typing_speed: f32,
    /// Scroll velocity
    pub scroll_velocity: f32,
    /// Input hesitancy (pause duration)
    pub hesitancy: f32,
    /// Overall input velocity (magnitude)
    pub velocity: f32,
    /// Whether window is focused
    pub is_focused: bool,
    /// Whether user is idle
    pub is_idle: bool,
    /// Chaos metric (randomness of input)
    pub chaos: f32,
}

/// Evolution client for connecting to the daemon
pub struct EvolutionClient {
    pub socket_path: String,
    pub connected: bool,
    pub stream: Option<StdUnixStream>,
}

impl EvolutionClient {
    pub fn new(socket_path: &str) -> Self {
        Self {
            socket_path: socket_path.to_string(),
            connected: false,
            stream: None,
        }
    }

    pub fn connect(&mut self) -> Result<(), Box<dyn std::error::Error>> {
        match StdUnixStream::connect(&self.socket_path) {
            Ok(stream) => {
                self.stream = Some(stream);
                self.connected = true;
                Ok(())
            }
            Err(e) => {
                self.connected = false;
                Err(Box::new(e))
            }
        }
    }

    pub fn disconnect(&mut self) {
        self.stream = None;
        self.connected = false;
    }

    pub fn send(&self, message: ProtocolMessage) -> Result<(), Box<dyn std::error::Error>> {
        if !self.connected || self.stream.is_none() {
            return Err("Not connected".into());
        }

        let mut stream = self.stream.as_ref().unwrap();
        let data = serde_json::to_vec(&message)?;
        stream.write_all(&(data.len() as u32).to_le_bytes())?;
        stream.write_all(&data)?;
        stream.flush()?;
        Ok(())
    }

    pub fn send_message(&self, message: ProtocolMessage) -> std::io::Result<()> {
        self.send(message).map_err(|e| std::io::Error::new(std::io::ErrorKind::Other, format!("{}", e)))
    }

    pub fn request_metrics(&self) -> Result<ProtocolMessage, Box<dyn std::error::Error>> {
        let message = ProtocolMessage {
            message_type: MessageType::MetricsUpdate,
            payload: serde_json::Value::Null,
            timestamp: std::time::SystemTime::now()
                .duration_since(std::time::UNIX_EPOCH)?
                .as_millis() as u64,
        };
        self.send(message.clone())?;
        // For now, return the request message since we don't have async receive
        Ok(message)
    }

    pub fn request_neural_state(&self) -> Result<ProtocolMessage, Box<dyn std::error::Error>> {
        let message = ProtocolMessage {
            message_type: MessageType::NeuralStateUpdate,
            payload: serde_json::Value::Null,
            timestamp: std::time::SystemTime::now()
                .duration_since(std::time::UNIX_EPOCH)?
                .as_millis() as u64,
        };
        self.send(message.clone())?;
        // For now, return the request message since we don't have async receive
        Ok(message)
    }

    pub fn request_self_state(&self) -> Result<ProtocolMessage, Box<dyn std::error::Error>> {
        let message = ProtocolMessage {
            message_type: MessageType::SelfStateUpdate,
            payload: serde_json::Value::Null,
            timestamp: std::time::SystemTime::now()
                .duration_since(std::time::UNIX_EPOCH)?
                .as_millis() as u64,
        };
        self.send(message.clone())?;
        Ok(message)
    }

    pub fn request_theory_of_mind(&self) -> Result<ProtocolMessage, Box<dyn std::error::Error>> {
        let message = ProtocolMessage {
            message_type: MessageType::TheoryOfMindUpdate,
            payload: serde_json::Value::Null,
            timestamp: std::time::SystemTime::now()
                .duration_since(std::time::UNIX_EPOCH)?
                .as_millis() as u64,
        };
        self.send(message.clone())?;
        Ok(message)
    }

    pub fn request_daemon_sync(&self) -> Result<ProtocolMessage, Box<dyn std::error::Error>> {
        let message = ProtocolMessage {
            message_type: MessageType::SyncRequest,
            payload: serde_json::Value::Null,
            timestamp: std::time::SystemTime::now()
                .duration_since(std::time::UNIX_EPOCH)?
                .as_millis() as u64,
        };
        self.send(message.clone())?;
        Ok(message)
    }

    pub fn request_cognitive_state(&self) -> Result<ProtocolMessage, Box<dyn std::error::Error>> {
        let message = ProtocolMessage {
            message_type: MessageType::CognitiveStateUpdate,
            payload: serde_json::Value::Null,
            timestamp: std::time::SystemTime::now()
                .duration_since(std::time::UNIX_EPOCH)?
                .as_millis() as u64,
        };
        self.send(message.clone())?;
        Ok(message)
    }

    pub fn send_heartbeat(&self) -> Result<(), Box<dyn std::error::Error>> {
        let message = ProtocolMessage {
            message_type: MessageType::EvolutionTick,
            payload: serde_json::Value::Null,
            timestamp: std::time::SystemTime::now()
                .duration_since(std::time::UNIX_EPOCH)?
                .as_millis() as u64,
        };
        self.send(message)
    }

    pub fn send_input_event(&self, key: u32) -> Result<(), Box<dyn std::error::Error>> {
        let payload = serde_json::json!({
            "key": key,
            "timestamp": std::time::SystemTime::now()
                .duration_since(std::time::UNIX_EPOCH)?
                .as_millis()
        });
        let message = ProtocolMessage {
            message_type: MessageType::FeedbackReceived,
            payload,
            timestamp: std::time::SystemTime::now()
                .duration_since(std::time::UNIX_EPOCH)?
                .as_millis() as u64,
        };
        self.send(message)
    }
}

/// Evolution metrics from the daemon
#[derive(Debug, Clone, Default, Serialize, Deserialize)]
pub struct EvolutionMetrics {
    /// Current generation number
    pub generation: u64,
    /// Fitness score (0.0 - 1.0)
    pub fitness: f32,
    /// Mutation rate
    pub mutation_rate: f32,
    /// Population size
    pub population_size: usize,
    /// Best fitness achieved
    pub best_fitness: f32,
    /// Generations since improvement
    pub stagnation: u64,
    /// Pressure score for evolution
    pub pressure_score: f32,
    /// Compilation success rate (0.0 - 1.0)
    pub compilation_success_rate: f32,
    /// Average compilation time in seconds
    pub avg_compilation_time: f32,
    /// Number of visual renders
    pub visual_renders: u32,
    /// Number of components built
    pub components_built: u32,
    /// Health status string
    pub health_status: String,
    /// Timestamp of last update
    pub timestamp: f64,
}

/// Daemon frequency band for multi-daemon synchronization
#[derive(Debug, Clone, Copy, Serialize, Deserialize, PartialEq)]
pub enum DaemonFrequencyBand {
    /// Ultra-low frequency (~0.1Hz)
    UltraLow,
    /// Low frequency (~1Hz)
    Low,
    /// Mid frequency (~10Hz)
    Mid,
    /// High frequency (~60Hz)
    High,
    /// Custom frequency (millihertz)
    Custom(u32),
}

/// Daemon registration info
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DaemonRegistration {
    pub name: String,
    pub preferred_band: DaemonFrequencyBand,
    pub initial_amplitude: f32,
}

/// Daemon data update
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DaemonDataUpdate {
    pub name: String,
    pub data: serde_json::Value,
}

/// Daemon amplitude update
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DaemonAmplitudeUpdate {
    pub name: String,
    pub amplitude: f32,
}

/// Daemon synchronization packet - full sync state from evolution manager
#[derive(Debug, Clone, Default, Serialize, Deserialize)]
pub struct DaemonSyncPacket {
    /// List of daemon names to unregister
    pub unregistered: Vec<String>,
    /// List of daemons to register
    pub registered: Vec<DaemonRegistration>,
    /// Daemon data updates
    pub updates: Vec<DaemonDataUpdate>,
    /// Daemon amplitude updates
    pub amplitude_updates: Vec<DaemonAmplitudeUpdate>,
}

/// Memory Graph Protocol handler
pub struct MemoryGraphProtocol {
    socket_path: String,
    stream: Arc<Mutex<Option<UnixStream>>>,
    reconnect_tx: mpsc::UnboundedSender<()>,
    message_tx: mpsc::UnboundedSender<Message>,
    message_rx: mpsc::UnboundedReceiver<Message>,
}

impl MemoryGraphProtocol {
    /// Create a new protocol handler
    pub fn new(socket_path: &str) -> Self {
        let (message_tx, message_rx) = mpsc::unbounded_channel();
        let (reconnect_tx, reconnect_rx) = mpsc::unbounded_channel();

        let protocol = Self {
            socket_path: socket_path.to_string(),
            stream: Arc::new(Mutex::new(None)),
            reconnect_tx,
            message_tx,
            message_rx,
        };

        // Spawn reconnection task
        let stream_clone = protocol.stream.clone();
        let socket_path_clone = protocol.socket_path.clone();
        let message_tx_clone = protocol.message_tx.clone();

        tokio::spawn(async move {
            Self::reconnection_loop(reconnect_rx, stream_clone, &socket_path_clone, message_tx_clone).await;
        });

        protocol
    }

    /// Start the protocol (connect initially)
    pub async fn start(&self) -> Result<(), Box<dyn std::error::Error>> {
        self.reconnect_tx.send(())?;
        Ok(())
    }

    /// Send a message to the daemon
    pub async fn send_message(&self, message: Message) -> Result<(), Box<dyn std::error::Error>> {
        let mut stream_guard = self.stream.lock().await;
        if let Some(ref mut stream) = *stream_guard {
            let data = serde_json::to_vec(&message)?;
            stream.write_u32_le(data.len() as u32).await?;
            stream.write_all(&data).await?;
            stream.flush().await?;
            Ok(())
        } else {
            Err("No active connection".into())
        }
    }

    /// Receive a message from the daemon
    pub async fn receive_message(&mut self) -> Result<Message, Box<dyn std::error::Error>> {
        if let Some(message) = self.message_rx.try_recv().ok() {
            return Ok(message);
        }

        // If no message in channel, wait for connection and read
        let mut stream_guard = self.stream.lock().await;
        if let Some(ref mut stream) = *stream_guard {
            let len = stream.read_u32_le().await?;
            let mut buf = vec![0; len as usize];
            stream.read_exact(&mut buf).await?;
            let message: Message = serde_json::from_slice(&buf)?;
            Ok(message)
        } else {
            Err("No active connection".into())
        }
    }

    /// Get a sender for outgoing messages
    pub fn message_sender(&self) -> mpsc::UnboundedSender<Message> {
        self.message_tx.clone()
    }

    /// Reconnection loop
    async fn reconnection_loop(
        mut reconnect_rx: mpsc::UnboundedReceiver<()>,
        stream: Arc<Mutex<Option<UnixStream>>>,
        socket_path: &str,
        message_tx: mpsc::UnboundedSender<Message>,
    ) {
        loop {
            // Wait for reconnection signal
            let _ = reconnect_rx.recv().await;

            loop {
                match UnixStream::connect(socket_path).await {
                    Ok(new_stream) => {
                        let mut stream_guard = stream.lock().await;
                        *stream_guard = Some(new_stream);
                        drop(stream_guard);

                        // Spawn reader task
                        let stream_clone = stream.clone();
                        let message_tx_clone = message_tx.clone();
                        tokio::spawn(async move {
                            Self::reader_task(stream_clone, message_tx_clone).await;
                        });
                        break;
                    }
                    Err(_) => {
                        sleep(Duration::from_millis(100)).await;
                    }
                }
            }
        }
    }

    /// Reader task for incoming messages
    async fn reader_task(
        stream: Arc<Mutex<Option<UnixStream>>>,
        message_tx: mpsc::UnboundedSender<Message>,
    ) {
        loop {
            let mut stream_guard = stream.lock().await;
            if let Some(ref mut stream) = *stream_guard {
                match Self::read_message(stream).await {
                    Ok(message) => {
                        let _ = message_tx.send(message);
                    }
                    Err(_) => {
                        // Connection lost, clear stream
                        *stream_guard = None;
                        break;
                    }
                }
            } else {
                break;
            }
        }
    }

    /// Read a single message from stream
    async fn read_message(stream: &mut UnixStream) -> Result<Message, Box<dyn std::error::Error>> {
        let len = stream.read_u32_le().await?;
        let mut buf = vec![0; len as usize];
        stream.read_exact(&mut buf).await?;
        let message: Message = serde_json::from_slice(&buf)?;
        Ok(message)
    }

    /// Trigger reconnection
    pub fn reconnect(&self) -> Result<(), Box<dyn std::error::Error>> {
        self.reconnect_tx.send(())?;
        Ok(())
    }
}

impl Default for MemoryGraphProtocol {
    fn default() -> Self {
        Self::new("/tmp/evolution_daemon.sock")
    }
}
