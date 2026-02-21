#![allow(dead_code, unused_imports, unused_variables)]
//! Thought Renderer - Visual Thought Rendering Component
//!
//! This component renders evolved "thoughts" (neural patterns) as dynamic visual
//! geometry on the infinite map, creating a complete feedback loop between the
//! compositor and the evolution daemon.

use crate::evolution_protocol::{NeuralStateData, CognitiveState, TokenVisualizationData};
use crate::evolution_manager::EvolutionManager;
use crate::glass_ram::dmabuf_exporter::DmaBufExporter;
use crate::glass_ram::dma_sync::DmaFence;
use wgpu::{self, Device, Queue, RenderPass, RenderPipeline, ShaderModule, BindGroup, BindGroupLayout, Buffer, BufferDescriptor, BufferUsages, VertexBufferLayout, VertexState, FragmentState, PrimitiveState, ColorTargetState, MultisampleState, PipelineLayoutDescriptor, RenderPipelineDescriptor, Texture};
use std::sync::{Arc, Mutex};
use std::time::{Duration, Instant};

/// Thought geometry rendering modes
#[derive(Debug, Clone, Copy)]
#[allow(dead_code)]
pub enum ThoughtRenderMode {
    /// Point cloud rendering for sparse representations
    PointCloud,
    /// Line rendering for thought connections
    Lines,
    /// Triangle mesh rendering for solid representations
    Mesh,
    /// Hybrid rendering combining multiple modes
    Hybrid,
}

/// Thought vertex data
#[repr(C)]
#[derive(Debug, Clone, Copy)]
pub struct ThoughtVertex {
    pub position: [f32; 3],
    pub neural_value: f32,
    pub thought_id: f32,
    pub layer_idx: f32,
}

unsafe impl bytemuck::Pod for ThoughtVertex {}
unsafe impl bytemuck::Zeroable for ThoughtVertex {}

/// Thought geometry data
#[derive(Debug, Clone)]
#[allow(dead_code)]
pub struct ThoughtGeometry {
    pub vertices: Vec<ThoughtVertex>,
    pub indices: Vec<u32>,
    pub thought_id: u64,
    pub timestamp: f64,
}

/// Thought renderer configuration
#[allow(dead_code)]
pub struct ThoughtRendererConfig {
    pub mode: ThoughtRenderMode,
    pub point_size: f32,
    pub line_width: f32,
    pub thought_scale: f32,
    pub max_thoughts: usize,
    pub hilbert_order: u32,
    pub enable_glow: bool,
    pub enable_animation: bool,
}

impl Default for ThoughtRendererConfig {
    fn default() -> Self {
        Self {
            mode: ThoughtRenderMode::Hybrid,
            point_size: 4.0,
            line_width: 2.0,
            thought_scale: 1.0,
            max_thoughts: 100,
            hilbert_order: 8,
            enable_glow: true,
            enable_animation: true,
        }
    }
}

/// Uniform buffer data for thought rendering (14n Topological Geometry)
#[repr(C)]
#[derive(Debug, Clone, Copy)]
struct ThoughtUniforms {
    // Layer activations (8 layers)
    layer_0: f32,
    layer_1: f32,
    layer_2: f32,
    layer_3: f32,
    layer_4: f32,
    layer_5: f32,
    layer_6: f32,
    layer_7: f32,
    
    // Audio features
    bass_energy: f32,
    treble_energy: f32,
    volume: f32,
    is_beat: f32,
    startle: f32,
    
    // Input state
    velocity: f32,
    is_focused: f32,
    is_idle: f32,
    chaos: f32,
    
    // Self state
    confidence: f32,
    focus_depth: f32,
    
    // Theory of Mind
    user_intent_confidence: f32,
    user_attention_focus: f32,
    user_engagement_level: f32,
    alignment: f32,
    mind_reading_confidence: f32,
    misalignment_detected: f32,
    
    // Cognitive State
    cognitive_complexity: f32,
    cognitive_safety: f32,
    is_reasoning: f32,
    
    // Derived metrics
    arousal: f32,
    valence: f32,
    entropy: f32,
    
    // Time
    time: f32,
    
    // View projection matrix (16 floats)
    view_proj: [[f32; 4]; 4],
    
    // Additional parameters
    brightness: f32,
    contrast: f32,
    thought_scale: f32,
    hilbert_order: f32,  // Changed to f32 for WGSL compatibility
    
    _pad: [u32; 2], // Padding for alignment
}

unsafe impl bytemuck::Pod for ThoughtUniforms {}
unsafe impl bytemuck::Zeroable for ThoughtUniforms {}

/// Thought renderer - renders neural state as visual geometry
#[allow(dead_code)]
pub struct ThoughtRenderer {
    device: Arc<Device>,
    queue: Arc<Queue>,
    config: ThoughtRendererConfig,
    
