//! wgpu-based Wave Logic Unit Backend
//!
//! This module provides a wgpu implementation of the WaveLogicBackend trait,
//! enabling GPU-accelerated wave simulation using portable wgpu compute shaders.
//!
//! # Architecture
//!
//! Unlike the DRM/GBM backend (`backend/drm/wlu_compute.rs`), this implementation:
//! - Uses wgpu for portability across Vulkan, Metal, DX12, and WebGPU
//! - Integrates directly with the App's existing wgpu device/queue
//! - Reuses the existing `wave_logic_unit.wgsl` compute shader
//!
//! # Integration Status
//!
//! Phase 3 of WLU GPU Integration (complexity 4, HIGH impact):
//! - [x] Module structure created
//! - [ ] Buffer allocation and management
//! - [ ] Compute pipeline creation
//! - [ ] WaveLogicBackend trait implementation
//! - [ ] Integration with App
//! - [ ] Performance testing

use anyhow::Result;
use std::mem::size_of;
use std::sync::Arc;
use wgpu::{BindGroup, BindGroupLayout, Buffer, ComputePipeline, Device, Queue};

use crate::wave_logic_unit::WaveLogicBackend;

/// Default grid size for wave simulation (must match WGSL shader workgroup size)
pub const DEFAULT_GRID_SIZE: u32 = 256;

/// Maximum number of oscillators (matches DRM backend)
pub const MAX_OSCILLATORS: usize = 2;

/// Oscillator configuration for GPU (matches WGSL params array layout)
/// Layout: [pos_x, pos_y, frequency, phase, amplitude] = 5 floats per oscillator
#[repr(C)]
#[derive(Debug, Clone, Copy, Default)]
pub struct GpuOscillator {
    pub position_x: u32,
    pub position_y: u32,
    pub frequency: f32,
    pub phase: f32,
    pub amplitude: f32,
}

impl GpuOscillator {
    pub fn new(x: u32, y: u32, frequency: f32, phase: f32, amplitude: f32) -> Self {
        Self {
            position_x: x,
            position_y: y,
            frequency,
            phase,
            amplitude,
        }
    }
}

/// wgpu-based Wave Logic Unit resources
///
/// This struct manages all GPU resources needed for wave simulation:
/// - Two ping-pong buffers for the wave field (current and next state)
/// - Uniform buffer for simulation parameters
/// - Output buffer for sensor readings
/// - Compute pipeline and bind groups
pub struct WluWgpuResources {
    /// wgpu device (shared with App's Renderer)
    device: Arc<Device>,
    /// wgpu queue (shared with App's Renderer)
    queue: Arc<Queue>,

    // GPU Buffers
    /// Input wave field (previous state)
    input_field_buffer: Buffer,
    /// Output wave field (next state)
    output_field_buffer: Buffer,
    /// Uniform parameters buffer (matches WGSL params array)
    params_buffer: Buffer,
    /// Output buffer for sensor value and logic output
    result_buffer: Buffer,
    /// Staging buffer for reading back results
    staging_buffer: Buffer,

    // Compute Pipeline
    /// Compute pipeline for wave propagation
    pipeline: ComputePipeline,
    /// Bind group layout
    bind_group_layout: BindGroupLayout,
    /// Bind group for current frame
    bind_group: BindGroup,

    // Configuration
    /// Grid size (width = height)
    grid_size: u32,
    /// Current frame number
    frame: u32,

    // CPU-side caches
    /// Oscillator configurations
    oscillators: [GpuOscillator; MAX_OSCILLATORS],
    /// Sensor position
    sensor_pos: (u32, u32),
    /// Sensor threshold for logic output
    sensor_threshold: f32,
    /// Wave speed
    wave_speed: f32,
    /// Current sensor value (cached from last update)
    current_sensor_value: f32,
}

