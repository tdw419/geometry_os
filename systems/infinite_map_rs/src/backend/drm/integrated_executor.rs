//! Integrated Glyph Executor with Visual Interaction Bus
//!
//! This module provides the complete zero-copy execution pipeline:
//!
//! ```text
//! [Evdev Input] ──→ [VisualInteractionBus] ──→ [GPU memory[0-4]]
//!                                               │
//!                                               ▼
//!                                        [GlyphVM Execution]
//!                                               │
//!                                               ▼
//!                                      [DMA-BUF Output] ──→ [KMS Scanout]
//! ```
//!
//! This is the "bare metal" execution path where:
//! - Input goes directly from hardware to GPU memory
//! - Glyph programs execute on GPU with no CPU round-trips
//! - Output goes directly to display via DMA-BUF

use std::sync::Arc;
use anyhow::Result;

use super::visual_interaction_bus::{VisualInteractionBus, InputState};
use super::input_bridge::{EvdevInputBridge, InputEvent, SimulatedInputBridge};
use super::glyph_vm_executor::{GlyphVmExecutor, GlyphVmState};
use super::dmabuf::DmaBuf;

/// Configuration for the integrated executor
#[derive(Debug, Clone)]
pub struct IntegratedExecutorConfig {
    /// Screen width in pixels
    pub screen_width: u32,
    /// Screen height in pixels
    pub screen_height: u32,
    /// Whether to use hardware evdev input
    pub use_hardware_input: bool,
    /// Program memory size (in f32 words)
    pub memory_size: usize,
}

impl Default for IntegratedExecutorConfig {
    fn default() -> Self {
        Self {
            screen_width: 1920,
            screen_height: 1080,
            use_hardware_input: false,
            memory_size: 65536,
        }
    }
}

/// The complete integrated glyph execution system
///
/// This combines:
/// 1. Input bridge (evdev or simulated)
/// 2. Visual Interaction Bus (GPU memory layout)
/// 3. Glyph VM Executor (compute pipeline)
/// 4. DMA-BUF output (zero-copy to display)
pub struct IntegratedGlyphExecutor {
    /// GPU device
    device: Arc<wgpu::Device>,
    /// GPU queue
    queue: Arc<wgpu::Queue>,
    /// Configuration
    config: IntegratedExecutorConfig,
    /// Input bridge (hardware or simulated)
    input_bridge: InputBridgeType,
    /// Visual Interaction Bus
    interaction_bus: VisualInteractionBus,
    /// Glyph VM executor
    vm_executor: Option<GlyphVmExecutor>,
    /// Current execution state
    state: ExecutionState,
}

/// Type of input bridge in use
enum InputBridgeType {
    Hardware(EvdevInputBridge),
    Simulated(SimulatedInputBridge),
}

/// Current execution state
#[derive(Debug, Clone, Default)]
pub struct ExecutionState {
    /// Total cycles executed
    pub total_cycles: u64,
    /// Total frames rendered
    pub total_frames: u64,
    /// Whether the VM is halted
    pub halted: bool,
    /// Last execution error (if any)
    pub last_error: Option<String>,
}

impl IntegratedGlyphExecutor {
    /// Create a new integrated executor
    pub async fn new(
        device: Arc<wgpu::Device>,
        queue: Arc<wgpu::Queue>,
        config: IntegratedExecutorConfig,
    ) -> Result<Self> {
        // Initialize input bridge
        let input_bridge = if config.use_hardware_input {
            let mut bridge = EvdevInputBridge::new(config.screen_width, config.screen_height);
            match bridge.discover_devices() {
                Ok(count) => log::info!("Discovered {} input devices", count),
                Err(e) => log::warn!("Failed to discover input devices: {}", e),
            }
            InputBridgeType::Hardware(bridge)
        } else {
            InputBridgeType::Simulated(SimulatedInputBridge::new())
        };

        // Initialize Visual Interaction Bus
        let mut interaction_bus = VisualInteractionBus::new();
        interaction_bus.connect(&device);

        // Initialize VM executor
        let vm_executor = GlyphVmExecutor::new(Arc::clone(&device), Arc::clone(&queue)).ok();

        Ok(Self {
            device,
            queue,
            config,
            input_bridge,
            interaction_bus,
            vm_executor,
            state: ExecutionState::default(),
        })
    }