    // Rendering resources
    shader: ShaderModule,
    pipeline: RenderPipeline,
    bind_group_layout: BindGroupLayout,
    bind_group: BindGroup,
    uniform_buffer: Buffer,
    vertex_buffer: Buffer,
    index_buffer: Buffer,
    
    // Geometry data
    geometry: Vec<ThoughtGeometry>,
    vertex_count: u32,
    index_count: u32,
    
    // State
    last_update: Instant,
    update_interval: Duration,
    time: f32,
    
    // Evolution manager reference
    evolution_manager: Arc<Mutex<EvolutionManager>>,
    
    // Phase 35.4: Shared Synaptic Layer
    synaptic_layer: Option<Arc<Mutex<crate::synapse::SynapticLayer>>>, // Option to allow gradual rollout

    // Phase 33.2: dmabuf support
    dmabuf_exporter: Option<DmaBufExporter>,
    dmabuf_texture: Option<Texture>,
    dmabuf_fence: Option<DmaFence>,
    enable_dmabuf: bool,
}

impl ThoughtRenderer {
    /// Create a new thought renderer
    pub fn new(
        device: Arc<Device>,
        queue: Arc<Queue>,
        evolution_manager: Arc<Mutex<EvolutionManager>>,
        neural_texture: &wgpu::TextureView,
    ) -> Self {
        Self::with_dmabuf(device, queue, evolution_manager, neural_texture, false)
    }
    