impl WluWgpuResources {
    /// Create a new wgpu-based WLU backend
    ///
    /// # Arguments
    ///
    /// * `device` - wgpu device from the App (Arc for sharing with Renderer)
    /// * `queue` - wgpu queue from the App (Arc for sharing with Renderer)
    /// * `grid_size` - Size of the wave simulation grid (default: 256)
    ///
    /// # Returns
    ///
    /// A new WluWgpuResources instance with allocated GPU buffers
    pub fn new(device: Arc<Device>, queue: Arc<Queue>, grid_size: Option<u32>) -> Result<Self> {
        let grid_size = grid_size.unwrap_or(DEFAULT_GRID_SIZE);
        let field_size = (grid_size * grid_size) as usize * size_of::<f32>();

        // Create buffers
        let input_field_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("WLU Input Field"),
            size: field_size as u64,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let output_field_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("WLU Output Field"),
            size: field_size as u64,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        // Params buffer: array<f32, 21> (84 bytes)
        let params_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("WLU Params"),
            size: (21 * size_of::<f32>()) as u64,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // Result buffer: [sensor_value, logic_output] (2 floats = 8 bytes)
        let result_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("WLU Result"),
            size: (2 * size_of::<f32>()) as u64,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        // Staging buffer for CPU readback
        let staging_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("WLU Staging"),
            size: (2 * size_of::<f32>()) as u64,
            usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // Load shader and create compute pipeline
        let shader_source = include_str!("../../shaders/wave_logic_unit.wgsl");
        let shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Wave Logic Unit Shader"),
            source: wgpu::ShaderSource::Wgsl(shader_source.into()),
        });

        // Create bind group layout
        let bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("WLU Bind Group Layout"),
            entries: &[
                // Binding 0: input_field (storage, read)
                wgpu::BindGroupLayoutEntry {
                    binding: 0,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: true },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // Binding 1: output_field (storage, read_write)
                wgpu::BindGroupLayoutEntry {
                    binding: 1,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // Binding 2: result_output (storage, read_write)
                wgpu::BindGroupLayoutEntry {
                    binding: 2,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // Binding 3: params (storage, read-only)
                wgpu::BindGroupLayoutEntry {
                    binding: 3,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: true },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
            ],
        });

        // Create pipeline layout
        let pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("WLU Pipeline Layout"),
            bind_group_layouts: &[&bind_group_layout],
            push_constant_ranges: &[],
        });

        // Create compute pipeline
        let pipeline = device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("WLU Compute Pipeline"),
            layout: Some(&pipeline_layout),
            module: &shader,
            entry_point: "main",
        });

        // Create bind group
        let bind_group = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("WLU Bind Group"),
            layout: &bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: input_field_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: output_field_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 2,
                    resource: result_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 3,
                    resource: params_buffer.as_entire_binding(),
                },
            ],
        });

        // Initialize with default configuration
        let oscillators = [
            GpuOscillator::new(64, 128, 1.0, 0.0, 0.5),
            GpuOscillator::new(192, 128, 1.0, 0.0, 0.5),
        ];

        Ok(Self {
            device,
            queue,
            input_field_buffer,
            output_field_buffer,
            params_buffer,
            result_buffer,
            staging_buffer,
            pipeline,
            bind_group_layout,
            bind_group,
            grid_size,
            frame: 0,
            oscillators,
            sensor_pos: (128, 128),
            sensor_threshold: 0.5,
            wave_speed: 0.1,
            current_sensor_value: 0.0,
        })
    }

    /// Swap input and output buffers (ping-pong)
    fn swap_buffers(&mut self) {
        std::mem::swap(&mut self.input_field_buffer, &mut self.output_field_buffer);

        // Recreate bind group with swapped buffers
        self.bind_group = self.device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("WLU Bind Group"),
            layout: &self.bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: self.input_field_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: self.output_field_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 2,
                    resource: self.result_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 3,
                    resource: self.params_buffer.as_entire_binding(),
                },
            ],
        });
    }

    /// Read back the sensor value from the GPU
    fn read_sensor_value(&mut self) -> Result<f32> {
        // Copy result to staging buffer
        let mut encoder = self
            .device
            .create_command_encoder(&wgpu::CommandEncoderDescriptor {
                label: Some("WLU Readback Encoder"),
            });

        encoder.copy_buffer_to_buffer(
            &self.result_buffer,
            0,
            &self.staging_buffer,
            0,
            (2 * size_of::<f32>()) as u64,
        );

        self.queue.submit(std::iter::once(encoder.finish()));

        // Map staging buffer and read (synchronous for now, should be async in production)
        // Note: In a real implementation, this should be async using buffer_slice.map_async
        let staging_slice = self.staging_buffer.slice(..);
        staging_slice.map_async(wgpu::MapMode::Read, |result| {
            if let Err(e) = result {
                eprintln!("Failed to map staging buffer: {:?}", e);
            }
        });
        self.device.poll(wgpu::Maintain::Wait);

        // Read the mapped data
        {
            let data = staging_slice.get_mapped_range();
            let result: &[f32] = bytemuck::cast_slice(&data);
            self.current_sensor_value = result[0];
        }

        self.staging_buffer.unmap();

        Ok(self.current_sensor_value)
    }

    /// Update the params buffer with current oscillator and simulation settings
    fn update_params_buffer(&self) -> Result<()> {
        // Pack params array matching WGSL layout
        let mut params = [0.0f32; 21];

        // params[0-4]: oscillator A (pos_x, pos_y, freq, phase, amp)
        params[0] = self.oscillators[0].position_x as f32;
        params[1] = self.oscillators[0].position_y as f32;
        params[2] = self.oscillators[0].frequency;
        params[3] = self.oscillators[0].phase;
        params[4] = self.oscillators[0].amplitude;

        // params[5-9]: oscillator B (pos_x, pos_y, freq, phase, amp)
        params[5] = self.oscillators[1].position_x as f32;
        params[6] = self.oscillators[1].position_y as f32;
        params[7] = self.oscillators[1].frequency;
        params[8] = self.oscillators[1].phase;
        params[9] = self.oscillators[1].amplitude;

        // params[10-11]: sensor position (x, y)
        params[10] = self.sensor_pos.0 as f32;
        params[11] = self.sensor_pos.1 as f32;

        // params[12]: wave_speed
        params[12] = self.wave_speed;

        // params[13]: sensor_threshold
        params[13] = self.sensor_threshold;

        // params[14-15]: reserved (set to 0)
        params[14] = 0.0;
        params[15] = 0.0;

        // params[16]: grid_size
        params[16] = self.grid_size as f32;

        // params[17-20]: reserved (set to 0)
        params[17] = 0.0;
        params[18] = 0.0;
        params[19] = 0.0;
        params[20] = 0.0;

        // Upload to GPU
        self.queue
            .write_buffer(&self.params_buffer, 0, bytemuck::cast_slice(&params));

        Ok(())
    }
}

