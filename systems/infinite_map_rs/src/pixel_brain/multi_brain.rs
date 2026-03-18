//! Multi-Brain Communication System
//!
//! Enables multiple PixelBrain instances to communicate through
//! spatial positioning, glyph-based messaging, and shared attention mechanisms.
//!
//! ## Architecture
//!
//! The 4096x4096 atlas is divided into regions:
//! - Brain 1: (0, 0) to (2047, 2047) - Primary weights
//! - Brain 2: (2048, 0) to (4095, 2047) - Secondary weights
//! - Shared Attention: (0, 2048) to (2047, 4095)
//! - Message Queue: (2048, 2048) to (4095, 4095)
//!
//! ## Communication Protocol
//!
//! Messages are encoded as 16x16 glyphs (256 pixels):
//! - Bytes 0-3: sender_id (u32)
//! - Bytes 4-7: recipient_id (u32)
//! - Bytes 8-11: message_type (u32)
//! - Bytes 12-15: timestamp (u32)
//! - Bytes 16-255: payload (240 bytes of data)
//!
//! ## Message Types
//!
//! 1. REQUEST_ATTENTION - Request attention from another brain
//! 2. SHARE_ATTENTION - Share attention weights
//! 3. SYNC_STATE - Synchronize shared state
//! 4. LEARN_SIGNAL - Signal for learning update

use std::sync::atomic::{AtomicU32, Ordering};
use std::sync::{Arc, Mutex};
use wgpu::{BindGroup, Buffer, ComputePipeline, Device, Queue, Texture, TextureView};

use super::atlas::WeightAtlas;
use super::infer::PixelBrainInferencer;

/// Message types for inter-brain communication
#[repr(u32)]
pub enum MessageType {
    RequestAttention = 1,
    ShareAttention = 2,
    SyncState = 3,
    LearnSignal = 4,
}

/// Brain region in the shared atlas
#[derive(Clone, Copy, Debug)]
pub struct BrainRegion {
    /// Brain identifier
    pub id: u32,
    /// X offset in atlas
    pub x: u32,
    /// Y offset in atlas
    pub y: u32,
    /// Region width
    pub width: u32,
    /// Region height
    pub height: u32,
}

impl BrainRegion {
    /// Create a new brain region
    pub fn new(id: u32, x: u32, y: u32, width: u32, height: u32) -> Self {
        Self {
            id,
            x,
            y,
            width,
            height,
        }
    }

    /// Check if a point is within this region
    pub fn contains(&self, x: u32, y: u32) -> bool {
        x >= self.x && x < self.x + self.width && y >= self.y && y < self.y + self.height
    }

    /// Get the center of this region
    pub fn center(&self) -> (u32, u32) {
        (self.x + self.width / 2, self.y + self.height / 2)
    }
}

/// Message glyph - 16x16 pixel message encoded in atlas
#[repr(C)]
#[derive(Clone, Copy, Debug)]
pub struct MessageGlyph {
    /// Sender brain ID
    pub sender_id: u32,
    /// Recipient brain ID
    pub recipient_id: u32,
    /// Message type
    pub message_type: u32,
    /// Timestamp (frame count)
    pub timestamp: u32,
    /// Payload data (60 floats = 240 bytes)
    pub payload: [f32; 60],
}

// Manually implement Pod and Zeroable since [f32; 60] is too large for derive
unsafe impl bytemuck::Zeroable for MessageGlyph {}
unsafe impl bytemuck::Pod for MessageGlyph {}

impl MessageGlyph {
    /// Size of a message glyph in bytes
    pub const SIZE: usize = 256; // 64 pixels * 4 bytes

    /// Create a new message glyph
    pub fn new(
        sender_id: u32,
        recipient_id: u32,
        message_type: MessageType,
        payload: [f32; 60],
    ) -> Self {
        Self {
            sender_id,
            recipient_id,
            message_type: message_type as u32,
            timestamp: 0, // Will be set when sending
            payload,
        }
    }

    /// Create a request attention message
    pub fn request_attention(
        sender_id: u32,
        recipient_id: u32,
        attention_coords: (f32, f32, f32, f32),
    ) -> Self {
        let mut payload = [0.0f32; 60];
        payload[0] = attention_coords.0;
        payload[1] = attention_coords.1;
        payload[2] = attention_coords.2;
        payload[3] = attention_coords.3;
        Self::new(
            sender_id,
            recipient_id,
            MessageType::RequestAttention,
            payload,
        )
    }

    /// Create a share attention message
    pub fn share_attention(
        sender_id: u32,
        recipient_id: u32,
        attention_weights: &[f32; 56],
    ) -> Self {
        let mut payload = [1.0f32; 60];
        payload[4..60].copy_from_slice(attention_weights);
        Self::new(
            sender_id,
            recipient_id,
            MessageType::ShareAttention,
            payload,
        )
    }

