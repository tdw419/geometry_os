//! PixelBrain Inference Pipeline
//!
//! Orchestrates GPU inference through embedding, attention, and FFN layers.

use std::sync::Arc;
use wgpu::{Device, Queue, ComputePipeline, Buffer, TextureView, BindGroupLayout, BindGroup};
use crate::pixel_brain::tokenizer::ByteTokenizer;

/// Configuration for the embedding shader
#[repr(C)]
#[derive(Clone, Copy, bytemuck::Pod, bytemuck::Zeroable)]
pub struct EmbedConfig {
    pub token_id: u32,
    pub hidden_dim: u32,
    pub embed_offset: u32,
    pub atlas_size: u32,
}

/// Configuration for the attention shader
#[repr(C)]
#[derive(Clone, Copy, bytemuck::Pod, bytemuck::Zeroable)]
pub struct AttentionConfig {
    pub layer: u32,
    pub hidden_dim: u32,
    pub head_dim: u32,
    pub seq_len: u32,
    pub q_offset: u32,
    pub k_offset: u32,
    pub v_offset: u32,
    pub o_offset: u32,
    pub atlas_size: u32,
    pub _padding: u32,
}

/// Configuration for the FFN shader
#[repr(C)]
#[derive(Clone, Copy, bytemuck::Pod, bytemuck::Zeroable)]
pub struct FFNConfig {
    pub layer: u32,
    pub hidden_dim: u32,
    pub ffn_dim: u32,
    pub up_offset: u32,
    pub down_offset: u32,
    pub atlas_size: u32,
    pub _padding: [u32; 2],
}

/// Model configuration
pub struct ModelConfig {
    pub hidden_dim: u32,
    pub n_layers: u32,
    pub n_heads: u32,
    pub ffn_dim: u32,
    pub vocab_size: u32,
    pub atlas_size: u32,
}

impl ModelConfig {
    /// Nano model configuration (1M parameters)
    pub fn nano() -> Self {
        Self {
            hidden_dim: 256,
            n_layers: 4,
            n_heads: 4,
            ffn_dim: 1024,
            vocab_size: 256,
            atlas_size: 4096,
        }
    }
}

/// Weight offsets for Nano model layers
pub struct LayerOffsets {
    pub q_offset: u32,
    pub k_offset: u32,
    pub v_offset: u32,
    pub o_offset: u32,
    pub ffn_up_offset: u32,
    pub ffn_down_offset: u32,
}

impl LayerOffsets {
    /// Calculate offsets for a given layer (0-indexed)
    ///
    /// Weight layout per layer:
    /// - Q: 256 * 256 = 65536 weights (0x010000 per layer base)
    /// - K: 256 * 256 = 65536 weights
    /// - V: 256 * 256 = 65536 weights
    /// - O: 256 * 64 = 16384 weights (smaller since head_dim = 64)
    /// - FFN up: 1024 * 256 = 262144 weights
    /// - FFN down: 256 * 1024 = 262144 weights
    pub fn for_layer(layer: u32) -> Self {
        let hidden_dim = 256u32;
        let head_dim = 64u32;
        let ffn_dim = 1024u32;

        // Embeddings take first 256 * 256 = 65536 (0x10000)
        let embed_size = hidden_dim * hidden_dim;
        let layer_base = embed_size + layer * Self::layer_size();

        let q_size = hidden_dim * hidden_dim;
        let k_size = hidden_dim * hidden_dim;
        let v_size = hidden_dim * hidden_dim;
        let o_size = hidden_dim * head_dim;
        let ffn_up_size = ffn_dim * hidden_dim;
        let ffn_down_size = hidden_dim * ffn_dim;

        Self {
            q_offset: layer_base,
            k_offset: layer_base + q_size,
            v_offset: layer_base + q_size + k_size,
            o_offset: layer_base + q_size + k_size + v_size,
            ffn_up_offset: layer_base + q_size + k_size + v_size + o_size,
            ffn_down_offset: layer_base + q_size + k_size + v_size + o_size + ffn_up_size,
        }
    }

    /// Total size per layer in weights
    fn layer_size() -> u32 {
        let hidden_dim = 256u32;
        let head_dim = 64u32;
        let ffn_dim = 1024u32;

        hidden_dim * hidden_dim  // Q
            + hidden_dim * hidden_dim  // K
            + hidden_dim * hidden_dim  // V
            + hidden_dim * head_dim    // O
            + ffn_dim * hidden_dim     // FFN up
            + hidden_dim * ffn_dim     // FFN down
    }

