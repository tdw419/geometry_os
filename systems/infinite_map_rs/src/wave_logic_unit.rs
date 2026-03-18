//! Wave-Logic Unit (WLU) - Analog Computing Area Agent
//!
//! This agent implements a simulated analog substrate using wave interference
//! as a proof-of-concept for continuous computation in Geometry OS.
//!
//! The WLU treats a region of the infinite map as a 2D wave tank where:
//! - Oscillators emit waves at specific frequencies/phases
//! - Waves propagate and interfere according to the wave equation
//! - Logic emerges from interference patterns (constructive = HIGH, destructive = LOW)
//! - Evolution can optimize by nudging wave parameters continuously
//!
//! ## Architecture
//!
//! The `WaveLogicBackend` trait defines the interface for wave simulation backends.
//! Multiple implementations exist:
//! - `WaveLogicUnit` - CPU-based simulation (this module)
//! - `WluGpuResources` - DRM/GBM GPU backend (`backend/drm/wlu_compute.rs`)
//! - Future: wgpu-based GPU backend for integration with main App

use std::time::Instant;

/// Trait defining the interface for wave logic computation backends.
///
/// This abstraction allows the App to switch between CPU and GPU implementations
/// based on hardware capabilities and performance requirements.
///
/// # Design Notes
///
/// - GPU backends should implement async update where possible
/// - All backends must support sensor value readback for logic operations
/// - Oscillator configuration is runtime-modifiable for evolution
pub trait WaveLogicBackend {
    /// Advance the simulation by dt seconds
    fn update(&mut self, dt: f32);

    /// Get the current sensor value (wave amplitude at sensor position)
    fn get_sensor_value(&self) -> f32;

    /// Get the logic output (0 = LOW, 1 = HIGH based on threshold)
    fn get_logic_output(&self) -> u32;

    /// Set oscillator A frequency (Hz)
    fn set_oscillator_a_frequency(&mut self, frequency: f32);

    /// Set oscillator B frequency (Hz)
    fn set_oscillator_b_frequency(&mut self, frequency: f32);

    /// Set oscillator A phase (radians)
    fn set_oscillator_a_phase(&mut self, phase: f32);

    /// Set oscillator B phase (radians)
    fn set_oscillator_b_phase(&mut self, phase: f32);

    /// Set oscillator A amplitude (0.0 to 1.0)
    fn set_oscillator_a_amplitude(&mut self, amplitude: f32);

    /// Set oscillator B amplitude (0.0 to 1.0)
    fn set_oscillator_b_amplitude(&mut self, amplitude: f32);

    /// Get the grid size (width = height)
    fn grid_size(&self) -> u32;

    /// Get current simulation frame number
    fn frame(&self) -> u32;
}

/// Configuration for the Wave-Logic Unit
#[derive(Debug, Clone)]
pub struct WLUConfig {
    /// Size of the wave tank (width = height)
    pub grid_size: u32,
    /// Propagation speed of waves
    pub wave_speed: f32,
    /// Damping factor (0.0 = no damping, 1.0 = full damping)
    pub damping: f32,
    /// Maximum wave amplitude
    pub max_amplitude: f32,
    /// Threshold for detecting logic HIGH
    pub sensor_threshold: f32,
    /// Position of oscillator A
    pub oscillator_a_pos: (u32, u32),
    /// Frequency of oscillator A
    pub oscillator_a_frequency: f32,
    /// Phase of oscillator A
    pub oscillator_a_phase: f32,
    /// Amplitude of oscillator A
    pub oscillator_a_amplitude: f32,
    /// Position of oscillator B
    pub oscillator_b_pos: (u32, u32),
    /// Frequency of oscillator B
    pub oscillator_b_frequency: f32,
    /// Phase of oscillator B
    pub oscillator_b_phase: f32,
    /// Amplitude of oscillator B
    pub oscillator_b_amplitude: f32,
    /// Position of the sensor
    pub sensor_pos: (u32, u32),
}

impl Default for WLUConfig {
    fn default() -> Self {
        Self {
            grid_size: 256,
            wave_speed: 0.1,
            damping: 0.995,
            max_amplitude: 1.0,
            sensor_threshold: 0.5,
            oscillator_a_pos: (64, 128),
            oscillator_a_frequency: 1.0,
            oscillator_a_phase: 0.0,
            oscillator_a_amplitude: 0.5,
            oscillator_b_pos: (192, 128),
            oscillator_b_frequency: 1.0,
            oscillator_b_phase: 0.0,
            oscillator_b_amplitude: 0.5,
            sensor_pos: (128, 128),
        }
    }
}

/// An oscillator that emits waves
#[derive(Debug, Clone, Copy)]
pub struct Oscillator {
    pub position_x: u32,
    pub position_y: u32,
    pub frequency: f32,
    pub phase: f32,
    pub amplitude: f32,
}

