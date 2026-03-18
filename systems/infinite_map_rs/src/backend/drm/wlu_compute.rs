//! Wave Logic Unit GPU Compute Backend
//!
//! This module provides GPU buffer allocation and management for the Wave-Logic Unit (WLU).
//! It allocates the buffers required for wave equation simulation on the GPU using
//! the DRM/GBM backend.
//!
//! Buffer Layout (matching wave_propagation.wgsl):
//! - Binding 0: previous_field (input, read-only)
//! - Binding 1: current_field (input, read-only)
//! - Binding 2: oscillators (input, storage, read-only)
//! - Binding 3: new_field (output, storage, read-write)
//! - Binding 4: uniforms (uniform buffer)
//! - Binding 5: output (output, storage, read-write)
//!
//! Completed TODOs:
//! - TODO-2/5: GPU buffer allocation ✓
//! - TODO-3/5: Oscillator and uniform buffer updates ✓

use anyhow::{Context, Result};
use std::mem::size_of;

use super::buffer_binding::{BindingPoint, BufferBindingInterface, BoundBuffer};
use super::memory::GpuMemoryAllocator;
use super::device::DrmDevice;

/// Default grid size for wave simulation (must match WGSL shader workgroup size expectations)
pub const DEFAULT_GRID_SIZE: u32 = 256;

/// Maximum number of oscillators supported (matches WGSL array size)
pub const MAX_OSCILLATORS: usize = 2;

/// Oscillator configuration for GPU (matches WGSL struct layout)
/// WGSL requires 16-byte alignment for structs
#[repr(C)]
#[derive(Debug, Clone, Copy, Default)]
pub struct GpuOscillator {
    pub position_x: u32,    // 0-3
    pub position_y: u32,    // 4-7
    pub frequency: f32,     // 8-11
    pub phase: f32,         // 12-15
    pub amplitude: f32,     // 16-19
    _padding: u32,          // 20-23
    _padding2: u32,         // 24-27
    _padding3: u32,         // 28-31
}

impl GpuOscillator {
    /// Create a new GPU oscillator
    pub fn new(x: u32, y: u32, frequency: f32, phase: f32, amplitude: f32) -> Self {
        Self {
            position_x: x,
            position_y: y,
            frequency,
            phase,
            amplitude,
            _padding: 0,
            _padding2: 0,
            _padding3: 0,
        }
    }
}

/// Uniform configuration for wave simulation (matches WGSL struct layout)
/// WGSL requires 16-byte alignment for structs
#[repr(C)]
#[derive(Debug, Clone, Copy)]
pub struct WaveUniforms {
    pub grid_size: u32,           // 0-3
    pub wave_speed: f32,          // 4-7
    pub damping: f32,             // 8-11
    pub max_amplitude: f32,       // 12-15
    pub dt: f32,                  // 16-19
    pub current_time: f32,        // 20-23
    pub sensor_pos_x: u32,        // 24-27
    pub sensor_pos_y: u32,        // 28-31
    _padding: u32,                // 32-35
    _padding2: u32,               // 36-39
}

impl Default for WaveUniforms {
    fn default() -> Self {
        Self {
            grid_size: DEFAULT_GRID_SIZE,
            wave_speed: 0.1,
            damping: 0.995,
            max_amplitude: 1.0,
            dt: 0.016, // ~60 FPS
            current_time: 0.0,
            sensor_pos_x: 128,
            sensor_pos_y: 128,
            _padding: 0,
            _padding2: 0,
        }
    }
}

/// Output from the wave simulation (matches WGSL struct layout)
#[repr(C)]
#[derive(Debug, Clone, Copy, Default)]
pub struct WaveOutput {
    pub sensor_value: f32,
    _padding1: u32,
    _padding2: u32,
    _padding3: u32,
}

/// Index into the bound buffers array
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum WluBufferIndex {
    PreviousField = 0,
    CurrentField = 1,
    Oscillators = 2,
    NewField = 3,
    Uniforms = 4,
    Output = 5,
}

/// GPU resources for Wave Logic Unit simulation
pub struct WluGpuResources {
    /// Buffer binding interface for managing GPU buffers
    bindings: BufferBindingInterface,
    /// Grid size (width = height)
    grid_size: u32,
    /// Size of a single wave field in bytes (grid_size^2 * sizeof(f32))
    field_size: usize,
    /// Current oscillator configuration (CPU-side cache)
    oscillators: [GpuOscillator; MAX_OSCILLATORS],
    /// Current uniforms (CPU-side cache)
    uniforms: WaveUniforms,
    /// Whether buffers have been allocated
    buffers_allocated: bool,
}

impl WluGpuResources {
    /// Create a new WLU GPU resources manager
    pub fn new(drm_device: &DrmDevice) -> Result<Self> {
        let allocator = GpuMemoryAllocator::new(drm_device)
            .context("Failed to create GPU memory allocator for WLU")?;
        let bindings = BufferBindingInterface::new(allocator);
        
        let grid_size = DEFAULT_GRID_SIZE;
        let field_size = (grid_size * grid_size) as usize * size_of::<f32>();
        
        Ok(Self {
            bindings,
            grid_size,
            field_size,
            oscillators: [GpuOscillator::default(); MAX_OSCILLATORS],
            uniforms: WaveUniforms::default(),
            buffers_allocated: false,
        })
    }
    