    /// Embedding offset (start of embeddings in atlas)
    pub fn embed_offset() -> u32 {
        0
    }
}

/// PixelBrain inference orchestrator
pub struct PixelBrainInferencer {
    device: Arc<Device>,
    queue: Arc<Queue>,
    config: ModelConfig,

    // Brain atlas texture view
    brain_atlas_view: Option<TextureView>,

    // Pipeline layouts
    embed_pipeline_layout: Option<wgpu::PipelineLayout>,
    attention_pipeline_layout: Option<wgpu::PipelineLayout>,
    ffn_pipeline_layout: Option<wgpu::PipelineLayout>,

    // Bind group layouts
    embed_bind_group_layout: Option<BindGroupLayout>,
    attention_bind_group_layout: Option<BindGroupLayout>,
    ffn_bind_group_layout: Option<BindGroupLayout>,

    // Compute pipelines
    embed_pipeline: Option<ComputePipeline>,
    attention_pipeline: Option<ComputePipeline>,
    ffn_pipeline: Option<ComputePipeline>,

    // Bind groups
    embed_bind_group: Option<BindGroup>,
    attention_bind_group_a: Option<BindGroup>,  // A → B
    attention_bind_group_b: Option<BindGroup>,  // B → A
    ffn_bind_group_a: Option<BindGroup>,        // B → A
    ffn_bind_group_b: Option<BindGroup>,        // A → B

    // Uniform buffers
    embed_uniform_buffer: Option<Buffer>,
    attention_uniform_buffer: Option<Buffer>,
    ffn_uniform_buffer: Option<Buffer>,

    // Storage buffers
    hidden_buffer_a: Option<Buffer>,
    hidden_buffer_b: Option<Buffer>,
    attention_buffer: Option<Buffer>,
    ffn_buffer: Option<Buffer>,

    // Staging buffer for CPU readback
    staging_buffer: Option<Buffer>,
}

impl PixelBrainInferencer {
    /// Create a new inference orchestrator
    pub fn new(device: Arc<Device>, queue: Arc<Queue>) -> Self {
        Self {
            device,
            queue,
            config: ModelConfig::nano(),
            brain_atlas_view: None,
            embed_pipeline_layout: None,
            attention_pipeline_layout: None,
            ffn_pipeline_layout: None,
            embed_bind_group_layout: None,
            attention_bind_group_layout: None,
            ffn_bind_group_layout: None,
            embed_pipeline: None,
            attention_pipeline: None,
            ffn_pipeline: None,
            embed_bind_group: None,
            attention_bind_group_a: None,
            attention_bind_group_b: None,
            ffn_bind_group_a: None,
            ffn_bind_group_b: None,
            embed_uniform_buffer: None,
            attention_uniform_buffer: None,
            ffn_uniform_buffer: None,
            hidden_buffer_a: None,
            hidden_buffer_b: None,
            attention_buffer: None,
            ffn_buffer: None,
            staging_buffer: None,
        }
    }

    /// Create with custom model config
    pub fn with_config(device: Arc<Device>, queue: Arc<Queue>, config: ModelConfig) -> Self {
        Self {
            device,
            queue,
            config,
            brain_atlas_view: None,
            embed_pipeline_layout: None,
            attention_pipeline_layout: None,
            ffn_pipeline_layout: None,
            embed_bind_group_layout: None,
            attention_bind_group_layout: None,
            ffn_bind_group_layout: None,
            embed_pipeline: None,
            attention_pipeline: None,
            ffn_pipeline: None,
            embed_bind_group: None,
            attention_bind_group_a: None,
            attention_bind_group_b: None,
            ffn_bind_group_a: None,
            ffn_bind_group_b: None,
            embed_uniform_buffer: None,
            attention_uniform_buffer: None,
            ffn_uniform_buffer: None,
            hidden_buffer_a: None,
            hidden_buffer_b: None,
            attention_buffer: None,
            ffn_buffer: None,
            staging_buffer: None,
        }
    }

    /// Get the model configuration
    pub fn config(&self) -> &ModelConfig {
        &self.config
    }