/// Current state of the wave field and oscillators
#[derive(Debug, Clone)]
pub struct WLUState {
    /// Current wave heights at each point in the grid
    pub current_field: Vec<Vec<f32>>,
    /// Previous wave heights (needed for velocity calculation)
    pub previous_field: Vec<Vec<f32>>,
    /// State of oscillator A
    pub oscillator_a: Oscillator,
    /// State of oscillator B
    pub oscillator_b: Oscillator,
    /// Current value at the sensor position
    pub sensor_value: f32,
    /// Current logic output (0 = LOW, 1 = HIGH)
    pub logic_output: u32,
    /// Frame counter
    pub frame: u32,
    /// Last update time
    pub last_update: Instant,
}

/// The Wave-Logic Unit Area Agent
///
/// Currently implements CPU-side wave simulation.
/// GPU implementation will use WGSL compute shaders.
pub struct WaveLogicUnit {
    /// Configuration
    config: WLUConfig,
    /// Current state
    state: WLUState,
    /// Whether the WLU is initialized
    initialized: bool,
}

impl WaveLogicUnit {
    /// Create a new Wave-Logic Unit with default configuration
    pub fn new() -> Self {
        let config = WLUConfig::default();
        let state = WLUState {
            current_field: vec![vec![0.0; config.grid_size as usize]; config.grid_size as usize],
            previous_field: vec![vec![0.0; config.grid_size as usize]; config.grid_size as usize],
            oscillator_a: Oscillator {
                position_x: config.oscillator_a_pos.0,
                position_y: config.oscillator_a_pos.1,
                frequency: config.oscillator_a_frequency,
                phase: config.oscillator_a_phase,
                amplitude: config.oscillator_a_amplitude,
            },
            oscillator_b: Oscillator {
                position_x: config.oscillator_b_pos.0,
                position_y: config.oscillator_b_pos.1,
                frequency: config.oscillator_b_frequency,
                phase: config.oscillator_b_phase,
                amplitude: config.oscillator_b_amplitude,
            },
            sensor_value: 0.0,
            logic_output: 0,
            frame: 0,
            last_update: Instant::now(),
        };

        Self {
            config,
            state,
            initialized: true,
        }
    }

    /// Create a new Wave-Logic Unit with custom configuration
    pub fn with_config(config: WLUConfig) -> Self {
        let state = WLUState {
            current_field: vec![vec![0.0; config.grid_size as usize]; config.grid_size as usize],
            previous_field: vec![vec![0.0; config.grid_size as usize]; config.grid_size as usize],
            oscillator_a: Oscillator {
                position_x: config.oscillator_a_pos.0,
                position_y: config.oscillator_a_pos.1,
                frequency: config.oscillator_a_frequency,
                phase: config.oscillator_a_phase,
                amplitude: config.oscillator_a_amplitude,
            },
            oscillator_b: Oscillator {
                position_x: config.oscillator_b_pos.0,
                position_y: config.oscillator_b_pos.1,
                frequency: config.oscillator_b_frequency,
                phase: config.oscillator_b_phase,
                amplitude: config.oscillator_b_amplitude,
            },
            sensor_value: 0.0,
            logic_output: 0,
            frame: 0,
            last_update: Instant::now(),
        };

        Self {
            config,
            state,
            initialized: true,
        }
    }

    /// Update the WLU state (called each frame)
    ///
    /// Uses the 2D wave equation with finite difference method:
    /// u_new = 2*u - u_prev + c^2 * laplacian(u)
    pub fn update(&mut self, dt: f32) {
        if !self.initialized {
            return;
        }

        let time = self.state.last_update.elapsed().as_secs_f32();
        let grid_size = self.config.grid_size as usize;

        // Apply oscillators as wave sources
        let osc_a_value = self.state.oscillator_a.amplitude
            * (2.0 * std::f32::consts::PI * self.state.oscillator_a.frequency * time
                + self.state.oscillator_a.phase)
                .sin();
        let osc_b_value = self.state.oscillator_b.amplitude
            * (2.0 * std::f32::consts::PI * self.state.oscillator_b.frequency * time
                + self.state.oscillator_b.phase)
                .sin();

        // Apply oscillator values to their positions
        let ax = self.state.oscillator_a.position_x as usize;
        let ay = self.state.oscillator_a.position_y as usize;
        let bx = self.state.oscillator_b.position_x as usize;
        let by = self.state.oscillator_b.position_y as usize;

        if ax < grid_size && ay < grid_size {
            self.state.current_field[ay][ax] = osc_a_value;
        }
        if bx < grid_size && by < grid_size {
            self.state.current_field[by][bx] = osc_b_value;
        }

        // Simple wave propagation using finite difference (CPU version)
        // This is a simplified version - GPU implementation will be more efficient
        let c2 = self.config.wave_speed * self.config.wave_speed;
        let damping = self.config.damping;

        // Create new field
        let mut new_field = vec![vec![0.0; grid_size]; grid_size];

        for y in 1..(grid_size - 1) {
            for x in 1..(grid_size - 1) {
                let laplacian = self.state.current_field[y][x + 1]
                    + self.state.current_field[y][x - 1]
                    + self.state.current_field[y + 1][x]
                    + self.state.current_field[y - 1][x]
                    - 4.0 * self.state.current_field[y][x];

                new_field[y][x] = damping
                    * (2.0 * self.state.current_field[y][x] - self.state.previous_field[y][x]
                        + c2 * laplacian * dt * dt);

                // Clamp to max amplitude
                new_field[y][x] =
                    new_field[y][x].clamp(-self.config.max_amplitude, self.config.max_amplitude);
            }
        }

        // Swap buffers
        self.state.previous_field = std::mem::take(&mut self.state.current_field);
        self.state.current_field = new_field;

        // Read sensor value
        let sx = self.config.sensor_pos.0 as usize;
        let sy = self.config.sensor_pos.1 as usize;
        if sx < grid_size && sy < grid_size {
            self.state.sensor_value = self.state.current_field[sy][sx];
        }

        // Determine logic output based on threshold
        self.state.logic_output = if self.state.sensor_value > self.config.sensor_threshold {
            1
        } else {
            0
        };

        self.state.frame += 1;
        self.state.last_update = Instant::now();
    }