    /// Create with custom configuration
    pub fn with_config(drm_device: &DrmDevice, grid_size: u32, uniforms: WaveUniforms) -> Result<Self> {
        let allocator = GpuMemoryAllocator::new(drm_device)
            .context("Failed to create GPU memory allocator for WLU")?;
        let bindings = BufferBindingInterface::new(allocator);
        
        let field_size = (grid_size * grid_size) as usize * size_of::<f32>();
        
        Ok(Self {
            bindings,
            grid_size,
            field_size,
            oscillators: [GpuOscillator::default(); MAX_OSCILLATORS],
            uniforms,
            buffers_allocated: false,
        })
    }
    
    /// Allocate all GPU buffers for wave simulation
    ///
    /// This allocates 6 buffers matching the WGSL shader bindings:
    /// - Binding 0: previous_field (input)
    /// - Binding 1: current_field (input)
    /// - Binding 2: oscillators (storage input)
    /// - Binding 3: new_field (storage output)
    /// - Binding 4: uniforms (uniform)
    /// - Binding 5: output (storage output)
    ///
    /// TODO-2/5: This is the main implementation of buffer allocation
    pub fn allocate_buffers(&mut self) -> Result<()> {
        if self.buffers_allocated {
            log::warn!("WLU GPU buffers already allocated, skipping");
            return Ok(());
        }
        
        log::info!(
            "Allocating WLU GPU buffers: grid_size={}x{}, field_size={} bytes",
            self.grid_size,
            self.grid_size,
            self.field_size
        );
        
        // Binding 0: previous_field (input)
        self.bindings.bind_input_buffer(self.field_size, None)
            .context("Failed to allocate previous_field buffer")?;
        
        // Binding 1: current_field (input)
        self.bindings.bind_input_buffer(self.field_size, None)
            .context("Failed to allocate current_field buffer")?;
        
        // Binding 2: oscillators (storage input)
        let oscillators_size = MAX_OSCILLATORS * size_of::<GpuOscillator>();
        let osc_data = unsafe {
            std::slice::from_raw_parts(
                self.oscillators.as_ptr() as *const u8,
                oscillators_size
            )
        };
        self.bindings.bind_storage_buffer(oscillators_size, Some(osc_data))
            .context("Failed to allocate oscillators buffer")?;
        
        // Binding 3: new_field (storage output)
        self.bindings.bind_output_buffer(self.field_size)
            .context("Failed to allocate new_field buffer")?;
        
        // Binding 4: uniforms (uniform buffer)
        let uniforms_data = unsafe {
            std::slice::from_raw_parts(
                &self.uniforms as *const WaveUniforms as *const u8,
                size_of::<WaveUniforms>()
            )
        };
        self.bindings.bind_uniform_buffer(size_of::<WaveUniforms>(), Some(uniforms_data))
            .context("Failed to allocate uniforms buffer")?;
        
        // Binding 5: output (storage output for sensor value)
        let output_size = size_of::<WaveOutput>();
        self.bindings.bind_output_buffer(output_size)
            .context("Failed to allocate output buffer")?;
        
        self.buffers_allocated = true;
        
        log::info!(
            "WLU GPU buffers allocated successfully: {} total buffers, {} total bytes",
            6,
            self.field_size * 3 + oscillators_size + size_of::<WaveUniforms>() + output_size
        );
        
        Ok(())
    }
    
    /// Get the grid size
    pub fn grid_size(&self) -> u32 {
        self.grid_size
    }
    
    /// Get the field size in bytes
    pub fn field_size(&self) -> usize {
        self.field_size
    }
    
    /// Check if buffers have been allocated
    pub fn is_allocated(&self) -> bool {
        self.buffers_allocated
    }
    
    /// Get the buffer binding interface
    pub fn bindings(&self) -> &BufferBindingInterface {
        &self.bindings
    }
    
    /// Get mutable buffer binding interface
    pub fn bindings_mut(&mut self) -> &mut BufferBindingInterface {
        &mut self.bindings
    }
    
    /// Set oscillator configuration
    pub fn set_oscillator(&mut self, index: usize, oscillator: GpuOscillator) {
        if index < MAX_OSCILLATORS {
            self.oscillators[index] = oscillator;
        }
    }
    
    /// Set oscillator and immediately update GPU buffer
    ///
    /// Convenience method that combines set_oscillator and update_oscillators.
    pub fn set_oscillator_sync(&mut self, index: usize, oscillator: GpuOscillator) -> Result<()> {
        self.set_oscillator(index, oscillator);
        self.update_oscillators()
    }
    
    /// Get oscillator configuration
    pub fn get_oscillator(&self, index: usize) -> Option<&GpuOscillator> {
        self.oscillators.get(index)
    }
    