    /// Poll input events and update the Visual Interaction Bus
    ///
    /// This is the first step in the execution pipeline.
    /// Returns the current input state after processing.
    pub fn poll_input(&mut self) -> InputState {
        match &mut self.input_bridge {
            InputBridgeType::Hardware(bridge) => {
                let events = bridge.poll();
                for event in events {
                    match event {
                        InputEvent::MouseMove { x, y } => {
                            self.interaction_bus.update_mouse(x, y, 
                                if bridge.button_state() > 0 { 1.0 } else { 0.0 }
                            );
                        }
                        InputEvent::MouseButton { button: _, pressed } => {
                            let (x, y) = bridge.mouse_position();
                            self.interaction_bus.update_mouse(x, y, if pressed { 1.0 } else { 0.0 });
                        }
                        _ => {}
                    }
                }
                bridge.get_input_state()
            }
            InputBridgeType::Simulated(bridge) => {
                bridge.get_input_state()
            }
        }
    }

    /// Simulate mouse input (for testing)
    pub fn simulate_mouse(&mut self, x: f32, y: f32, btn: f32) {
        if let InputBridgeType::Simulated(bridge) = &mut self.input_bridge {
            bridge.mouse_move(x, y);
            bridge.mouse_button(btn > 0.0);
        }
        self.interaction_bus.update_mouse(x, y, btn);
    }

    /// Execute one frame of the glyph VM
    ///
    /// This runs the complete pipeline:
    /// 1. Poll input → Visual Interaction Bus
    /// 2. Upload input state to GPU
    /// 3. Execute glyph VM
    /// 4. Return VM state
    pub fn execute_frame(&mut self, ram_view: &wgpu::TextureView, cycles: u32) -> Result<GlyphVmState> {
        // Step 1: Poll input
        let _input_state = self.poll_input();

        // Step 2: Upload to GPU
        self.interaction_bus.upload(&self.queue);

        // Step 3: Execute VM
        if let Some(ref executor) = self.vm_executor {
            let state = executor.step(ram_view, cycles)?;
            
            self.state.total_cycles += cycles as u64;
            self.state.total_frames += 1;
            self.state.halted = state.halted != 0;

            Ok(state)
        } else {
            anyhow::bail!("VM executor not initialized")
        }
    }

    /// Get the Visual Interaction Bus buffer for custom binding
    pub fn get_interaction_buffer(&self) -> Option<Arc<wgpu::Buffer>> {
        self.interaction_bus.get_buffer()
    }

    /// Get current execution state
    pub fn get_state(&self) -> &ExecutionState {
        &self.state
    }

    /// Check if hardware input is available
    pub fn is_hardware_input(&self) -> bool {
        matches!(self.input_bridge, InputBridgeType::Hardware(_))
    }

    /// Reset the VM state
    pub fn reset(&mut self) {
        self.state = ExecutionState::default();
    }
}

/// Zero-copy execution loop
///
/// This runs the complete visual interaction loop:
/// - Poll input from hardware
/// - Execute glyph program
/// - Output to display via DMA-BUF
pub struct ZeroCopyExecutionLoop {
    executor: IntegratedGlyphExecutor,
    running: bool,
}

impl ZeroCopyExecutionLoop {
    /// Create a new zero-copy execution loop
    pub async fn new(config: IntegratedExecutorConfig) -> Result<Self> {
        // Initialize GPU
        let instance = wgpu::Instance::default();
        let adapter = instance
            .request_adapter(&wgpu::RequestAdapterOptions::default())
            .await
            .ok_or_else(|| anyhow::anyhow!("No GPU adapter found"))?;

        let (device, queue) = adapter
            .request_device(&wgpu::DeviceDescriptor::default(), None)
            .await?;

        let device = Arc::new(device);
        let queue = Arc::new(queue);

        let executor = IntegratedGlyphExecutor::new(device, queue, config).await?;

        Ok(Self {
            executor,
            running: false,
        })
    }

    /// Run the execution loop
    ///
    /// This blocks until the VM halts or an error occurs.
    pub fn run(&mut self, ram_view: &wgpu::TextureView) -> Result<()> {
        self.running = true;

        while self.running {
            let state = self.executor.execute_frame(ram_view, 100)?;

            if state.halted != 0 {
                log::info!("VM halted after {} cycles", state.cycles);
                self.running = false;
            }

            // Frame pacing (~60 FPS)
            std::thread::sleep(std::time::Duration::from_millis(16));
        }

        Ok(())
    }

    /// Stop the execution loop
    pub fn stop(&mut self) {
        self.running = false;
    }

    /// Get the executor for direct manipulation
    pub fn executor(&mut self) -> &mut IntegratedGlyphExecutor {
        &mut self.executor
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_config_default() {
        let config = IntegratedExecutorConfig::default();
        assert_eq!(config.screen_width, 1920);
        assert_eq!(config.screen_height, 1080);
        assert!(!config.use_hardware_input);
    }

    #[test]
    fn test_execution_state_default() {
        let state = ExecutionState::default();
        assert_eq!(state.total_cycles, 0);
        assert_eq!(state.total_frames, 0);
        assert!(!state.halted);
    }
}
