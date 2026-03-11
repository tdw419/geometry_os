/// Morphology - Geometric transformation commands
/// 
/// Defines the command language for manipulating the visual substrate

use serde::{Serialize, Deserialize};

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
}

impl MorphologyExecutor {
    /// Create a new executor
    pub fn new() -> Self {
        Self {
            history: Vec::new(),
            max_history: 100,
        }
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
            }
            MorphologyCommand::AdjustAesthetics { chaos, temperature, saturation } => {
                self.execute_aesthetics(chaos, temperature, saturation).await
            }
            MorphologyCommand::CreateBrick { x, y, z, description } => {
                self.execute_create_brick(x, y, z, description).await
            }
            MorphologyCommand::Highlight { center, radius, color, duration } => {
                self.execute_highlight(center, radius, color, duration).await
            }
            MorphologyCommand::CameraControl { fov, target, distance } => {
                self.execute_camera_control(fov, target, distance).await
            }
            MorphologyCommand::SpawnEffect { effect, position, scale } => {
                self.execute_spawn_effect(effect, position, scale).await
            }
            MorphologyCommand::Query { query_type, target } => {
                self.execute_query(query_type, target).await
            }
        }
    }
    
    // Individual execution methods (stubs for now)
    
    async fn execute_navigate(&self, x: f32, y: f32, z: f32, duration: f32) -> Result<(), String> {
        log::info!("📍 Navigate to ({}, {}, {}) over {}s", x, y, z, duration);
        // TODO: Send to camera controller
        Ok(())
    }
    
    async fn execute_aesthetics(
        &self,
        chaos: Option<f32>,
        temperature: Option<f32>,
        saturation: Option<f32>,
    ) -> Result<(), String> {
        log::info!("🎨 Adjust aesthetics: chaos={:?}, temp={:?}, sat={:?}", 
                   chaos, temperature, saturation);
        // TODO: Send to renderer
        Ok(())
    }
    
    async fn execute_create_brick(&self, x: f32, y: f32, z: f32, description: String) -> Result<(), String> {
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
        log::info!("✨ Highlight at {:?}, radius={}, duration={:?}", center, radius, duration);
        // TODO: Send to effect system
        Ok(())
    }
    
    async fn execute_camera_control(
        &self,
        fov: Option<f32>,
        target: Option<(f32, f32, f32)>,
        distance: Option<f32>,
    ) -> Result<(), String> {
        log::info!("📷 Camera control: fov={:?}, target={:?}, distance={:?}", 
                   fov, target, distance);
        // TODO: Send to camera controller
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