/// Implement WaveLogicBackend trait for wgpu resources
impl WaveLogicBackend for WluWgpuResources {
    fn update(&mut self, dt: f32) {
        // Update params buffer with current oscillator settings
        if let Err(e) = self.update_params_buffer() {
            eprintln!("Failed to update params buffer: {:?}", e);
            return;
        }

        // Create command encoder
        let mut encoder = self
            .device
            .create_command_encoder(&wgpu::CommandEncoderDescriptor {
                label: Some("WLU Update Encoder"),
            });

        // Dispatch compute shader
        {
            let mut compute_pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                label: Some("WLU Compute Pass"),
                timestamp_writes: None,
            });

            compute_pass.set_pipeline(&self.pipeline);
            compute_pass.set_bind_group(0, &self.bind_group, &[]);

            // Workgroup size is 16x16, so we need (grid_size + 15) / 16 workgroups
            let workgroup_count = (self.grid_size + 15) / 16;
            compute_pass.dispatch_workgroups(workgroup_count, workgroup_count, 1);
        }

        // Submit commands
        self.queue.submit(std::iter::once(encoder.finish()));

        // Swap buffers for next frame
        self.swap_buffers();

        // Read back sensor value
        if let Err(e) = self.read_sensor_value() {
            eprintln!("Failed to read sensor value: {:?}", e);
        }

        self.frame += 1;
    }

    fn get_sensor_value(&self) -> f32 {
        self.current_sensor_value
    }

    fn get_logic_output(&self) -> u32 {
        if self.current_sensor_value > self.sensor_threshold {
            1
        } else {
            0
        }
    }

    fn set_oscillator_a_frequency(&mut self, frequency: f32) {
        self.oscillators[0].frequency = frequency;
    }

    fn set_oscillator_b_frequency(&mut self, frequency: f32) {
        self.oscillators[1].frequency = frequency;
    }

    fn set_oscillator_a_phase(&mut self, phase: f32) {
        self.oscillators[0].phase = phase;
    }

    fn set_oscillator_b_phase(&mut self, phase: f32) {
        self.oscillators[1].phase = phase;
    }

    fn set_oscillator_a_amplitude(&mut self, amplitude: f32) {
        self.oscillators[0].amplitude = amplitude;
    }

    fn set_oscillator_b_amplitude(&mut self, amplitude: f32) {
        self.oscillators[1].amplitude = amplitude;
    }

    fn grid_size(&self) -> u32 {
        self.grid_size
    }

    fn frame(&self) -> u32 {
        self.frame
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use serial_test::serial;
    use std::sync::Arc;

    /// Create a test wgpu device for unit tests
    async fn create_test_device() -> Option<(Arc<Device>, Arc<Queue>)> {
        let instance = wgpu::Instance::new(wgpu::InstanceDescriptor {
            backends: wgpu::Backends::all(),
            ..Default::default()
        });

        let adapter = instance
            .request_adapter(&wgpu::RequestAdapterOptions {
                power_preference: wgpu::PowerPreference::default(),
                compatible_surface: None,
                force_fallback_adapter: false,
            })
            .await?;

        let (device, queue) = adapter
            .request_device(&wgpu::DeviceDescriptor::default(), None)
            .await
            .ok()?;

        Some((Arc::new(device), Arc::new(queue)))
    }

    #[test]
    fn test_gpu_oscillator_layout() {
        // Verify struct size matches expectations
        assert_eq!(size_of::<GpuOscillator>(), 20); // 5 * 4 bytes
    }

    #[tokio::test]
    #[serial]
    async fn test_wlu_wgpu_creation() {
        let result = create_test_device().await;
        if let Some((device, queue)) = result {
            let wlu_result = WluWgpuResources::new(device, queue, Some(DEFAULT_GRID_SIZE));

            // Creation should succeed with valid device/queue
            assert!(wlu_result.is_ok(), "WLU wgpu creation should succeed");

            let wlu = wlu_result.unwrap();

            // Verify initial state
            assert_eq!(wlu.grid_size(), DEFAULT_GRID_SIZE);
            assert_eq!(wlu.frame(), 0);
        }
        // Skip if no GPU available
    }

    #[tokio::test]
    #[serial]
    async fn test_wlu_wgpu_update() {
        let result = create_test_device().await;
        if let Some((device, queue)) = result {
            let mut wlu = WluWgpuResources::new(device, queue, Some(DEFAULT_GRID_SIZE))
                .expect("WLU creation should succeed");

            // Initial frame should be 0
            assert_eq!(wlu.frame(), 0);

            // Update should advance frame
            wlu.update(0.016); // ~60fps timestep
            assert_eq!(wlu.frame(), 1);

            // Multiple updates should advance frame counter
            wlu.update(0.016);
            wlu.update(0.016);
            assert_eq!(wlu.frame(), 3);
        }
        // Skip if no GPU available
    }

    #[tokio::test]
    #[serial]
    async fn test_wlu_wgpu_sensor_readback() {
        let result = create_test_device().await;
        if let Some((device, queue)) = result {
            let mut wlu = WluWgpuResources::new(device, queue, Some(DEFAULT_GRID_SIZE))
                .expect("WLU creation should succeed");

            // Set oscillator A to generate waves
            wlu.set_oscillator_a_frequency(1.0);
            wlu.set_oscillator_a_amplitude(1.0);

            // Run simulation for a few frames
            for _ in 0..10 {
                wlu.update(0.016);
            }

            // Sensor value should be a valid float (not NaN or infinite)
            let sensor_value = wlu.get_sensor_value();
            assert!(sensor_value.is_finite(), "Sensor value should be finite");

            // Logic output should be 0 or 1
            let logic_output = wlu.get_logic_output();
            assert!(
                logic_output == 0 || logic_output == 1,
                "Logic output should be 0 or 1"
            );
        }
        // Skip if no GPU available
    }

    #[tokio::test]
    #[serial]
    async fn test_wlu_wgpu_oscillator_configuration() {
        let result = create_test_device().await;
        if let Some((device, queue)) = result {
            let mut wlu = WluWgpuResources::new(device, queue, Some(DEFAULT_GRID_SIZE))
                .expect("WLU creation should succeed");

            // Configure oscillator A
            wlu.set_oscillator_a_frequency(2.5);
            wlu.set_oscillator_a_phase(0.5);
            wlu.set_oscillator_a_amplitude(0.8);

            // Configure oscillator B
            wlu.set_oscillator_b_frequency(3.0);
            wlu.set_oscillator_b_phase(1.0);
            wlu.set_oscillator_b_amplitude(0.6);

            // Run simulation - should not crash
            for _ in 0..5 {
                wlu.update(0.016);
            }

            // Verify frame advanced
            assert_eq!(wlu.frame(), 5);
        }
        // Skip if no GPU available
    }

    #[tokio::test]
    #[serial]
    async fn test_wlu_wgpu_backend_trait_compatibility() {
        let result = create_test_device().await;
        if let Some((device, queue)) = result {
            // Create as trait object to verify interface compatibility
            let wlu: Box<dyn WaveLogicBackend> = Box::new(
                WluWgpuResources::new(device, queue, Some(DEFAULT_GRID_SIZE))
                    .expect("WLU creation should succeed"),
            );

            // Test trait methods
            assert_eq!(wlu.grid_size(), DEFAULT_GRID_SIZE);
            assert_eq!(wlu.frame(), 0);

            // These should not panic
            let _ = wlu.get_sensor_value();
            let _ = wlu.get_logic_output();
        }
        // Skip if no GPU available
    }
}
