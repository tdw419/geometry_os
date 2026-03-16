//! GPU Hebbian Processor - Parallel Weight Learning on GPU
//!
//! Manages batch Hebbian learning updates via the `hebbian_update.wgsl` shader.
//! Queues weight updates and dispatches them in batches of 256 for efficient
//! GPU parallel processing.
//!
//! Hebbian Rule: delta_w = learning_rate * pre * post * reward
//! "Neurons that fire together, wire together"

use bytemuck::{Pod, Zeroable};
use std::sync::Arc;
use wgpu;

/// Batch size for Hebbian updates (must match shader workgroup size)
const BATCH_SIZE: usize = 256;

/// Hebbian update request for the training pipeline.
///
/// This struct matches the WGSL struct in `hebbian_update.wgsl`.
/// Each update modifies one weight in the brain atlas.
#[repr(C)]
#[derive(Clone, Copy, Debug, Pod, Zeroable, Default)]
pub struct HebbianUpdate {
    /// Hilbert distance in brain atlas (maps to x, y coordinates)
    pub address: u32,
    /// Pre-synaptic neuron activation (input neuron)
    pub pre_activation: f32,
    /// Post-synaptic neuron activation (output neuron)
    pub post_activation: f32,
    /// Reward signal: positive strengthens connection, negative weakens
    pub reward: f32,
}

/// Uniforms for Hebbian shader configuration.
///
/// Matches the WGSL `HebbianUniforms` struct.
#[repr(C)]
#[derive(Clone, Copy, Debug, Pod, Zeroable)]
pub struct HebbianUniforms {
    /// Width/height of brain atlas (power of 2)
    pub atlas_size: u32,
    /// Learning rate (eta) - scales weight updates
    pub learning_rate: f32,
    /// Weight decay for L2 regularization (0.0 to disable)
    pub weight_decay: f32,
    /// Padding to align to 16 bytes
    pub _padding: u32,
}

impl Default for HebbianUniforms {
    fn default() -> Self {
        Self {
            atlas_size: 512,
            learning_rate: 0.01,
            weight_decay: 0.0001,
            _padding: 0,
        }
    }
}

/// GPU Hebbian Processor
///
/// Manages batch processing of Hebbian weight updates on the GPU.
/// Queues updates and dispatches them when the batch is full (256 updates).
///
/// # Example
///
/// ```ignore
/// let processor = GPUHebbianProcessor::new(device, queue, brain_view.clone(), 512);
///
/// // Queue updates
/// processor.queue_update(HebbianUpdate {
///     address: 1234,
///     pre_activation: 0.8,
///     post_activation: 0.6,
///     reward: 1.0,
/// });
///
/// // Process batch
/// let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor::default());
/// processor.dispatch_if_ready(&mut encoder);
/// queue.submit(std::iter::once(encoder.finish()));
///
/// // Flush remaining updates
/// processor.flush(&mut encoder);
/// ```
pub struct GPUHebbianProcessor {
    /// WebGPU device
    device: Arc<wgpu::Device>,
    /// WebGPU queue
    queue: Arc<wgpu::Queue>,
    /// Storage buffer for pending Hebbian updates
    update_buffer: wgpu::Buffer,
    /// Uniform buffer for shader configuration
    uniform_buffer: wgpu::Buffer,
    /// Bind group layout
    bind_group_layout: wgpu::BindGroupLayout,
    /// Bind group connecting buffer + texture + uniforms
    bind_group: wgpu::BindGroup,
    /// Compute pipeline for Hebbian updates
    pipeline: wgpu::ComputePipeline,
    /// Brain atlas texture view (read/write)
    brain_texture_view: wgpu::TextureView,
    /// Atlas size (width/height, must be power of 2)
    atlas_size: u32,
    /// Pending updates waiting to be dispatched
    pending_updates: Vec<HebbianUpdate>,
}