    /// Update oscillator buffer on GPU
    ///
    /// TODO-3/5: Syncs the CPU-side oscillator cache to the GPU buffer.
    /// Must be called after set_oscillator() if buffers are already allocated.
    pub fn update_oscillators(&mut self) -> Result<()> {
        if !self.buffers_allocated {
            log::warn!("Cannot update oscillators: buffers not allocated");
            return Ok(());
        }
        
        let oscillators_size = MAX_OSCILLATORS * size_of::<GpuOscillator>();
        let osc_data = unsafe {
            std::slice::from_raw_parts(
                self.oscillators.as_ptr() as *const u8,
                oscillators_size
            )
        };
        
        self.bindings.write_buffer(WluBufferIndex::Oscillators as usize, osc_data)
            .context("Failed to update oscillator buffer")?;
        
        log::debug!("Updated oscillator buffer on GPU");
        Ok(())
    }
    
    /// Set uniforms configuration
    pub fn set_uniforms(&mut self, uniforms: WaveUniforms) {
        self.uniforms = uniforms;
    }
    
    /// Set uniforms and immediately update GPU buffer
    ///
    /// Convenience method that combines set_uniforms and update_uniforms.
    pub fn set_uniforms_sync(&mut self, uniforms: WaveUniforms) -> Result<()> {
        self.set_uniforms(uniforms);
        self.update_uniforms()
    }
    
    /// Update uniforms buffer on GPU
    ///
    /// TODO-3/5: Syncs the CPU-side uniforms cache to the GPU buffer.
    /// Must be called after set_uniforms() if buffers are already allocated.
    pub fn update_uniforms(&mut self) -> Result<()> {
        if !self.buffers_allocated {
            log::warn!("Cannot update uniforms: buffers not allocated");
            return Ok(());
        }
        
        let uniforms_data = unsafe {
            std::slice::from_raw_parts(
                &self.uniforms as *const WaveUniforms as *const u8,
                size_of::<WaveUniforms>()
            )
        };
        
        self.bindings.write_buffer(WluBufferIndex::Uniforms as usize, uniforms_data)
            .context("Failed to update uniforms buffer")?;
        
        log::debug!("Updated uniforms buffer on GPU");
        Ok(())
    }
    
    /// Get uniforms configuration
    pub fn get_uniforms(&self) -> &WaveUniforms {
        &self.uniforms
    }
    
    /// Get a bound buffer by WLU index
    pub fn get_buffer(&self, index: WluBufferIndex) -> Option<&BoundBuffer> {
        self.bindings.get_buffer(index as usize)
    }
    
    /// Calculate buffer index from 2D coordinates
    pub fn coord_to_index(&self, x: u32, y: u32) -> usize {
        (y * self.grid_size + x) as usize
    }
    
    /// Get total memory used by WLU buffers (in bytes)
    pub fn total_memory(&self) -> usize {
        let oscillators_size = MAX_OSCILLATORS * size_of::<GpuOscillator>();
        let output_size = size_of::<WaveOutput>();
        
        // 3 wave fields + oscillators + uniforms + output
        self.field_size * 3 + oscillators_size + size_of::<WaveUniforms>() + output_size
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_oscillator_size() {
        // Ensure GPU struct matches expected size (8 * 4 = 32 bytes)
        // WGSL requires 16-byte alignment
        assert_eq!(size_of::<GpuOscillator>(), 32);
    }
    
    #[test]
    fn test_uniforms_size() {
        // Ensure uniform struct matches expected size (10 * 4 = 40 bytes)
        // WGSL requires 16-byte alignment
        assert_eq!(size_of::<WaveUniforms>(), 40);
    }
    
    #[test]
    fn test_output_size() {
        // Ensure output struct matches expected size (4 * 4 = 16 bytes)
        assert_eq!(size_of::<WaveOutput>(), 16);
    }
    
    #[test]
    fn test_field_size_calculation() {
        let grid_size = 256u32;
        let expected_size = (grid_size * grid_size) as usize * size_of::<f32>();
        assert_eq!(expected_size, 256 * 256 * 4); // 262,144 bytes
    }
    
    #[test]
    fn test_coord_to_index() {
        let grid_size = 256u32;
        
        // Test corner cases
        assert_eq!((0 * grid_size + 0) as usize, 0);
        assert_eq!((0 * grid_size + 255) as usize, 255);
        assert_eq!((255 * grid_size + 0) as usize, 65280);
        assert_eq!((255 * grid_size + 255) as usize, 65535);
    }
    
    #[test]
    fn test_oscillator_creation() {
        let osc = GpuOscillator::new(128, 64, 440.0, 0.0, 1.0);
        assert_eq!(osc.position_x, 128);
        assert_eq!(osc.position_y, 64);
        assert!((osc.frequency - 440.0).abs() < f32::EPSILON);
        assert!((osc.phase - 0.0).abs() < f32::EPSILON);
        assert!((osc.amplitude - 1.0).abs() < f32::EPSILON);
    }
    
    #[test]
    fn test_uniforms_default() {
        let uniforms = WaveUniforms::default();
        assert_eq!(uniforms.grid_size, DEFAULT_GRID_SIZE);
        assert!((uniforms.wave_speed - 0.1).abs() < f32::EPSILON);
        assert!((uniforms.damping - 0.995).abs() < f32::EPSILON);
    }
}