    /// Set the brain atlas texture view
    pub fn set_brain_atlas(&mut self, view: TextureView) {
        self.brain_atlas_view = Some(view);
    }

    /// Initialize GPU pipelines with bind group layouts
    pub fn init_pipelines(&mut self) -> Result<(), String> {
        // 1. Create bind group layouts

        // Embed bind group layout:
        // Binding 0: Uniform buffer (EmbedConfig)
        // Binding 1: Texture (brain_atlas)
        // Binding 2: Storage buffer read_write (hidden_state)
        let embed_bind_group_layout = self.device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Embed Bind Group Layout"),
            entries: &[
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
            ],
        });

        // Attention bind group layout:
        // Binding 0: Uniform buffer (AttentionConfig)
        // Binding 1: Texture (brain_atlas)
        // Binding 2: Storage buffer read (hidden_in)
        // Binding 3: Storage buffer read_write (hidden_out)
        // Binding 4: Storage buffer read_write (attention_buffer)
        let attention_bind_group_layout = self.device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Attention Bind Group Layout"),
            entries: &[
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
                wgpu::BindGroupLayoutEntry {
                    binding: 2,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: true },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                wgpu::BindGroupLayoutEntry {
                    binding: 3,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                wgpu::BindGroupLayoutEntry {
                    binding: 4,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
            ],
        });

        // FFN bind group layout:
        // Binding 0: Uniform buffer (FFNConfig)
        // Binding 1: Texture (brain_atlas)
        // Binding 2: Storage buffer read (hidden_in)
        // Binding 3: Storage buffer read_write (hidden_out)
        // Binding 4: Storage buffer read_write (ffn_buffer)
        let ffn_bind_group_layout = self.device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("FFN Bind Group Layout"),
            entries: &[
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
                wgpu::BindGroupLayoutEntry {
                    binding: 2,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: true },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                wgpu::BindGroupLayoutEntry {
                    binding: 3,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                wgpu::BindGroupLayoutEntry {
                    binding: 4,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
            ],
        });

        // 2. Create shader modules
        let embed_shader = self.device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("pixel_brain_embed"),
            source: wgpu::ShaderSource::Wgsl(include_str!("../shaders/pixel_brain_embed.wgsl").into()),
        });

        let attention_shader = self.device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("pixel_brain_attention"),
            source: wgpu::ShaderSource::Wgsl(include_str!("../shaders/pixel_brain_attention.wgsl").into()),
        });

        let ffn_shader = self.device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("pixel_brain_ffn"),
            source: wgpu::ShaderSource::Wgsl(include_str!("../shaders/pixel_brain_ffn.wgsl").into()),
        });

        // 3. Create pipeline layouts
        let embed_pipeline_layout = self.device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Embed Pipeline Layout"),
            bind_group_layouts: &[&embed_bind_group_layout],
            push_constant_ranges: &[],
        });

        let attention_pipeline_layout = self.device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Attention Pipeline Layout"),
            bind_group_layouts: &[&attention_bind_group_layout],
            push_constant_ranges: &[],
        });

        let ffn_pipeline_layout = self.device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("FFN Pipeline Layout"),
            bind_group_layouts: &[&ffn_bind_group_layout],
            push_constant_ranges: &[],
        });

        // 4. Create compute pipelines
        let embed_pipeline = self.device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("Embed Pipeline"),
            layout: Some(&embed_pipeline_layout),
            module: &embed_shader,
            entry_point: "main",
        });

        let attention_pipeline = self.device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("Attention Pipeline"),
            layout: Some(&attention_pipeline_layout),
            module: &attention_shader,
            entry_point: "main",
        });

        let ffn_pipeline = self.device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("FFN Pipeline"),
            layout: Some(&ffn_pipeline_layout),
            module: &ffn_shader,
            entry_point: "main",
        });

        // Store all pipeline-related resources
        self.embed_bind_group_layout = Some(embed_bind_group_layout);
        self.attention_bind_group_layout = Some(attention_bind_group_layout);
        self.ffn_bind_group_layout = Some(ffn_bind_group_layout);
        self.embed_pipeline_layout = Some(embed_pipeline_layout);
        self.attention_pipeline_layout = Some(attention_pipeline_layout);
        self.ffn_pipeline_layout = Some(ffn_pipeline_layout);
        self.embed_pipeline = Some(embed_pipeline);
        self.attention_pipeline = Some(attention_pipeline);
        self.ffn_pipeline = Some(ffn_pipeline);

        Ok(())
    }

    /// Initialize buffers for inference
    pub fn init_buffers(&mut self) {
        let hidden_size = (self.config.hidden_dim as u64) * std::mem::size_of::<f32>() as u64;
        let attention_size = hidden_size;
        let ffn_size = (self.config.ffn_dim as u64) * std::mem::size_of::<f32>() as u64;

        // Create hidden state buffers (ping-pong)
        self.hidden_buffer_a = Some(self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("hidden_buffer_a"),
            size: hidden_size,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_SRC | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        }));

        self.hidden_buffer_b = Some(self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("hidden_buffer_b"),
            size: hidden_size,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_SRC | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        }));

        // Create attention buffer
        self.attention_buffer = Some(self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("attention_buffer"),
            size: attention_size,
            usage: wgpu::BufferUsages::STORAGE,
            mapped_at_creation: false,
        }));

        // Create FFN buffer
        self.ffn_buffer = Some(self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("ffn_buffer"),
            size: ffn_size,
            usage: wgpu::BufferUsages::STORAGE,
            mapped_at_creation: false,
        }));

        // Create staging buffer for CPU readback
        self.staging_buffer = Some(self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("staging_buffer"),
            size: hidden_size,
            usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        }));

        // Create uniform buffers
        self.embed_uniform_buffer = Some(self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("embed_uniform_buffer"),
            size: std::mem::size_of::<EmbedConfig>() as u64,
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        }));

        self.attention_uniform_buffer = Some(self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("attention_uniform_buffer"),
            size: std::mem::size_of::<AttentionConfig>() as u64,
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        }));

        self.ffn_uniform_buffer = Some(self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("ffn_uniform_buffer"),
            size: std::mem::size_of::<FFNConfig>() as u64,
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        }));
    }

    /// Initialize bind groups after setting brain atlas and creating buffers
    pub fn init_bind_groups(&mut self) -> Result<(), String> {
        let brain_view = self.brain_atlas_view.as_ref().ok_or("Brain atlas view not set")?;
        let embed_layout = self.embed_bind_group_layout.as_ref().ok_or("Embed bind group layout not initialized")?;
        let attention_layout = self.attention_bind_group_layout.as_ref().ok_or("Attention bind group layout not initialized")?;
        let ffn_layout = self.ffn_bind_group_layout.as_ref().ok_or("FFN bind group layout not initialized")?;

        let embed_uniform = self.embed_uniform_buffer.as_ref().ok_or("Embed uniform buffer not initialized")?;
        let attention_uniform = self.attention_uniform_buffer.as_ref().ok_or("Attention uniform buffer not initialized")?;
        let ffn_uniform = self.ffn_uniform_buffer.as_ref().ok_or("FFN uniform buffer not initialized")?;

        let hidden_a = self.hidden_buffer_a.as_ref().ok_or("Hidden buffer A not initialized")?;
        let hidden_b = self.hidden_buffer_b.as_ref().ok_or("Hidden buffer B not initialized")?;
        let attn_buf = self.attention_buffer.as_ref().ok_or("Attention buffer not initialized")?;
        let ffn_buf = self.ffn_buffer.as_ref().ok_or("FFN buffer not initialized")?;

        // Create embed bind group
        self.embed_bind_group = Some(self.device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Embed Bind Group"),
            layout: embed_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: embed_uniform.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: wgpu::BindingResource::TextureView(brain_view),
                },
                wgpu::BindGroupEntry {
                    binding: 2,
                    resource: hidden_a.as_entire_binding(),
                },
            ],
        }));

        // Create attention bind groups (A → B and B → A for ping-pong)
        self.attention_bind_group_a = Some(self.device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Attention Bind Group A→B"),
            layout: attention_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: attention_uniform.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: wgpu::BindingResource::TextureView(brain_view),
                },
                wgpu::BindGroupEntry {
                    binding: 2,
                    resource: hidden_a.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 3,
                    resource: hidden_b.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 4,
                    resource: attn_buf.as_entire_binding(),
                },
            ],
        }));

        self.attention_bind_group_b = Some(self.device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Attention Bind Group B→A"),
            layout: attention_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: attention_uniform.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: wgpu::BindingResource::TextureView(brain_view),
                },
                wgpu::BindGroupEntry {
                    binding: 2,
                    resource: hidden_b.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 3,
                    resource: hidden_a.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 4,
                    resource: attn_buf.as_entire_binding(),
                },
            ],
        }));

        // Create FFN bind groups (B → A and A → B for ping-pong)
        self.ffn_bind_group_a = Some(self.device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("FFN Bind Group B→A"),
            layout: ffn_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: ffn_uniform.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: wgpu::BindingResource::TextureView(brain_view),
                },
                wgpu::BindGroupEntry {
                    binding: 2,
                    resource: hidden_b.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 3,
                    resource: hidden_a.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 4,
                    resource: ffn_buf.as_entire_binding(),
                },
            ],
        }));

        self.ffn_bind_group_b = Some(self.device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("FFN Bind Group A→B"),
            layout: ffn_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: ffn_uniform.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: wgpu::BindingResource::TextureView(brain_view),
                },
                wgpu::BindGroupEntry {
                    binding: 2,
                    resource: hidden_a.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 3,
                    resource: hidden_b.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 4,
                    resource: ffn_buf.as_entire_binding(),
                },
            ],
        }));

        Ok(())
    }

    /// Infer the next token given the current token
    /// Returns the predicted next token ID
    pub fn infer_token(&mut self, token_id: u32) -> u32 {
        let embed_pipeline = match &self.embed_pipeline {
            Some(p) => p,
            None => return 0,
        };
        let attention_pipeline = match &self.attention_pipeline {
            Some(p) => p,
            None => return 0,
        };
        let ffn_pipeline = match &self.ffn_pipeline {
            Some(p) => p,
            None => return 0,
        };
        let embed_bind_group = match &self.embed_bind_group {
            Some(bg) => bg,
            None => return 0,
        };
        let hidden_a = match &self.hidden_buffer_a {
            Some(b) => b,
            None => return 0,
        };
        let hidden_b = match &self.hidden_buffer_b {
            Some(b) => b,
            None => return 0,
        };
        let staging = match &self.staging_buffer {
            Some(b) => b,
            None => return 0,
        };
        let embed_uniform = match &self.embed_uniform_buffer {
            Some(b) => b,
            None => return 0,
        };
        let attention_uniform = match &self.attention_uniform_buffer {
            Some(b) => b,
            None => return 0,
        };
        let ffn_uniform = match &self.ffn_uniform_buffer {
            Some(b) => b,
            None => return 0,
        };

        let workgroups = (self.config.hidden_dim + 63) / 64;

        // 1. Write EmbedConfig and dispatch embed shader
        let embed_config = EmbedConfig {
            token_id,
            hidden_dim: self.config.hidden_dim,
            embed_offset: LayerOffsets::embed_offset(),
            atlas_size: self.config.atlas_size,
        };
        self.queue.write_buffer(embed_uniform, 0, bytemuck::bytes_of(&embed_config));

        let mut encoder = self.device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
            label: Some("inference_encoder"),
        });

        // Embed: token → hidden_buffer_a
        {
            let mut compute_pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                label: Some("embed_pass"),
                timestamp_writes: None,
            });
            compute_pass.set_pipeline(embed_pipeline);
            compute_pass.set_bind_group(0, embed_bind_group, &[]);
            compute_pass.dispatch_workgroups(workgroups, 1, 1);
        }

        // 2. For each layer: attention + FFN (ping-pong)
        for layer in 0..self.config.n_layers {
            let offsets = LayerOffsets::for_layer(layer);

            // Attention config
            let attention_config = AttentionConfig {
                layer,
                hidden_dim: self.config.hidden_dim,
                head_dim: self.config.hidden_dim / self.config.n_heads,
                seq_len: 1,
                q_offset: offsets.q_offset,
                k_offset: offsets.k_offset,
                v_offset: offsets.v_offset,
                o_offset: offsets.o_offset,
                atlas_size: self.config.atlas_size,
                _padding: 0,
            };
            self.queue.write_buffer(attention_uniform, 0, bytemuck::bytes_of(&attention_config));

            // FFN config
            let ffn_config = FFNConfig {
                layer,
                hidden_dim: self.config.hidden_dim,
                ffn_dim: self.config.ffn_dim,
                up_offset: offsets.ffn_up_offset,
                down_offset: offsets.ffn_down_offset,
                atlas_size: self.config.atlas_size,
                _padding: [0, 0],
            };
            self.queue.write_buffer(ffn_uniform, 0, bytemuck::bytes_of(&ffn_config));

            // Get bind groups based on which buffer we're reading from
            let (attn_bg, ffn_bg) = if layer % 2 == 0 {
                // First iteration: A → B (attention), B → A (FFN)
                (
                    self.attention_bind_group_a.as_ref().unwrap(),
                    self.ffn_bind_group_a.as_ref().unwrap(),
                )
            } else {
                // Second iteration: B → A (attention), A → B (FFN)
                (
                    self.attention_bind_group_b.as_ref().unwrap(),
                    self.ffn_bind_group_b.as_ref().unwrap(),
                )
            };

            // Dispatch attention
            {
                let mut compute_pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                    label: Some(&format!("attention_pass_layer_{}", layer)),
                    timestamp_writes: None,
                });
                compute_pass.set_pipeline(attention_pipeline);
                compute_pass.set_bind_group(0, attn_bg, &[]);
                compute_pass.dispatch_workgroups(workgroups, 1, 1);
            }

            // Dispatch FFN
            {
                let mut compute_pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                    label: Some(&format!("ffn_pass_layer_{}", layer)),
                    timestamp_writes: None,
                });
                compute_pass.set_pipeline(ffn_pipeline);
                compute_pass.set_bind_group(0, ffn_bg, &[]);
                compute_pass.dispatch_workgroups(workgroups, 1, 1);
            }
        }

        // 3. Copy final hidden state to staging buffer
        // After all layers, result is in hidden_buffer_a (since 4 layers → even → ends in A)
        encoder.copy_buffer_to_buffer(hidden_a, 0, staging, 0, self.config.hidden_dim as u64 * 4);

        self.queue.submit(std::iter::once(encoder.finish()));

        // 4. Map staging buffer and read logits
        let buffer_slice = staging.slice(..);
        let (tx, rx) = std::sync::mpsc::channel();
        buffer_slice.map_async(wgpu::MapMode::Read, move |result| {
            tx.send(result).ok();
        });
        self.device.poll(wgpu::Maintain::Wait);

        // Receive once and check result
        let map_result = rx.recv();
        if let Ok(Ok(())) = map_result {
            let data = buffer_slice.get_mapped_range();
            let logits: &[f32] = bytemuck::cast_slice(&data);

            // 5. Return argmax(logits) as next token
            let mut max_val = f32::NEG_INFINITY;
            let mut max_idx = 0u32;
            for (i, &val) in logits.iter().enumerate() {
                if val > max_val {
                    max_val = val;
                    max_idx = i as u32;
                }
            }

            drop(data);
            staging.unmap();

            // Clamp to vocab size
            max_idx.min(self.config.vocab_size - 1)
        } else {
            0
        }
    }

    /// Get logits for a token (returns full hidden state)
    pub fn get_logits(&mut self, token: u32) -> Vec<f32> {
        // Ensure pipelines and buffers are initialized
        if self.embed_pipeline.is_none() {
            return vec![0.0; self.config.hidden_dim as usize];
        }

        // 1. Dispatch embed shader
        let mut encoder = self.device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
            label: Some("get_logits_encoder"),
        });

        // Write embed config
        let embed_config = EmbedConfig {
            token_id: token,
            hidden_dim: self.config.hidden_dim,
            embed_offset: LayerOffsets::embed_offset(),
            atlas_size: self.config.atlas_size,
        };
        self.queue.write_buffer(
            self.embed_uniform_buffer.as_ref().unwrap(),
            0,
            bytemuck::bytes_of(&embed_config),
        );

        // Dispatch embedding
        {
            let mut compute_pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                label: Some("embed_pass"),
                timestamp_writes: None,
            });
            compute_pass.set_pipeline(self.embed_pipeline.as_ref().unwrap());
            compute_pass.set_bind_group(0, self.embed_bind_group.as_ref().unwrap(), &[]);
            compute_pass.dispatch_workgroups(1, 1, 1);
        }

        // Process through all layers
        let attention_pipeline = self.attention_pipeline.as_ref().unwrap();
        let ffn_pipeline = self.ffn_pipeline.as_ref().unwrap();
        let workgroups = (self.config.hidden_dim + 63) / 64;

        for layer in 0..self.config.n_layers {
            let offsets = LayerOffsets::for_layer(layer);

            // Write attention config
            let attn_config = AttentionConfig {
                layer,
                hidden_dim: self.config.hidden_dim,
                head_dim: self.config.hidden_dim / self.config.n_heads,
                seq_len: 1,
                q_offset: offsets.q_offset,
                k_offset: offsets.k_offset,
                v_offset: offsets.v_offset,
                o_offset: offsets.o_offset,
                atlas_size: self.config.atlas_size,
                _padding: 0,
            };
            self.queue.write_buffer(
                self.attention_uniform_buffer.as_ref().unwrap(),
                0,
                bytemuck::bytes_of(&attn_config),
            );

            // Write FFN config
            let ffn_config = FFNConfig {
                layer,
                hidden_dim: self.config.hidden_dim,
                ffn_dim: self.config.ffn_dim,
                up_offset: offsets.ffn_up_offset,
                down_offset: offsets.ffn_down_offset,
                atlas_size: self.config.atlas_size,
                _padding: [0, 0],
            };
            self.queue.write_buffer(
                self.ffn_uniform_buffer.as_ref().unwrap(),
                0,
                bytemuck::bytes_of(&ffn_config),
            );

            let (attn_bg, ffn_bg) = if layer % 2 == 0 {
                (
                    self.attention_bind_group_a.as_ref().unwrap(),
                    self.ffn_bind_group_a.as_ref().unwrap(),
                )
            } else {
                (
                    self.attention_bind_group_b.as_ref().unwrap(),
                    self.ffn_bind_group_b.as_ref().unwrap(),
                )
            };

            {
                let mut compute_pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                    label: Some(&format!("attention_pass_layer_{}", layer)),
                    timestamp_writes: None,
                });
                compute_pass.set_pipeline(attention_pipeline);
                compute_pass.set_bind_group(0, attn_bg, &[]);
                compute_pass.dispatch_workgroups(workgroups, 1, 1);
            }

            {
                let mut compute_pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                    label: Some(&format!("ffn_pass_layer_{}", layer)),
                    timestamp_writes: None,
                });
                compute_pass.set_pipeline(ffn_pipeline);
                compute_pass.set_bind_group(0, ffn_bg, &[]);
                compute_pass.dispatch_workgroups(workgroups, 1, 1);
            }
        }

        // Copy to staging buffer
        let hidden_a = self.hidden_buffer_a.as_ref().unwrap();
        let staging = self.staging_buffer.as_ref().unwrap();
        encoder.copy_buffer_to_buffer(hidden_a, 0, staging, 0, self.config.hidden_dim as u64 * 4);

        self.queue.submit(std::iter::once(encoder.finish()));

        // Map and read
        let buffer_slice = staging.slice(..);
        let (tx, rx) = std::sync::mpsc::channel();
        buffer_slice.map_async(wgpu::MapMode::Read, move |result| {
            tx.send(result).ok();
        });
        self.device.poll(wgpu::Maintain::Wait);

        let map_result = rx.recv();
        if let Ok(Ok(())) = map_result {
            let data = buffer_slice.get_mapped_range();
            let logits: &[f32] = bytemuck::cast_slice(&data);
            let result = logits.to_vec();

            drop(data);
            staging.unmap();

            result
        } else {
            vec![0.0; self.config.hidden_dim as usize]
        }
    }

    /// Sample a token from logits with temperature
    pub fn sample_with_temperature(logits: &[f32], temperature: f32, vocab_size: usize) -> u32 {
        use rand::prelude::*;

        // Clamp temperature to avoid division by zero
        let temp = temperature.max(0.01);

        // Take only vocab_size logits
        let vocab_logits = &logits[..vocab_size.min(logits.len())];

        // Apply temperature scaling
        let scaled: Vec<f32> = vocab_logits.iter().map(|&x| x / temp).collect();

        // Compute softmax
        let max_val = scaled.iter().cloned().fold(f32::NEG_INFINITY, f32::max);
        let exp_vals: Vec<f32> = scaled.iter().map(|&x| (x - max_val).exp()).collect();
        let sum: f32 = exp_vals.iter().sum();
        let probs: Vec<f32> = exp_vals.iter().map(|&x| x / sum).collect();

        // Sample from distribution
        let mut rng = rand::thread_rng();
        let r: f32 = rng.gen();
        let mut cumulative = 0.0;

        for (i, &p) in probs.iter().enumerate() {
            cumulative += p;
            if r < cumulative {
                return i as u32;
            }
        }

        // Fallback to last token
        (vocab_size - 1) as u32
    }

    /// Generate tokens for a prompt (greedy, temperature = 0)
    pub fn generate(&mut self, prompt: &str, max_tokens: usize) -> Vec<u32> {
        self.generate_with_temperature(prompt, max_tokens, 0.0)
    }

    /// Generate tokens for a prompt with temperature sampling
    pub fn generate_with_temperature(&mut self, prompt: &str, max_tokens: usize, temperature: f32) -> Vec<u32> {
        // Get tokenizer
        let tokenizer = crate::pixel_brain::tokenizer::ByteTokenizer::new();

        // Encode prompt
        let tokens = tokenizer.encode(prompt);

        // Generate tokens autoregressively
        let mut output_tokens = Vec::with_capacity(max_tokens);

        // Start with last token of prompt (or BOS if empty)
        let mut current_token = tokens.last().copied().unwrap_or(0);

        for _ in 0..max_tokens {
            let next_token = if temperature > 0.0 {
                // Sample with temperature
                let logits = self.get_logits(current_token);
                Self::sample_with_temperature(&logits, temperature, self.config.vocab_size)
            } else {
                // Greedy (temperature = 0)
                self.infer_token(current_token)
            };
            output_tokens.push(next_token);

            // Stop on newline or null token
            if next_token == b'\n' as u32 || next_token == 0 {
                break;
            }

            current_token = next_token;
        }

        output_tokens
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_embed_config_size() {
        assert_eq!(std::mem::size_of::<EmbedConfig>(), 16);
    }

    #[test]
    fn test_attention_config_size() {
        assert_eq!(std::mem::size_of::<AttentionConfig>(), 40);
    }

    #[test]
    fn test_ffn_config_size() {
        assert_eq!(std::mem::size_of::<FFNConfig>(), 32);
    }

    #[test]
    fn test_layer_offsets_layer_0() {
        let offsets = LayerOffsets::for_layer(0);
        // Embeddings: 0 - 65535
        // Layer 0 starts at 65536 (0x10000)
        assert_eq!(offsets.q_offset, 65536);
    }

    #[test]
    fn test_layer_offsets_layer_1() {
        let offsets = LayerOffsets::for_layer(1);
        // Embeddings: 65536 (256 * 256)
        // Layer 0 size: Q(65536) + K(65536) + V(65536) + O(16384) + FFN_up(262144) + FFN_down(262144) = 737280
        // Layer 1 starts at 65536 + 737280 = 802816
        assert_eq!(offsets.q_offset, 802816);
    }

    #[test]
    fn test_sample_with_temperature_returns_valid_token() {
        // Test that sampling always returns a valid token index
        let logits = vec![1.0, 2.0, 3.0, 4.0, 5.0];
        for _ in 0..100 {
            let token = PixelBrainInferencer::sample_with_temperature(&logits, 1.0, 5);
            assert!(token < 5, "Token {} should be < 5", token);
        }
    }

    #[test]
    fn test_sample_with_temperature_low_temp_favors_high_logits() {
        // With very low temperature, should almost always pick the highest logit
        let logits = vec![0.0, 0.0, 0.0, 0.0, 100.0]; // Last token has much higher logit
        let mut counts = [0usize; 5];

        for _ in 0..100 {
            let token = PixelBrainInferencer::sample_with_temperature(&logits, 0.01, 5);
            counts[token as usize] += 1;
        }

        // Token 4 should be selected most of the time
        assert!(counts[4] > 90, "Token 4 should dominate with low temp, got {:?}", counts);
    }

    #[test]
    fn test_sample_with_temperature_high_temp_more_random() {
        // With high temperature, distribution should be more uniform
        let logits = vec![0.0, 0.0, 0.0, 0.0, 1.0];
        let mut counts = [0usize; 5];

        for _ in 0..100 {
            let token = PixelBrainInferencer::sample_with_temperature(&logits, 5.0, 5);
            counts[token as usize] += 1;
        }

        // With high temp, we should see more variety
        let non_zero_count = counts.iter().filter(|&&c| c > 0).count();
        assert!(non_zero_count >= 3, "High temp should produce variety, got {:?}", counts);
    }
}