    /// Create a new thought renderer with optional dmabuf support
    pub fn with_dmabuf(
        device: Arc<Device>,
        queue: Arc<Queue>,
        evolution_manager: Arc<Mutex<EvolutionManager>>,
        neural_texture: &wgpu::TextureView,
        enable_dmabuf: bool,
    ) -> Self {
        let config = ThoughtRendererConfig::default();
        
        // Phase 33.2: Initialize dmabuf exporter if enabled
        let dmabuf_exporter = if enable_dmabuf {
            match DmaBufExporter::new(device.clone(), queue.clone()) {
                Ok(exporter) => {
                    log::info!("dmabuf exporter initialized successfully");
                    Some(exporter)
                }
                Err(e) => {
                    log::warn!("Failed to initialize dmabuf exporter: {}. Falling back to standard buffers.", e);
                    None
                }
            }
        } else {
            None
        };
        
        let dmabuf_texture = None;
        let dmabuf_fence = None;
        
        // Load shader
        let shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Thought Geometry Shader"),
            source: wgpu::ShaderSource::Wgsl(include_str!("shaders/thought_geometry.wgsl").into()),
        });
        
        // Create bind group layout
        let bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Thought Bind Group Layout"),
            entries: &[
                wgpu::BindGroupLayoutEntry {
                    binding: 0,
                    visibility: wgpu::ShaderStages::VERTEX | wgpu::ShaderStages::FRAGMENT,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Uniform,
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                wgpu::BindGroupLayoutEntry {
                    binding: 1,
                    visibility: wgpu::ShaderStages::VERTEX | wgpu::ShaderStages::FRAGMENT,
                    ty: wgpu::BindingType::Texture {
                        multisampled: false,
                        view_dimension: wgpu::TextureViewDimension::D2,
                        sample_type: wgpu::TextureSampleType::Float { filterable: false },
                    },
                    count: None,
                },
                wgpu::BindGroupLayoutEntry {
                    binding: 2,
                    visibility: wgpu::ShaderStages::VERTEX | wgpu::ShaderStages::FRAGMENT,
                    ty: wgpu::BindingType::Sampler(wgpu::SamplerBindingType::NonFiltering),
                    count: None,
                },
            ],
        });
        
        // Create uniform buffer with 14n topology parameters
        let uniform_buffer = device.create_buffer(&BufferDescriptor {
            label: Some("Thought Uniform Buffer (14n Topology)"),
            size: std::mem::size_of::<ThoughtUniforms>() as u64,
            usage: BufferUsages::UNIFORM | BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });
        
        // Create vertex buffer
        let vertex_buffer = device.create_buffer(&BufferDescriptor {
            label: Some("Thought Vertex Buffer"),
            size: (config.max_thoughts * 1000 * std::mem::size_of::<ThoughtVertex>()) as u64,
            usage: BufferUsages::VERTEX | BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });
        
        // Create index buffer
        let index_buffer = device.create_buffer(&BufferDescriptor {
            label: Some("Thought Index Buffer"),
            size: (config.max_thoughts * 3000 * std::mem::size_of::<u32>()) as u64,
            usage: BufferUsages::INDEX | BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });
        
        // Create sampler
        let sampler = device.create_sampler(&wgpu::SamplerDescriptor {
            address_mode_u: wgpu::AddressMode::ClampToEdge,
            address_mode_v: wgpu::AddressMode::ClampToEdge,
            address_mode_w: wgpu::AddressMode::ClampToEdge,
            mag_filter: wgpu::FilterMode::Nearest,
            min_filter: wgpu::FilterMode::Nearest,
            mipmap_filter: wgpu::FilterMode::Nearest,
            ..Default::default()
        });
        
        // Create bind group
        let bind_group = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Thought Bind Group"),
            layout: &bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: uniform_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: wgpu::BindingResource::TextureView(neural_texture),
                },
                wgpu::BindGroupEntry {
                    binding: 2,
                    resource: wgpu::BindingResource::Sampler(&sampler),
                },
            ],
        });
        
        // Create pipeline layout
        let pipeline_layout = device.create_pipeline_layout(&PipelineLayoutDescriptor {
            label: Some("Thought Pipeline Layout"),
            bind_group_layouts: &[&bind_group_layout],
            push_constant_ranges: &[],
        });
        
        // Define vertex buffer layout
        let vertex_buffer_layout = VertexBufferLayout {
            array_stride: std::mem::size_of::<ThoughtVertex>() as wgpu::BufferAddress,
            step_mode: wgpu::VertexStepMode::Vertex,
            attributes: &wgpu::vertex_attr_array![
                0 => Float32x3, // position
                1 => Float32,   // neural_value
                2 => Float32,   // thought_id
                3 => Float32,   // layer_idx
            ],
        };
        
        // Create render pipeline
        let pipeline = device.create_render_pipeline(&RenderPipelineDescriptor {
            label: Some("Thought Render Pipeline"),
            layout: Some(&pipeline_layout),
            vertex: VertexState {
                module: &shader,
                entry_point: "vs_thought_vertex",
                buffers: &[vertex_buffer_layout.clone()],
            },
            fragment: Some(FragmentState {
                module: &shader,
                entry_point: "fs_thought_fragment",
                targets: &[Some(ColorTargetState {
                    format: wgpu::TextureFormat::Bgra8UnormSrgb,
                    blend: Some(wgpu::BlendState {
                        color: wgpu::BlendComponent {
                            src_factor: wgpu::BlendFactor::SrcAlpha,
                            dst_factor: wgpu::BlendFactor::OneMinusSrcAlpha,
                            operation: wgpu::BlendOperation::Add,
                        },
                        alpha: wgpu::BlendComponent {
                            src_factor: wgpu::BlendFactor::One,
                            dst_factor: wgpu::BlendFactor::One,
                            operation: wgpu::BlendOperation::Add,
                        },
                    }),
                    write_mask: wgpu::ColorWrites::ALL,
                })],
            }),
            primitive: PrimitiveState {
                topology: wgpu::PrimitiveTopology::TriangleList,
                strip_index_format: None,
                front_face: wgpu::FrontFace::Ccw,
                cull_mode: Some(wgpu::Face::Back),
                polygon_mode: wgpu::PolygonMode::Fill,
                unclipped_depth: false,
                conservative: false,
            },
            depth_stencil: None,
            multisample: MultisampleState {
                count: 1,
                mask: !0,
                alpha_to_coverage_enabled: false,
            },
            multiview: None,
            });
        
        Self {
            device,
            queue,
            config,
            shader,
            pipeline,
            bind_group_layout,
            bind_group,
            uniform_buffer,
            vertex_buffer,
            index_buffer,
            geometry: Vec::new(),
            vertex_count: 0,
            index_count: 0,
            last_update: Instant::now(),
            update_interval: Duration::from_millis(100), // 10Hz update rate
            time: 0.0,
            evolution_manager,
            synaptic_layer: None,
            dmabuf_exporter,
            dmabuf_texture,
            dmabuf_fence,
            enable_dmabuf,
        }
    }

    pub fn set_synaptic_layer(&mut self, layer: Arc<Mutex<crate::synapse::SynapticLayer>>) {
        self.synaptic_layer = Some(layer);
    }
    
    /// Update thought renderer (call this periodically)
    pub fn update(&mut self, view_proj: &[[f32; 4]; 4]) {
        let now = Instant::now();
        
        // Update time
        self.time = now.duration_since(self.last_update).as_secs_f32();
        
        // Only update geometry at specified interval
        if now.duration_since(self.last_update) < self.update_interval {
            return;
        }
        
        self.last_update = now;
        
        // Fetch neural state from evolution manager
        let (neural_state_opt, cognitive_state_opt) = {
            let manager = self.evolution_manager.lock().unwrap();
            (
                manager.get_neural_state().cloned(),
                manager.get_cognitive_state().cloned()
            )
        };
        
        if let Some(neural_state) = &neural_state_opt {
            self.generate_geometry_from_neural_state(neural_state);
        }
        
        // Update uniform buffer (audio features will be None initially, will be set by app)
        self.update_uniforms(view_proj, neural_state_opt.as_ref(), cognitive_state_opt.as_ref(), None);
    }
    
    /// Update thought renderer with audio features (Phase 28)
    pub fn update_with_audio(&mut self, view_proj: &[[f32; 4]; 4], audio_features: Option<&crate::audio_manager::AudioFeatures>) {
        let now = Instant::now();
        
        // Update time
        self.time = now.duration_since(self.last_update).as_secs_f32();
        
        // Only update geometry at specified interval
        if now.duration_since(self.last_update) < self.update_interval {
            return;
        }
        
        self.last_update = now;
        
        // Fetch neural state from evolution manager
        let (neural_state_opt, cognitive_state_opt) = {
            let manager = self.evolution_manager.lock().unwrap();
            (
                manager.get_neural_state().cloned(),
                manager.get_cognitive_state().cloned()
            )
        };
        
        if let Some(neural_state) = &neural_state_opt {
            self.generate_geometry_from_neural_state(neural_state);
        }
        
        // Update uniform buffer with audio features
        self.update_uniforms(view_proj, neural_state_opt.as_ref(), cognitive_state_opt.as_ref(), audio_features);
    }
    
    /// Phase 33.2: Update thought renderer with dmabuf support
    pub fn update_with_dmabuf(&mut self, view_proj: &[[f32; 4]; 4]) -> Result<(), Box<dyn std::error::Error>> {
        if !self.enable_dmabuf || self.dmabuf_exporter.is_none() {
            // Fallback to standard update if dmabuf not enabled
            self.update(view_proj);
            return Ok(());
        }
        
        let now = Instant::now();
        
        // Update time
        self.time = now.duration_since(self.last_update).as_secs_f32();
        
        // Only update geometry at specified interval
        if now.duration_since(self.last_update) < self.update_interval {
            return Ok(());
        }
        
        self.last_update = now;
        
        // Fetch neural state from evolution manager
        let (neural_state_opt, cognitive_state_opt) = {
            let manager = self.evolution_manager.lock().unwrap();
            (
                manager.get_neural_state().cloned(),
                manager.get_cognitive_state().cloned()
            )
        };
        
        if let Some(neural_state) = &neural_state_opt {
            self.generate_geometry_from_neural_state(neural_state);
        }
        
        // Update uniform buffer
        self.update_uniforms(view_proj, neural_state_opt.as_ref(), cognitive_state_opt.as_ref(), None);
        
        // Phase 33.2: Create or update dmabuf texture
        if let (Some(exporter), texture) = (&self.dmabuf_exporter, &mut self.dmabuf_texture) {
            // Create dmabuf-backed texture (4096x4096 for Hilbert grid)
            let (_fd, new_texture) = exporter.create_shared_buffer(
                4096,  // Width (Hilbert grid)
                4096,  // Height
                wgpu::TextureFormat::Rgba8UnormSrgb,
            )?;
            
            // Sync before GPU read
            if let Some(ref fence) = self.dmabuf_fence {
                fence.wait(100)?;  // 100ms timeout
            }
            
            *texture = Some(new_texture);
            
            log::debug!("Updated dmabuf texture for Glass RAM");
        }
        
        Ok(())
    }
    
    /// Check if dmabuf is enabled
    pub fn is_dmabuf_enabled(&self) -> bool {
        self.enable_dmabuf && self.dmabuf_exporter.is_some()
    }
    
    /// Get the dmabuf texture (if available)
    pub fn dmabuf_texture(&self) -> Option<&Texture> {
        self.dmabuf_texture.as_ref()
    }
    
    /// Generate geometry from neural state
    fn generate_geometry_from_neural_state(&mut self, neural_state: &NeuralStateData) {
        let mut vertices = Vec::new();
        let mut indices = Vec::new();
        
        // Use Hilbert curve for spatial coherence
        let hilbert_size = 2u32.pow(self.config.hilbert_order);
        
        // Generate geometry from thought vector
        for (i, &value) in neural_state.thought_vector.iter().enumerate() {
            if i >= self.config.max_thoughts {
                break;
            }
            
            // Map thought index to 2D position using Hilbert curve
            let hilbert_pos = self.hilbert_d2xy(hilbert_size, i as u32);
            let x = (hilbert_pos.0 as f32 - hilbert_size as f32 / 2.0) / (hilbert_size as f32 / 2.0);
            let y = (hilbert_pos.1 as f32 - hilbert_size as f32 / 2.0) / (hilbert_size as f32 / 2.0);
            let z = value * 2.0 - 1.0; // Map to [-1, 1]
            
            // Create vertex
            let vertex = ThoughtVertex {
                position: [x, y, z],
                neural_value: value.abs(),
                thought_id: i as f32,
                layer_idx: (i % 4) as f32, // Simulate layer distribution
            };
            
            let vertex_idx = vertices.len() as u32;
            vertices.push(vertex);
            
            // Generate geometry based on mode
            match self.config.mode {
                ThoughtRenderMode::PointCloud => {
                    // Points only, no indices needed
                }
                ThoughtRenderMode::Lines => {
                    // Connect to nearby thoughts
                    if i > 0 {
                        indices.push(vertex_idx - 1);
                        indices.push(vertex_idx);
                    }
                }
                ThoughtRenderMode::Mesh => {
                    // Create triangles
                    if i >= 2 {
                        indices.push(vertex_idx - 2);
                        indices.push(vertex_idx - 1);
                        indices.push(vertex_idx);
                    }
                }
                ThoughtRenderMode::Hybrid => {
                    // Combine point and line rendering
                    if i > 0 {
                        indices.push(vertex_idx - 1);
                        indices.push(vertex_idx);
                    }
                }
            }
        }

        // Phase 35.4: Visualize Active Synapses
        if let Some(synaptic_layer) = &self.synaptic_layer {
            if let Ok(layer) = synaptic_layer.lock() {
                // Determine cut-off time (e.g. 500ms visualization persistence)
                let now = std::time::SystemTime::now()
                    .duration_since(std::time::UNIX_EPOCH)
                    .unwrap()
                    .as_millis() as u64;
                
                for (id, action, score, timestamp) in &layer.active_resonances {
                    // Only show recent firings (500ms)
                    if now - timestamp < 500 {
                        // Find synapse source vector to determine start point
                        if let Some(synapse) = layer.synapses.get(id) {
                            // Find peak of source vector (argmax)
                            let mut max_val = -1.0;
                            let mut max_idx = 0;
                            for (i, &val) in synapse.source_vector.iter().enumerate() {
                                if val > max_val {
                                    max_val = val;
                                    max_idx = i;
                                }
                            }
                            
                            // Map start point (Peak of Thought)
                            let hilbert_pos_start = self.hilbert_d2xy(hilbert_size, max_idx as u32);
                            let x1 = (hilbert_pos_start.0 as f32 - hilbert_size as f32 / 2.0) / (hilbert_size as f32 / 2.0);
                            let y1 = (hilbert_pos_start.1 as f32 - hilbert_size as f32 / 2.0) / (hilbert_size as f32 / 2.0);
                            let z1 = 0.5; // Lifted up

                            // Map end point (Action Target)
                            // Simple hash of action string to position
                            // For now, map to center offset based on string length/hash
                            let hash = action.len() as f32; // Placeholder
                            let x2 = 0.0;
                            let y2 = 0.0;
                            let z2 = -0.5;

                            let v1 = ThoughtVertex {
                                position: [x1, y1, z1],
                                neural_value: *score,
                                thought_id: max_idx as f32,
                                layer_idx: 8.0, // Special layer for synapses
                            };
                            let v2 = ThoughtVertex {
                                position: [x2, y2, z2],
                                neural_value: *score,
                                thought_id: 0.0,
                                layer_idx: 9.0, // Special layer for synapses
                            };

                            let idx1 = vertices.len() as u32;
                            vertices.push(v1);
                            let idx2 = vertices.len() as u32;
                            vertices.push(v2);

                            indices.push(idx1);
                            indices.push(idx2);
                        }
                    }
                }
            }
        }
        
        // Update buffers
        if !vertices.is_empty() {
            self.queue.write_buffer(&self.vertex_buffer, 0, bytemuck::cast_slice(&vertices));
            self.vertex_count = vertices.len() as u32;
        }
        
        if !indices.is_empty() {
            self.queue.write_buffer(&self.index_buffer, 0, bytemuck::cast_slice(&indices));
            self.index_count = indices.len() as u32;
        }
        
        // Store geometry
        self.geometry = vec![ThoughtGeometry {
            vertices,
            indices: indices.clone(),
            thought_id: 0,
            timestamp: std::time::SystemTime::now()
                .duration_since(std::time::UNIX_EPOCH)
                .unwrap()
                .as_secs_f64(),
        }];
    }
    
    /// Hilbert curve distance to 2D coordinates
    fn hilbert_d2xy(&self, n: u32, d: u32) -> (u32, u32) {
        let mut x: u32 = 0;
        let mut y: u32 = 0;
        let mut s: u32 = 1;
        let mut t = d;
        
        while s < n {
            let rx = 1 & (t / 2);
            let ry = 1 & (t ^ rx);
            
            if ry == 0 {
                if rx == 1 {
                    x = n - 1 - x;
                    y = n - 1 - y;
                }
                std::mem::swap(&mut x, &mut y);
            }
            
            x += s * rx;
            y += s * ry;
            t /= 4;
            s *= 2;
        }
        
        (x, y)
    }
    
    /// Update uniform buffer with 14n topology parameters
    fn update_uniforms(
        &self, 
        view_proj: &[[f32; 4]; 4], 
        neural_state: Option<&NeuralStateData>,
        cognitive_state: Option<&CognitiveState>,
        audio_features: Option<&crate::audio_manager::AudioFeatures>
    ) {
        // Extract layer activations from neural state
        let default_activations = vec![0.0; 8];
        let layer_activations = neural_state
            .map(|s| &s.layer_activations)
            .unwrap_or(&default_activations);
        
        // Extract cognitive metrics
        let self_confidence = cognitive_state
            .map(|s| s.self_confidence)
            .or_else(|| neural_state.map(|s| s.confidence))
            .unwrap_or(1.0);
            
        let intent_alignment = cognitive_state
            .map(|s| s.alignment)
            .unwrap_or(1.0);
            
        let reasoning_complexity = cognitive_state
            .map(|s| s.complexity)
            .unwrap_or(0.0);
            
        let safety_score = cognitive_state
            .map(|s| s.safety_score)
            .unwrap_or(1.0);
        
        // Calculate derived metrics
        let arousal = if let Some(state) = neural_state {
            state.thought_vector.iter().sum::<f32>() / state.thought_vector.len().max(1) as f32
        } else {
            0.5
        };
        
        let valence = if let Some(state) = neural_state {
            let positive_sum: f32 = state.thought_vector.iter().take(4).sum();
            let negative_sum: f32 = state.thought_vector.iter().skip(4).take(4).sum();
            positive_sum - negative_sum
        } else {
            0.3
        };
        
        let entropy = 0.4; // Simplified entropy calculation

        // Extract audio features (Phase 28)
        let (bass_energy, treble_energy, volume, is_beat, startle) = if let Some(audio) = audio_features {
            (audio.bass_energy, audio.treble_energy, audio.volume, audio.is_beat, audio.startle)
        } else {
            (0.3, 0.4, 0.5, 0.0, 0.0) // Default values
        };

        let uniforms = ThoughtUniforms {
            // Layer activations
            layer_0: layer_activations.get(0).copied().unwrap_or(0.0),
            layer_1: layer_activations.get(1).copied().unwrap_or(0.0),
            layer_2: layer_activations.get(2).copied().unwrap_or(0.0),
            layer_3: layer_activations.get(3).copied().unwrap_or(0.0),
            layer_4: layer_activations.get(4).copied().unwrap_or(0.0),
            layer_5: layer_activations.get(5).copied().unwrap_or(0.0),
            layer_6: layer_activations.get(6).copied().unwrap_or(0.0),
            layer_7: layer_activations.get(7).copied().unwrap_or(0.0),
            
            // Audio features (Phase 28: from real audio manager)
            bass_energy,
            treble_energy,
            volume,
            is_beat,
            startle,
            
            // Input state (simplified - would come from input manager)
            velocity: 0.5,
            is_focused: 1.0,
            is_idle: 0.0,
            chaos: 0.2,
            
            // Self state
            confidence: self_confidence,
            focus_depth: 0.7,
            
            // Theory of Mind (simplified - would come from theory of mind module)
            user_intent_confidence: 0.8,
            user_attention_focus: 0.6,
            user_engagement_level: 0.7,
            alignment: intent_alignment,
            mind_reading_confidence: 0.7,
            misalignment_detected: 0.0,
            
            // Cognitive State
            cognitive_complexity: reasoning_complexity,
            cognitive_safety: safety_score,
            is_reasoning: if reasoning_complexity > 0.5 { 1.0 } else { 0.0 },
            
            // Derived metrics
            arousal,
            valence,
            entropy,
            
            // Time
            time: self.time,
            
            // View projection matrix
            view_proj: *view_proj,
            
            // Additional parameters
            brightness: 1.0,
            contrast: 1.0,
            thought_scale: self.config.thought_scale,
            hilbert_order: self.config.hilbert_order as f32,
            
            _pad: [0; 2],
        };
        
        self.queue.write_buffer(&self.uniform_buffer, 0, bytemuck::cast_slice(&[uniforms]));
    }
    
    /// Update thought renderer with token visualization data
    pub fn update_with_token_visualization(&mut self, view_proj: &[[f32; 4]; 4], token_data: &TokenVisualizationData) {
        let now = Instant::now();

        // Update time
        self.time = now.duration_since(self.last_update).as_secs_f32();

        // Always update for token visualization (higher frequency)
        self.last_update = now;

        // Generate geometry from token data
        self.generate_geometry_from_token_data(token_data);

        // Update uniform buffer with token-specific parameters
        self.update_uniforms_with_token(view_proj, token_data);
    }

    /// Generate geometry from token visualization data
    fn generate_geometry_from_token_data(&mut self, token_data: &TokenVisualizationData) {
        let mut vertices = Vec::new();
        let mut indices = Vec::new();

        // Use Hilbert position from token data
        let hilbert_x = token_data.hilbert_position[0];
        let hilbert_y = token_data.hilbert_position[1];

        // Convert to normalized coordinates (-1 to 1)
        let x = (hilbert_x - 0.5) * 2.0;
        let y = (hilbert_y - 0.5) * 2.0;
        let z = token_data.activation * 2.0 - 1.0; // Map activation to height

        // Create main token vertex
        let vertex = ThoughtVertex {
            position: [x, y, z],
            neural_value: token_data.activation,
            thought_id: token_data.token_id as f32,
            layer_idx: token_data.layer as f32,
        };

        vertices.push(vertex);

        // Add attention connections as lines
        for (i, &attention_weight) in token_data.attention_weights.iter().enumerate() {
            if attention_weight > 0.1 && i < 10 { // Limit connections for performance
                // Create a secondary vertex for attention connection
                let angle = (i as f32) * std::f32::consts::PI * 2.0 / 10.0;
                let distance = attention_weight * 0.5; // Scale by attention weight
                let conn_x = x + angle.cos() * distance;
                let conn_y = y + angle.sin() * distance;
                let conn_z = z + attention_weight * 0.2;

                let conn_vertex = ThoughtVertex {
                    position: [conn_x, conn_y, conn_z],
                    neural_value: attention_weight,
                    thought_id: (token_data.token_id + i as u32) as f32,
                    layer_idx: token_data.layer as f32,
                };

                vertices.push(conn_vertex);

                // Add line indices
                let main_idx = 0;
                let conn_idx = vertices.len() as u32 - 1;
                indices.push(main_idx);
                indices.push(conn_idx);
            }
        }

        // Update buffers
        if !vertices.is_empty() {
            self.queue.write_buffer(&self.vertex_buffer, 0, bytemuck::cast_slice(&vertices));
            self.vertex_count = vertices.len() as u32;
        }

        if !indices.is_empty() {
            self.queue.write_buffer(&self.index_buffer, 0, bytemuck::cast_slice(&indices));
            self.index_count = indices.len() as u32;
        }

        // Store geometry
        self.geometry = vec![ThoughtGeometry {
            vertices,
            indices: indices.clone(),
            thought_id: token_data.token_id as u64,
            timestamp: token_data.timestamp,
        }];
    }

    /// Update uniform buffer with token-specific parameters
    fn update_uniforms_with_token(&self, view_proj: &[[f32; 4]; 4], token_data: &TokenVisualizationData) {
        // Create layer activations based on token layer
        let mut layer_activations = [0.0f32; 8];
        if token_data.layer < 8 {
            layer_activations[token_data.layer as usize] = token_data.activation;
        }

        let uniforms = ThoughtUniforms {
            // Layer activations from token
            layer_0: layer_activations[0],
            layer_1: layer_activations[1],
            layer_2: layer_activations[2],
            layer_3: layer_activations[3],
            layer_4: layer_activations[4],
            layer_5: layer_activations[5],
            layer_6: layer_activations[6],
            layer_7: layer_activations[7],

            // Audio features (default for token visualization)
            bass_energy: 0.3,
            treble_energy: 0.4,
            volume: 0.5,
            is_beat: 0.0,
            startle: 0.0,

            // Input state
            velocity: token_data.activation,
            is_focused: 1.0,
            is_idle: 0.0,
            chaos: 0.2,

            // Self state
            confidence: token_data.activation,
            focus_depth: token_data.layer as f32 / 8.0,

            // Theory of Mind
            user_intent_confidence: 0.8,
            user_attention_focus: 0.6,
            user_engagement_level: 0.7,
            alignment: 1.0,
            mind_reading_confidence: 0.7,
            misalignment_detected: 0.0,

            // Cognitive State
            cognitive_complexity: token_data.activation,
            cognitive_safety: 1.0,
            is_reasoning: 1.0,

            // Derived metrics
            arousal: token_data.activation,
            valence: token_data.activation * 2.0 - 1.0,
            entropy: 0.4,

            // Time
            time: self.time,

            // View projection matrix
            view_proj: *view_proj,

            // Additional parameters
            brightness: token_data.activation + 0.5,
            contrast: 1.0,
            thought_scale: self.config.thought_scale,
            hilbert_order: self.config.hilbert_order as f32,

            _pad: [0; 2],
        };

        self.queue.write_buffer(&self.uniform_buffer, 0, bytemuck::cast_slice(&[uniforms]));
    }

    /// Render thoughts to the render pass
    pub fn render<'a>(&'a self, render_pass: &mut RenderPass<'a>) {
        if self.vertex_count == 0 {
            return;
        }
        
        render_pass.set_pipeline(&self.pipeline);
        render_pass.set_bind_group(0, &self.bind_group, &[]);
        render_pass.set_vertex_buffer(0, self.vertex_buffer.slice(..));
        
        match self.config.mode {
            ThoughtRenderMode::PointCloud => {
                render_pass.draw(0..self.vertex_count, 0..1);
            }
            ThoughtRenderMode::Lines => {
                render_pass.set_index_buffer(self.index_buffer.slice(..), wgpu::IndexFormat::Uint32);
                render_pass.draw_indexed(0..self.index_count, 0, 0..1);
            }
            ThoughtRenderMode::Mesh => {
                render_pass.set_index_buffer(self.index_buffer.slice(..), wgpu::IndexFormat::Uint32);
                render_pass.draw_indexed(0..self.index_count, 0, 0..1);
            }
            ThoughtRenderMode::Hybrid => {
                // Render lines first
                if self.index_count > 0 {
                    render_pass.set_index_buffer(self.index_buffer.slice(..), wgpu::IndexFormat::Uint32);
                    render_pass.draw_indexed(0..self.index_count, 0, 0..1);
                }
                // Then render points on top
                render_pass.draw(0..self.vertex_count, 0..1);
            }
        }
    }
    
    /// Set render mode
    pub fn set_render_mode(&mut self, mode: ThoughtRenderMode) {
        self.config.mode = mode;
    }
    
    /// Get render mode
    pub fn get_render_mode(&self) -> ThoughtRenderMode {
        self.config.mode
    }
    
    /// Set thought scale
    pub fn set_thought_scale(&mut self, scale: f32) {
        self.config.thought_scale = scale.clamp(0.1, 10.0);
    }
    
    /// Get thought scale
    pub fn get_thought_scale(&self) -> f32 {
        self.config.thought_scale
    }
    
    /// Toggle glow effect
    pub fn toggle_glow(&mut self) {
        self.config.enable_glow = !self.config.enable_glow;
    }
    
    /// Toggle animation
    pub fn toggle_animation(&mut self) {
        self.config.enable_animation = !self.config.enable_animation;
    }
    
    /// Get geometry count
    pub fn get_geometry_count(&self) -> usize {
        self.geometry.len()
    }
    
    /// Get vertex count
    pub fn get_vertex_count(&self) -> u32 {
        self.vertex_count
    }
    
    /// Get index count
    pub fn get_index_count(&self) -> u32 {
        self.index_count
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_thought_vertex_size() {
        assert_eq!(std::mem::size_of::<ThoughtVertex>(), 32);
    }
    
    #[test]
    fn test_thought_uniforms_size() {
        // Size for 14n topology uniforms:
        // - 8 layer activations: 8 * 4 = 32 bytes
        // - 5 audio features: 5 * 4 = 20 bytes
        // - 4 input state: 4 * 4 = 16 bytes
        // - 2 self state: 2 * 4 = 8 bytes
        // - 6 theory of mind: 6 * 4 = 24 bytes
        // - 3 cognitive state: 3 * 4 = 12 bytes
        // - 3 derived metrics: 3 * 4 = 12 bytes
        // - 1 time: 4 bytes
        // - 16 view_proj: 16 * 4 = 64 bytes
        // - 4 additional params: 4 * 4 = 16 bytes
        // - 2 padding: 2 * 4 = 8 bytes
        // Total: 32 + 20 + 16 + 8 + 24 + 12 + 12 + 4 + 64 + 16 + 8 = 216 bytes
        assert_eq!(std::mem::size_of::<ThoughtUniforms>(), 216);
    }
    
    #[test]
    fn test_hilbert_d2xy() {
        // Test basic Hilbert curve mapping
        let renderer_config = ThoughtRendererConfig::default();
        
        // This would need a device to create a ThoughtRenderer
        // For now, we'll just verify the concept
        let n = 4u32;
        assert!(n.is_power_of_two());
    }
    
    #[test]
    fn test_thought_render_mode() {
        let modes = [
            ThoughtRenderMode::PointCloud,
            ThoughtRenderMode::Lines,
            ThoughtRenderMode::Mesh,
            ThoughtRenderMode::Hybrid,
        ];
        
        for mode in modes {
            let _ = format!("{:?}", mode);
        }
    }
}