    /// Create a sync state message
    pub fn sync_state(sender_id: u32, recipient_id: u32, state_vector: &[f32; 56]) -> Self {
        let mut payload = [0.0f32; 60];
        payload[4..60].copy_from_slice(state_vector);
        Self::new(sender_id, recipient_id, MessageType::SyncState, payload)
    }

    /// Create a learn signal message
    pub fn learn_signal(
        sender_id: u32,
        recipient_id: u32,
        reward: f32,
        gradient: &[f32; 55],
    ) -> Self {
        let mut payload = [1.0f32; 60];
        payload[0] = reward;
        payload[5..60].copy_from_slice(gradient);
        Self::new(sender_id, recipient_id, MessageType::LearnSignal, payload)
    }
}

/// Message queue stored in atlas
pub struct MessageQueue {
    /// Queue texture region in atlas
    region: BrainRegion,
    /// Head pointer (write position)
    head: AtomicU32,
    /// Tail pointer (read position)
    tail: AtomicU32,
    /// Capacity (number of messages)
    capacity: u32,
    /// Current message count
    count: AtomicU32,
}

impl MessageQueue {
    /// Create a new message queue
    pub fn new(region: BrainRegion, capacity: u32) -> Self {
        Self {
            region,
            head: AtomicU32::new(0),
            tail: AtomicU32::new(0),
            capacity,
            count: AtomicU32::new(0),
        }
    }

    /// Get the next write slot
    pub fn next_slot(&self) -> u32 {
        let current = self.head.load(Ordering::Relaxed);
        let next = (current + 1) % self.capacity;
        self.head.store(next, Ordering::Relaxed);
        current
    }

    /// Get the next read slot
    pub fn read_slot(&self) -> u32 {
        let current = self.tail.load(Ordering::Relaxed);
        let next = (current + 1) % self.capacity;
        self.tail.store(next, Ordering::Relaxed);
        current
    }

    /// Check if queue is empty
    pub fn is_empty(&self) -> bool {
        self.count.load(Ordering::Relaxed) == 0
    }

    /// Check if queue is full
    pub fn is_full(&self) -> bool {
        self.count.load(Ordering::Relaxed) >= self.capacity
    }
}

/// Shared attention layer configuration
#[repr(C)]
#[derive(Clone, Copy, bytemuck::Pod, bytemuck::Zeroable)]
pub struct SharedAttentionConfig {
    /// Atlas dimension
    pub atlas_size: u32,
    /// Number of brains
    pub num_brains: u32,
    /// Attention dimension per brain
    pub attention_dim: u32,
    /// Current focus brain (which brain has attention focus)
    pub focus_brain: u32,
    /// Blend factor for shared attention (0.0 = separate, 1.0 = fully shared)
    pub blend_factor: f32,
}

/// Multi-brain coordinator
pub struct MultiBrainCoordinator {
    /// WebGPU device
    device: Arc<Device>,
    /// WebGPU queue
    queue: Arc<Queue>,
    /// Brain instances
    brains: Vec<Arc<Mutex<PixelBrainInferencer>>>,
    /// Brain regions in atlas
    regions: Vec<BrainRegion>,
    /// Shared atlas texture
    atlas_texture: Arc<Texture>,
    /// Shared atlas view
    atlas_view: TextureView,
    /// Message queue
    message_queue: MessageQueue,
    /// Shared attention region
    attention_region: BrainRegion,
    /// Attention blend shader
    attention_pipeline: Option<ComputePipeline>,
    /// Attention uniform buffer
    attention_uniform_buffer: Option<Buffer>,
    /// Frame counter for timestamps
    frame_count: AtomicU32,
}

impl MultiBrainCoordinator {
    /// Create a new multi-brain coordinator
    pub fn new(device: Arc<Device>, queue: Arc<Queue>, atlas_texture: Arc<Texture>) -> Self {
        let atlas_view = atlas_texture.create_view(&wgpu::TextureViewDescriptor::default());

        // Define regions for a 4096x4096 atlas
        // Brain 1: (0, 0) - Primary weights
        let brain1_region = BrainRegion::new(0, 0, 0, 2048, 2048);
        // Brain 2: (2048, 0) - Secondary weights
        let brain2_region = BrainRegion::new(1, 2048, 0, 2048, 2048);
        // Shared Attention: (0, 2048)
        let attention_region = BrainRegion::new(2, 0, 2048, 2048, 2048);
        // Message Queue: (2048, 2048)
        let message_region = BrainRegion::new(3, 2048, 2048, 2048, 2048);

        // Create message queue (capacity = 128 messages)
        let message_queue = MessageQueue::new(message_region, 128);

        Self {
            device,
            queue,
            brains: Vec::new(),
            regions: vec![brain1_region, brain2_region],
            atlas_texture,
            atlas_view,
            message_queue,
            attention_region,
            attention_pipeline: None,
            attention_uniform_buffer: None,
            frame_count: AtomicU32::new(1),
        }
    }