    /// Get the current logic output (0 = LOW, 1 = HIGH)
    pub fn get_logic_output(&self) -> u32 {
        self.state.logic_output
    }

    /// Get the current sensor value
    pub fn get_sensor_value(&self) -> f32 {
        self.state.sensor_value
    }

    /// Set oscillator A frequency
    pub fn set_oscillator_a_frequency(&mut self, frequency: f32) {
        self.state.oscillator_a.frequency = frequency;
    }

    /// Set oscillator B frequency
    pub fn set_oscillator_b_frequency(&mut self, frequency: f32) {
        self.state.oscillator_b.frequency = frequency;
    }

    /// Set oscillator A phase
    pub fn set_oscillator_a_phase(&mut self, phase: f32) {
        self.state.oscillator_a.phase = phase;
    }

    /// Set oscillator B phase
    pub fn set_oscillator_b_phase(&mut self, phase: f32) {
        self.state.oscillator_b.phase = phase;
    }

    /// Set oscillator A amplitude
    pub fn set_oscillator_a_amplitude(&mut self, amplitude: f32) {
        self.state.oscillator_a.amplitude = amplitude;
    }

    /// Set oscillator B amplitude
    pub fn set_oscillator_b_amplitude(&mut self, amplitude: f32) {
        self.state.oscillator_b.amplitude = amplitude;
    }

    /// Get the current wave field for visualization
    pub fn get_field(&self) -> &Vec<Vec<f32>> {
        &self.state.current_field
    }

    /// Get the configuration
    pub fn get_config(&self) -> &WLUConfig {
        &self.config
    }

    /// Get the state
    pub fn get_state(&self) -> &WLUState {
        &self.state
    }
}

/// Implement WaveLogicBackend trait for CPU-based WaveLogicUnit
impl WaveLogicBackend for WaveLogicUnit {
    fn update(&mut self, dt: f32) {
        // Call the inherent update method (not recursive - calls WaveLogicUnit::update)
        WaveLogicUnit::update(self, dt);
    }

    fn get_sensor_value(&self) -> f32 {
        self.state.sensor_value
    }

    fn get_logic_output(&self) -> u32 {
        self.state.logic_output
    }

    fn set_oscillator_a_frequency(&mut self, frequency: f32) {
        self.state.oscillator_a.frequency = frequency;
    }

    fn set_oscillator_b_frequency(&mut self, frequency: f32) {
        self.state.oscillator_b.frequency = frequency;
    }

    fn set_oscillator_a_phase(&mut self, phase: f32) {
        self.state.oscillator_a.phase = phase;
    }

    fn set_oscillator_b_phase(&mut self, phase: f32) {
        self.state.oscillator_b.phase = phase;
    }

    fn set_oscillator_a_amplitude(&mut self, amplitude: f32) {
        self.state.oscillator_a.amplitude = amplitude;
    }

    fn set_oscillator_b_amplitude(&mut self, amplitude: f32) {
        self.state.oscillator_b.amplitude = amplitude;
    }

    fn grid_size(&self) -> u32 {
        self.config.grid_size
    }

    fn frame(&self) -> u32 {
        self.state.frame
    }
}

impl Default for WaveLogicUnit {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_wlu_creation() {
        let wlu = WaveLogicUnit::new();
        assert!(wlu.initialized);
        assert_eq!(wlu.config.grid_size, 256);
    }

    #[test]
    fn test_wave_propagation() {
        let mut wlu = WaveLogicUnit::new();

        // Run a few update steps
        for _ in 0..10 {
            wlu.update(0.016);
        }

        // Check that something happened
        assert!(wlu.state.frame > 0);
    }

    #[test]
    fn test_oscillator_control() {
        let mut wlu = WaveLogicUnit::new();

        wlu.set_oscillator_a_frequency(2.0);
        wlu.set_oscillator_b_phase(1.57);

        assert_eq!(wlu.state.oscillator_a.frequency, 2.0);
        assert!((wlu.state.oscillator_b.phase - 1.57).abs() < 0.01);
    }
}
