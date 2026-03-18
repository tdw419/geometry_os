/// Morphology - Geometric transformation commands
///
/// Defines the command language for manipulating the visual substrate
use crate::camera_sync::CameraUpdate;
use serde::{Deserialize, Serialize};
use tokio::sync::broadcast;

/// Navigation request sent to camera controller
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct NavigationRequest {
    /// Target X position in world coordinates
    pub x: f32,
    /// Target Y position in world coordinates
    pub y: f32,
    /// Target Z position in world coordinates
    pub z: f32,
    /// Animation duration in seconds
    pub duration: f32,
}

/// Aesthetics adjustment request sent to renderer
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct AestheticsRequest {
    /// Chaos factor (0.0-1.0)
    pub chaos: Option<f32>,
    /// Color temperature (-1.0 to 1.0, cold to warm)
    pub temperature: Option<f32>,
    /// Saturation multiplier (0.0-2.0)
    pub saturation: Option<f32>,
}

/// Commands that modify the geometric substrate
#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum MorphologyCommand {
    /// Navigate camera to coordinates (x, y, z)
    Navigate {
        x: f32,
        y: f32,
        z: f32,
        /// Animation duration in seconds
        duration: f32,
    },

    /// Adjust aesthetic parameters
    AdjustAesthetics {
        /// Chaos factor (0.0-1.0)
        chaos: Option<f32>,
        /// Color temperature (-1.0 to 1.0, cold to warm)
        temperature: Option<f32>,
        /// Saturation multiplier (0.0-2.0)
        saturation: Option<f32>,
    },

    /// Create a new brick at location
    CreateBrick {
        x: f32,
        y: f32,
        z: f32,
        /// Description for AI generation
        description: String,
    },

    /// Highlight specific regions
    Highlight {
        /// Center coordinates
        center: (f32, f32, f32),
        /// Radius in world units
        radius: f32,
        /// Highlight color (RGBA)
        color: [f32; 4],
        /// Duration in seconds (None = permanent)
        duration: Option<f32>,
    },

    /// Adjust camera parameters
    CameraControl {
        /// Field of view in degrees
        fov: Option<f32>,
        /// Look-at target
        target: Option<(f32, f32, f32)>,
        /// Camera distance from target
        distance: Option<f32>,
    },

    /// Spawn a visual effect
    SpawnEffect {
        /// Effect type
        effect: EffectType,
        /// Position
        position: (f32, f32, f32),
        /// Scale multiplier
        scale: f32,
    },

    /// Query information about a region
    Query {
        /// Query type
        query_type: QueryType,
        /// Target coordinates
        target: Option<(f32, f32, f32)>,
    },
}

/// Visual effect types
#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum EffectType {
    /// Particle burst
    Particles,
    /// Ripple wave
    Ripple,
    /// Glow pulse
    Glow,
    /// Fractal bloom
    Fractal,
}

/// Query types for information retrieval
#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum QueryType {
    /// Get memory usage at location
    MemoryUsage,
    /// Get brick metadata
    BrickInfo,
    /// Get neural state
    NeuralState,
    /// Get performance metrics
    Performance,
}

/// Executor for morphology commands
pub struct MorphologyExecutor {
    /// Command history
    history: Vec<MorphologyCommand>,

    /// Maximum history size
    max_history: usize,

    /// Optional navigation command sender (wired to momentum_camera)
    navigation_tx: Option<broadcast::Sender<NavigationRequest>>,

    /// Optional camera update sender (wired to camera_sync)
    camera_tx: Option<broadcast::Sender<CameraUpdate>>,

    /// Optional aesthetics update sender (wired to renderer)
    aesthetics_tx: Option<broadcast::Sender<AestheticsRequest>>,
}

impl MorphologyExecutor {
    /// Create a new executor
    pub fn new() -> Self {
        Self {
            history: Vec::new(),
            max_history: 100,
            navigation_tx: None,
            camera_tx: None,
            aesthetics_tx: None,
        }
    }

    /// Wire navigation commands to a broadcast channel
    pub fn with_navigation_sender(mut self, tx: broadcast::Sender<NavigationRequest>) -> Self {
        self.navigation_tx = Some(tx);
        self
    }

    /// Wire camera updates to a broadcast channel
    pub fn with_camera_sender(mut self, tx: broadcast::Sender<CameraUpdate>) -> Self {
        self.camera_tx = Some(tx);
        self
    }

    /// Wire aesthetics updates to a broadcast channel
    pub fn with_aesthetics_sender(mut self, tx: broadcast::Sender<AestheticsRequest>) -> Self {
        self.aesthetics_tx = Some(tx);
        self
    }