    /// Add a brain to the coordinator
    pub fn add_brain(&mut self, brain: PixelBrainInferencer) -> u32 {
        let id = self.brains.len() as u32;
        self.brains.push(Arc::new(Mutex::new(brain)));
        id
    }

    /// Initialize the attention blending pipeline
    pub fn init_attention_pipeline(&mut self) -> Result<(), String> {
        // Create uniform buffer
        let config = SharedAttentionConfig {
            atlas_size: 4096,
            num_brains: self.brains.len() as u32,
            attention_dim: 256, // Same as hidden_dim
            focus_brain: 0,
            blend_factor: 0.5, // Start with balanced blend
        };

        self.attention_uniform_buffer = Some(self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Shared Attention Uniform Buffer"),
            size: std::mem::size_of::<SharedAttentionConfig>() as u64,
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        }));

        self.queue.write_buffer(
            self.attention_uniform_buffer.as_ref().unwrap(),
            0,
            bytemuck::bytes_of(&config),
        );

        // Load attention blend shader
        let shader = self
            .device
            .create_shader_module(wgpu::ShaderModuleDescriptor {
                label: Some("attention_blend"),
                source: wgpu::ShaderSource::Wgsl(
                    include_str!("../shaders/attention_blend.wgsl").into(),
                ),
            });

        // Create bind group layout
        let bind_group_layout =
            self.device
                .create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
                    label: Some("Attention Blend Layout"),
                    entries: &[
                        // Binding 0: Uniform config
                        wgpu::BindGroupLayoutEntry {
                            binding: 0,
                            visibility: wgpu::ShaderStages::COMPUTE,
                            ty: wgpu::BindingType::Buffer {
                                ty: wgpu::BufferBindingType::Uniform,
                                has_dynamic_offset: false,
                                min_binding_size: None,
                            },
                            count: None,
                        },
                        // Binding 1: Brain 1 atlas view
                        wgpu::BindGroupLayoutEntry {
                            binding: 1,
                            visibility: wgpu::ShaderStages::COMPUTE,
                            ty: wgpu::BindingType::Texture {
                                sample_type: wgpu::TextureSampleType::Float { filterable: false },
                                view_dimension: wgpu::TextureViewDimension::D2,
                                multisampled: false,
                            },
                            count: None,
                        },
                        // Binding 2: Brain 2 atlas view
                        wgpu::BindGroupLayoutEntry {
                            binding: 2,
                            visibility: wgpu::ShaderStages::COMPUTE,
                            ty: wgpu::BindingType::Texture {
                                sample_type: wgpu::TextureSampleType::Float { filterable: false },
                                view_dimension: wgpu::TextureViewDimension::D2,
                                multisampled: false,
                            },
                            count: None,
                        },
                        // Binding 3: Output attention view
                        wgpu::BindGroupLayoutEntry {
                            binding: 2,
                            visibility: wgpu::ShaderStages::COMPUTE,
                            ty: wgpu::BindingType::StorageTexture {
                                access: wgpu::StorageTextureAccess::WriteOnly,
                                format: wgpu::TextureFormat::Rgba16Float,
                                view_dimension: wgpu::TextureViewDimension::D2,
                            },
                            count: None,
                        },
                    ],
                });

        // Create pipeline layout
        let pipeline_layout = self
            .device
            .create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
                label: Some("Attention Blend Pipeline Layout"),
                bind_group_layouts: &[&bind_group_layout],
                push_constant_ranges: &[],
            });

        // Create pipeline
        self.attention_pipeline = Some(self.device.create_compute_pipeline(
            &wgpu::ComputePipelineDescriptor {
                label: Some("Attention Blend Pipeline"),
                layout: Some(&pipeline_layout),
                module: &shader,
                entry_point: "main",
            },
        ));

        Ok(())
    }

    /// Send a message between brains
    pub fn send_message(&self, message: MessageGlyph) -> Result<(), String> {
        if self.message_queue.is_full() {
            return Err("Message queue is full".to_string());
        }

        // Set timestamp
        let frame = self.frame_count.load(Ordering::Relaxed);
        let mut msg = message;
        msg.timestamp = frame;

        // Write message to staging buffer and // This would need a proper staging buffer

        Ok(())
    }

    /// Receive a message for a brain
    pub fn receive_message(&self, brain_id: u32) -> Option<MessageGlyph> {
        if self.message_queue.is_empty() {
            return None;
        }

        // Read the next message from the queue
        // This would read from the atlas texture at the message queue region

        // Check if message is for this brain
        let slot = self.message_queue.read_slot();
        let region = &self.message_queue.region;

        // Calculate message position in atlas
        let msg_x = region.x + (slot % 16) * 16; // 16x16 glyph
        let msg_y = region.y + (slot / 16) * 16;

        // Read the message from texture (simplified)
        // In real implementation, this would be a GPU read operation

        let msg = MessageGlyph {
            sender_id: 1,
            recipient_id: 1,
            message_type: 1,
            timestamp: 1,
            payload: [1.0f32; 60],
        };

        Some(msg)
    }

    /// Blend attention between two brains
    pub fn blend_attention(&self, encoder: &mut wgpu::CommandEncoder) {
        // Create bind group
        let bind_group = self.device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Attention Blend Bind Group"),
            layout: &self
                .attention_pipeline
                .as_ref()
                .unwrap()
                .get_bind_group_layout(0),
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: self
                        .attention_uniform_buffer
                        .as_ref()
                        .unwrap()
                        .as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: wgpu::BindingResource::TextureView(&self.atlas_view),
                },
                wgpu::BindGroupEntry {
                    binding: 2,
                    resource: wgpu::BindingResource::TextureView(&self.atlas_view),
                },
                wgpu::BindGroupEntry {
                    binding: 3,
                    resource: wgpu::BindingResource::TextureView(&self.atlas_view),
                },
            ],
        });

        // Dispatch attention blend shader
        {
            let mut compute_pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                label: Some("Attention Blend Pass"),
                timestamp_writes: None,
            });
            compute_pass.set_pipeline(self.attention_pipeline.as_ref().unwrap());
            compute_pass.set_bind_group(0, &bind_group, &[]);
            compute_pass.dispatch_workgroups(256, 1, 1); // 256 workgroups
        }
    }

    /// Get the by ID
    pub fn get_brain(&self, id: u32) -> Option<Arc<Mutex<PixelBrainInferencer>>> {
        self.brains.get(id as usize).map(Arc::clone)
    }

    /// Get the region by brain ID
    pub fn get_region(&self, id: u32) -> Option<&BrainRegion> {
        self.regions.get(id as usize)
    }

    /// Increment frame counter
    pub fn tick(&self) {
        self.frame_count.fetch_add(1, Ordering::Relaxed);
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_brain_region_creation() {
        let region = BrainRegion::new(0, 0, 0, 2048, 2048);
        assert_eq!(region.id, 0);
        assert_eq!(region.x, 0);
        assert_eq!(region.y, 0);
        assert_eq!(region.width, 2048);
        assert_eq!(region.height, 2048);
    }

    #[test]
    fn test_brain_region_contains() {
        let region = BrainRegion::new(0, 100, 100, 200, 200);
        assert!(region.contains(150, 150));
        assert!(region.contains(100, 100));
        assert!(!region.contains(50, 50));
        assert!(!region.contains(350, 150));
    }

    #[test]
    fn test_brain_region_center() {
        let region = BrainRegion::new(0, 100, 100, 200, 200);
        let (cx, cy) = region.center();
        assert_eq!(cx, 200);
        assert_eq!(cy, 200);
    }

    #[test]
    fn test_message_glyph_creation() {
        let payload = [1.0f32; 60];
        let msg = MessageGlyph::new(0, 1, MessageType::RequestAttention, payload);
        assert_eq!(msg.sender_id, 0);
        assert_eq!(msg.recipient_id, 1);
        assert_eq!(msg.message_type, 1);
    }

    #[test]
    fn test_message_glyph_request_attention() {
        let msg = MessageGlyph::request_attention(0, 1, (0.5, 0.5, 100.0, 200.0));
        assert_eq!(msg.sender_id, 0);
        assert_eq!(msg.recipient_id, 1);
        assert_eq!(msg.message_type, 1);
        assert_eq!(msg.payload[0], 0.5);
        assert_eq!(msg.payload[1], 0.5);
        assert_eq!(msg.payload[2], 100.0);
        assert_eq!(msg.payload[3], 200.0);
    }

    #[test]
    fn test_message_queue_operations() {
        let region = BrainRegion::new(3, 2048, 2048, 2048, 2048);
        let queue = MessageQueue::new(region, 128);

        assert!(queue.is_empty());
        assert!(!queue.is_full());

        let slot = queue.next_slot();
        assert_eq!(slot, 0);

        let slot2 = queue.next_slot();
        assert_eq!(slot2, 1);
    }

    #[test]
    fn test_shared_attention_config_size() {
        assert_eq!(std::mem::size_of::<SharedAttentionConfig>(), 20);
    }
}