impl GPUHebbianProcessor {
    /// Create a new GPU Hebbian Processor.
    ///
    /// # Arguments
    ///
    /// * `device` - WebGPU device for resource creation
    /// * `queue` - WebGPU queue for buffer writes
    /// * `brain_texture_view` - View into the brain atlas texture (read/write storage)
    /// * `atlas_size` - Width/height of the brain atlas (must be power of 2)
    ///
    /// # Returns
    ///
    /// A new `GPUHebbianProcessor` ready to queue and dispatch Hebbian updates.
    pub fn new(
        device: Arc<wgpu::Device>,
        queue: Arc<wgpu::Queue>,
        brain_texture_view: wgpu::TextureView,
        atlas_size: u32,
    ) -> Self {
        // 1. Create storage buffer for pending updates
        // Size: BATCH_SIZE * sizeof(HebbianUpdate) = 256 * 16 bytes = 4096 bytes
        let update_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Hebbian Update Buffer"),
            size: (BATCH_SIZE * std::mem::size_of::<HebbianUpdate>()) as u64,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // 2. Create uniform buffer
        let uniform_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Hebbian Uniforms Buffer"),
            size: std::mem::size_of::<HebbianUniforms>() as u64,
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // Initialize uniforms
        let uniforms = HebbianUniforms {
            atlas_size,
            learning_rate: 0.01,
            weight_decay: 0.0001,
            _padding: 0,
        };
        queue.write_buffer(&uniform_buffer, 0, bytemuck::bytes_of(&uniforms));

        // 3. Load and compile shader
        let shader =
            device.create_shader_module(wgpu::include_wgsl!("../shaders/hebbian_update.wgsl"));

        // 4. Create bind group layout
        // Binding 0: Storage buffer (pending_updates)
        // Binding 1: Storage texture (brain_atlas)
        // Binding 2: Uniform buffer (uniforms)
        let bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Hebbian Processor Layout"),
            entries: &[
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
                wgpu::BindGroupLayoutEntry {
                    binding: 1,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::StorageTexture {
                        access: wgpu::StorageTextureAccess::ReadWrite,
                        format: wgpu::TextureFormat::Rgba16Float,
                        view_dimension: wgpu::TextureViewDimension::D2,
                    },
                    count: None,
                },
                wgpu::BindGroupLayoutEntry {
                    binding: 2,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Uniform,
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
            ],
        });