    /// Execute a morphology command
    pub async fn execute(&mut self, command: MorphologyCommand) -> Result<(), String> {
        log::info!("🔮 Morphology: Executing {:?}", command);

        // Add to history
        self.history.push(command.clone());
        if self.history.len() > self.max_history {
            self.history.remove(0);
        }

        // Execute based on command type
        match command {
            MorphologyCommand::Navigate { x, y, z, duration } => {
                self.execute_navigate(x, y, z, duration).await
            },
            MorphologyCommand::AdjustAesthetics {
                chaos,
                temperature,
                saturation,
            } => {
                self.execute_aesthetics(chaos, temperature, saturation)
                    .await
            },
            MorphologyCommand::CreateBrick {
                x,
                y,
                z,
                description,
            } => self.execute_create_brick(x, y, z, description).await,
            MorphologyCommand::Highlight {
                center,
                radius,
                color,
                duration,
            } => {
                self.execute_highlight(center, radius, color, duration)
                    .await
            },
            MorphologyCommand::CameraControl {
                fov,
                target,
                distance,
            } => self.execute_camera_control(fov, target, distance).await,
            MorphologyCommand::SpawnEffect {
                effect,
                position,
                scale,
            } => self.execute_spawn_effect(effect, position, scale).await,
            MorphologyCommand::Query { query_type, target } => {
                self.execute_query(query_type, target).await
            },
        }
    }

    // Individual execution methods (stubs for now)

    async fn execute_navigate(&self, x: f32, y: f32, z: f32, duration: f32) -> Result<(), String> {
        log::info!("📍 Navigate to ({}, {}, {}) over {}s", x, y, z, duration);

        // Send to camera controller via broadcast channel
        if let Some(ref tx) = self.navigation_tx {
            let request = NavigationRequest { x, y, z, duration };
            if let Err(e) = tx.send(request) {
                log::warn!("Failed to send navigation request: {}", e);
            }
        }

        Ok(())
    }

    async fn execute_aesthetics(
        &self,
        chaos: Option<f32>,
        temperature: Option<f32>,
        saturation: Option<f32>,
    ) -> Result<(), String> {
        log::info!(
            "🎨 Adjust aesthetics: chaos={:?}, temp={:?}, sat={:?}",
            chaos,
            temperature,
            saturation
        );

        // Send to renderer via broadcast channel
        if let Some(ref tx) = self.aesthetics_tx {
            let request = AestheticsRequest { chaos, temperature, saturation };
            if let Err(e) = tx.send(request) {
                log::warn!("Failed to send aesthetics request: {}", e);
            }
        }

        Ok(())
    }

    async fn execute_create_brick(
        &self,
        x: f32,
        y: f32,
        z: f32,
        description: String,
    ) -> Result<(), String> {
        log::info!("🧱 Create brick at ({}, {}, {}): {}", x, y, z, description);
        // TODO: Send to brick generator
        Ok(())
    }

    async fn execute_highlight(
        &self,
        center: (f32, f32, f32),
        radius: f32,
        color: [f32; 4],
        duration: Option<f32>,
    ) -> Result<(), String> {
        log::info!(
            "✨ Highlight at {:?}, radius={}, duration={:?}",
            center,
            radius,
            duration
        );
        // TODO: Send to effect system
        Ok(())
    }

    async fn execute_camera_control(
        &self,
        fov: Option<f32>,
        target: Option<(f32, f32, f32)>,
        distance: Option<f32>,
    ) -> Result<(), String> {
        log::info!(
            "📷 Camera control: fov={:?}, target={:?}, distance={:?}",
            fov,
            target,
            distance
        );

        // Send to camera sync server if wired
        if let Some(tx) = &self.camera_tx {
            let update = CameraUpdate {
                x: 0.0, // Current position (not tracked in morphology)
                y: 0.0,
                zoom: fov.unwrap_or(1.0),
                target_x: target.map(|t| t.0).unwrap_or(0.0),
                target_y: target.map(|t| t.1).unwrap_or(0.0),
                target_zoom: distance.unwrap_or(1.0),
                timestamp: std::time::SystemTime::now()
                    .duration_since(std::time::UNIX_EPOCH)
                    .unwrap()
                    .as_secs(),
            };
            let _ = tx.send(update);
        }

        Ok(())
    }

    async fn execute_spawn_effect(
        &self,
        effect: EffectType,
        position: (f32, f32, f32),
        scale: f32,
    ) -> Result<(), String> {
        log::info!("💫 Spawn {:?} at {:?}, scale={}", effect, position, scale);
        // TODO: Send to effect system
        Ok(())
    }

    async fn execute_query(
        &self,
        query_type: QueryType,
        target: Option<(f32, f32, f32)>,
    ) -> Result<(), String> {
        log::info!("❓ Query {:?} at {:?}", query_type, target);
        // TODO: Query system state
        Ok(())
    }

    /// Get command history
    pub fn get_history(&self) -> &[MorphologyCommand] {
        &self.history
    }
}