        // 5. Create bind group
        let bind_group = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Hebbian Processor Bind Group"),
            layout: &bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: update_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: wgpu::BindingResource::TextureView(&brain_texture_view),
                },
                wgpu::BindGroupEntry {
                    binding: 2,
                    resource: uniform_buffer.as_entire_binding(),
                },
            ],
        });

        // 6. Create compute pipeline
        let pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Hebbian Processor Pipeline Layout"),
            bind_group_layouts: &[&bind_group_layout],
            push_constant_ranges: &[],
        });

        let pipeline = device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("Hebbian Processor Pipeline"),
            layout: Some(&pipeline_layout),
            module: &shader,
            entry_point: "main",
        });

        Self {
            device,
            queue,
            update_buffer,
            uniform_buffer,
            bind_group_layout,
            bind_group,
            pipeline,
            brain_texture_view,
            atlas_size,
            pending_updates: Vec::with_capacity(BATCH_SIZE),
        }
    }

    /// Queue a Hebbian update for batch processing.
    ///
    /// Updates are accumulated until the batch is full (256 updates),
    /// at which point they are automatically dispatched.
    ///
    /// # Arguments
    ///
    /// * `update` - The Hebbian update to queue
    ///
    /// # Returns
    ///
    /// `true` if a dispatch was triggered, `false` otherwise
    pub fn queue_update(&mut self, update: HebbianUpdate) -> bool {
        self.pending_updates.push(update);

        if self.pending_updates.len() >= BATCH_SIZE {
            self.dispatch_batch();
            return true;
        }
        false
    }

    /// Dispatch pending updates if batch is full (256 updates).
    ///
    /// # Arguments
    ///
    /// * `encoder` - Command encoder to record dispatch
    ///
    /// # Returns
    ///
    /// `true` if dispatch occurred, `false` if batch not ready
    pub fn dispatch_if_ready(&mut self, encoder: &mut wgpu::CommandEncoder) -> bool {
        if self.pending_updates.len() >= BATCH_SIZE {
            self.dispatch_with_encoder(encoder);
            return true;
        }
        false
    }

    /// Flush all remaining pending updates.
    ///
    /// Pads the batch with zero updates to reach 256 entries,
    /// then dispatches. Used at end of training epoch to ensure
    /// all updates are processed.
    ///
    /// # Arguments
    ///
    /// * `encoder` - Command encoder to record dispatch
    pub fn flush(&mut self, encoder: &mut wgpu::CommandEncoder) {
        if self.pending_updates.is_empty() {
            return;
        }

        // Pad with zero updates to fill batch
        while self.pending_updates.len() < BATCH_SIZE {
            self.pending_updates.push(HebbianUpdate::default());
        }

        self.dispatch_with_encoder(encoder);
    }

    /// Update learning rate and weight decay parameters.
    ///
    /// # Arguments
    ///
    /// * `learning_rate` - New learning rate (eta)
    /// * `weight_decay` - New weight decay for L2 regularization
    pub fn set_hyperparameters(&self, learning_rate: f32, weight_decay: f32) {
        let uniforms = HebbianUniforms {
            atlas_size: self.atlas_size,
            learning_rate,
            weight_decay,
            _padding: 0,
        };
        self.queue
            .write_buffer(&self.uniform_buffer, 0, bytemuck::bytes_of(&uniforms));
    }

    /// Get number of pending updates waiting to be dispatched.
    pub fn pending_count(&self) -> usize {
        self.pending_updates.len()
    }

    /// Check if batch is ready for dispatch.
    pub fn is_batch_ready(&self) -> bool {
        self.pending_updates.len() >= BATCH_SIZE
    }

    /// Internal: Upload pending updates to GPU and dispatch.
    fn dispatch_batch(&mut self) {
        let mut encoder = self
            .device
            .create_command_encoder(&wgpu::CommandEncoderDescriptor {
                label: Some("Hebbian Batch Dispatch"),
            });
        self.dispatch_with_encoder(&mut encoder);
        self.queue.submit(std::iter::once(encoder.finish()));
    }

    /// Internal: Upload pending updates and record dispatch in encoder.
    fn dispatch_with_encoder(&mut self, encoder: &mut wgpu::CommandEncoder) {
        // Upload pending updates to storage buffer
        self.queue.write_buffer(
            &self.update_buffer,
            0,
            bytemuck::cast_slice(&self.pending_updates),
        );

        // Record compute dispatch
        {
            let mut compute_pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                label: Some("Hebbian Update Pass"),
                timestamp_writes: None,
            });
            compute_pass.set_pipeline(&self.pipeline);
            compute_pass.set_bind_group(0, &self.bind_group, &[]);
            // Dispatch 1 workgroup of 256 threads (one per update)
            compute_pass.dispatch_workgroups(1, 1, 1);
        }

        // Clear pending updates
        self.pending_updates.clear();
    }

    /// Recreate bind group with a new brain texture view.
    ///
    /// Call this if the brain atlas texture is recreated.
    pub fn update_brain_texture(&mut self, brain_texture_view: wgpu::TextureView) {
        self.brain_texture_view = brain_texture_view;

        self.bind_group = self.device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Hebbian Processor Bind Group"),
            layout: &self.bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: self.update_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: wgpu::BindingResource::TextureView(&self.brain_texture_view),
                },
                wgpu::BindGroupEntry {
                    binding: 2,
                    resource: self.uniform_buffer.as_entire_binding(),
                },
            ],
        });
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_hebbian_update_size() {
        // HebbianUpdate should be 16 bytes (4 * 4 bytes)
        assert_eq!(std::mem::size_of::<HebbianUpdate>(), 16);
    }

    #[test]
    fn test_hebbian_uniforms_size() {
        // HebbianUniforms should be 16 bytes (4 * 4 bytes)
        assert_eq!(std::mem::size_of::<HebbianUniforms>(), 16);
    }

    #[test]
    fn test_hebbian_update_default() {
        let update = HebbianUpdate::default();
        assert_eq!(update.address, 0);
        assert_eq!(update.pre_activation, 0.0);
        assert_eq!(update.post_activation, 0.0);
        assert_eq!(update.reward, 0.0);
    }

    #[test]
    fn test_hebbian_uniforms_default() {
        let uniforms = HebbianUniforms::default();
        assert_eq!(uniforms.atlas_size, 512);
        assert_eq!(uniforms.learning_rate, 0.01);
        assert_eq!(uniforms.weight_decay, 0.0001);
    }

    #[test]
    fn test_batch_size() {
        assert_eq!(BATCH_SIZE, 256);
    }
}
