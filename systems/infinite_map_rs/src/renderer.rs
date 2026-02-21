// ============================================
// GEOMETRY OS - WGPU RENDERER
// Renders the infinite grid substrate with RTS texture
// ============================================

use smithay::reexports::winit::window::Window;
use wgpu::util::DeviceExt;
use image;

use crate::camera::Camera;
use crate::rts_texture::RTSTexture;
use crate::surface_manager::SurfaceManager;
use crate::thought_renderer::ThoughtRenderer;
use crate::bootable_cartridge::{BootableCartridge, CartridgeState, create_cartridge_bind_group, create_cartridge_bind_group_layout, create_cartridge_uniform_buffer, update_cartridge_uniform_buffer};
use crate::neural_terrain::{NeuralTerrain, TerrainVertex};
use std::sync::Arc;
use std::time::{SystemTime, UNIX_EPOCH};

pub struct Renderer<'a> {
    surface: wgpu::Surface<'a>,
    pub device: Arc<wgpu::Device>,
    pub queue: Arc<wgpu::Queue>,
    config: wgpu::SurfaceConfiguration,
    render_pipeline: wgpu::RenderPipeline,
    uniform_buffer: wgpu::Buffer,
    bind_group: wgpu::BindGroup,
    rts_texture: Option<wgpu::Texture>,
    rts_texture_view: Option<wgpu::TextureView>,
    #[allow(dead_code)]
    rts_texture_sampler: wgpu::Sampler,

    // Phase 2: Surface Rendering
    surface_manager: SurfaceManager,
    surface_pipeline: wgpu::RenderPipeline,
    #[allow(dead_code)]
    surface_bind_group_layout: Arc<wgpu::BindGroupLayout>,

    // Phase 5: Window Decorations
    decoration_pipeline: wgpu::RenderPipeline,
    decoration_bind_group: wgpu::BindGroup,
    decoration_buffer: wgpu::Buffer,
    
    // Stored layouts for dynamic updates
    grid_bind_group_layout: wgpu::BindGroupLayout,
    grid_pipeline_layout: wgpu::PipelineLayout,

    // Phase 33: Memory Artifact Pipeline
    memory_artifact_pipeline: Option<wgpu::RenderPipeline>,
    memory_artifact_bind_group: Option<wgpu::BindGroup>,
    memory_artifact_uniform_buffer: Option<wgpu::Buffer>,
    // Hot Reloading
    memory_artifact_bind_group_layout: Option<wgpu::BindGroupLayout>,
    pub memory_artifact_shader_path: std::path::PathBuf, // exposed for debug if needed
    memory_artifact_mtime: Option<std::time::SystemTime>,
    last_hot_reload_check: std::time::Instant,

    // Bootable Cartridge (Ground Truth Substrate)
    cartridge: Option<BootableCartridge>,
    cartridge_pipeline: Option<wgpu::RenderPipeline>,
    cartridge_bind_group: Option<wgpu::BindGroup>,
    cartridge_uniform_buffer: Option<wgpu::Buffer>,
    cartridge_bind_group_layout: Option<wgpu::BindGroupLayout>,
    cartridge_state: CartridgeState,
    use_cartridge_as_ground: bool,

    // Phase 39: Neural Terrain Pipeline
    pub neural_terrain: Option<NeuralTerrain>,
    terrain_pipeline: Option<wgpu::RenderPipeline>,
    terrain_bind_group_layout: Option<wgpu::BindGroupLayout>,
    terrain_bind_group: Option<wgpu::BindGroup>,
    terrain_camera_buffer: Option<wgpu::Buffer>,
    pub cognitive_texture: Option<wgpu::Texture>,
    pub cognitive_texture_view: Option<wgpu::TextureView>,
    pub cognitive_sampler: Option<wgpu::Sampler>,
    terrain_enabled: bool,

    // Evolution → Infinite Map Bridge
    pub evolution_terrain_enabled: bool,
    pub evolution_terrain_pipeline: Option<wgpu::RenderPipeline>,
    pub evolution_terrain_bind_group_0: Option<wgpu::BindGroup>,
    pub evolution_terrain_bind_group_layout_0: Option<wgpu::BindGroupLayout>,
    pub evolution_terrain_bind_group_layout_1: Option<wgpu::BindGroupLayout>,
    pub evolution_terrain_bind_group_layout_2: Option<wgpu::BindGroupLayout>,
    pub evolution_lighting_buffer: Option<wgpu::Buffer>,
    
    // Phase 46: Agent Rendering
    pub agent_renderer: Option<crate::agent_renderer::AgentRenderer>,

    // Phase 30: Crystallized Text Engine
    pub text_engine: Option<crate::text_engine::TextEngine>,
    
    // Phase 41: Visual AST Rendering
    pub visual_ast_renderer: Option<crate::visual_ast_renderer::VisualASTRenderer>,

    // Phase 37.3: Cognitive Cartography
    pub cortex_renderer: Option<crate::cortex::CortexRenderer>,

    // Phase 3: Terminal Clone Renderer
    pub terminal_renderer: Option<crate::terminal_clone::TerminalRenderer>,

    // Phase 42: Compilation Visual Feedback
    compilation_status: crate::app::CompilationStatus,
    compilation_status_time: Option<std::time::Instant>,
    border_pipeline: wgpu::RenderPipeline,
    border_bind_group_layout: wgpu::BindGroupLayout,
    border_uniform_buffer: wgpu::Buffer,
}

#[repr(C)]
#[derive(Copy, Clone, bytemuck::Pod, bytemuck::Zeroable)]
struct Uniforms {
    screen_size: [f32; 2],
    camera_pos: [f32; 2],
    zoom: f32,
    grid_size: f32,
    grid_opacity: f32,
    time: f32,
    rts_texture_size: [f32; 2],
    _padding2: [f32; 2],
}

// Phase 39: Neural Terrain Camera Uniform
#[repr(C)]
#[derive(Copy, Clone, bytemuck::Pod, bytemuck::Zeroable)]
struct TerrainCameraUniform {
    view_proj: [[f32; 4]; 4],
    view_pos: [f32; 3],
    _padding: f32,
}

// Phase 42: Border Quad Uniforms
#[repr(C)]
#[derive(Copy, Clone, bytemuck::Pod, bytemuck::Zeroable)]
struct BorderUniforms {
    tile_pos: [f32; 2],
    tile_size: [f32; 2],
    border_thickness: f32,
    _pad1: f32,
    border_color: [f32; 4],
    screen_size: [f32; 2],
    _pad2: [f32; 2],
}

impl<'a> Renderer<'a> {
    pub async fn new(window: &'a Window, rts_texture: Option<RTSTexture>) -> Self {
        let size = window.inner_size();

        // Instance
        eprintln!("debug: Creating WGPU Instance...");
        let instance = wgpu::Instance::default();

        // Surface
        eprintln!("debug: Creating Surface...");
        let surface = instance
            .create_surface(window)
            .expect("Failed to create surface");

        // Adapter
        eprintln!("debug: Requesting Adapter...");
        let adapter = instance
            .request_adapter(&wgpu::RequestAdapterOptions {
                power_preference: wgpu::PowerPreference::HighPerformance,
                compatible_surface: Some(&surface),
                force_fallback_adapter: false,
            })
            .await
            .expect("Failed to find an appropriate adapter");
        eprintln!("debug: Adapter found: {:?}", adapter.get_info());

        // Device & Queue
        eprintln!("debug: Requesting Device & Queue...");
        let (device, queue) = adapter
            .request_device(
                &wgpu::DeviceDescriptor {
                    label: Some("Geometry OS Device"),
                    required_features: wgpu::Features::empty(),
                    required_limits: wgpu::Limits::default(),
                },
                None,
            )
            .await
            .expect("Failed to create device");
        eprintln!("debug: Device created.");
            
        let device = Arc::new(device);
        let queue = Arc::new(queue);

        // Surface Configuration
        eprintln!("debug: Configuring Surface...");
        let surface_caps = surface.get_capabilities(&adapter);
        let surface_format = surface_caps
            .formats
            .iter()
            .copied()
            .find(|f| f.is_srgb())
            .unwrap_or(surface_caps.formats[0]);

        let config = wgpu::SurfaceConfiguration {
            usage: wgpu::TextureUsages::RENDER_ATTACHMENT | wgpu::TextureUsages::COPY_SRC,
            format: surface_format,
            width: size.width,
            height: size.height,
            present_mode: wgpu::PresentMode::Fifo,
            alpha_mode: surface_caps.alpha_modes[0],
            view_formats: vec![],
            desired_maximum_frame_latency: 2,
        };

        surface.configure(&device, &config);
        eprintln!("debug: Surface configured.");

        // Grid Shader
        let grid_shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Grid Shader"),
            source: wgpu::ShaderSource::Wgsl(include_str!("shaders/grid.wgsl").into()),
        });

        // Uniform Buffer
        let uniform_buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("Uniform Buffer"),
            contents: bytemuck::cast_slice(&[Uniforms {
                screen_size: [size.width as f32, size.height as f32],
                camera_pos: [0.0, 0.0],
                zoom: 1.0,
                grid_size: 100.0,
                grid_opacity: 0.3,
                time: 0.0,
                rts_texture_size: [1024.0, 1024.0],
                _padding2: [0.0; 2],
            }]),
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
        });

        // RTS Texture Setup
        let (rts_texture, rts_texture_view, rts_texture_sampler) = if let Some(rts_tex) = rts_texture {
            let texture_size = wgpu::Extent3d {
                width: rts_tex.width,
                height: rts_tex.height,
                depth_or_array_layers: 1,
            };

            let texture = device.create_texture(&wgpu::TextureDescriptor {
                label: Some("RTS Texture"),
                size: texture_size,
                mip_level_count: 1,
                sample_count: 1,
                dimension: wgpu::TextureDimension::D2,
                format: wgpu::TextureFormat::Rgba8UnormSrgb,
                usage: wgpu::TextureUsages::TEXTURE_BINDING | wgpu::TextureUsages::COPY_DST | wgpu::TextureUsages::COPY_SRC,
                view_formats: &[],
            });

            let texture_view = texture.create_view(&wgpu::TextureViewDescriptor::default());

            let sampler = device.create_sampler(&wgpu::SamplerDescriptor {
                address_mode_u: wgpu::AddressMode::ClampToEdge,
                address_mode_v: wgpu::AddressMode::ClampToEdge,
                address_mode_w: wgpu::AddressMode::ClampToEdge,
                mag_filter: wgpu::FilterMode::Linear,
                min_filter: wgpu::FilterMode::Linear,
                mipmap_filter: wgpu::FilterMode::Linear,
                ..Default::default()
            });

            // Upload texture data
            queue.write_texture(
                wgpu::ImageCopyTexture {
                    texture: &texture,
                    mip_level: 0,
                    origin: wgpu::Origin3d::ZERO,
                    aspect: wgpu::TextureAspect::All,
                },
                &rts_tex.as_rgba_bytes(),
                wgpu::ImageDataLayout {
                    offset: 0,
                    bytes_per_row: Some(4 * rts_tex.width),
                    rows_per_image: Some(rts_tex.height),
                },
                texture_size,
            );

            (Some(texture), Some(texture_view), sampler)
        } else {
            // Default initialization
            let default_tex = RTSTexture::create_test_pattern(1024, 1024);
             let texture_size = wgpu::Extent3d {
                width: default_tex.width,
                height: default_tex.height,
                depth_or_array_layers: 1,
            };

            let texture = device.create_texture(&wgpu::TextureDescriptor {
                label: Some("Default RTS Texture"),
                size: texture_size,
                mip_level_count: 1,
                sample_count: 1,
                dimension: wgpu::TextureDimension::D2,
                format: wgpu::TextureFormat::Rgba8UnormSrgb,
                usage: wgpu::TextureUsages::TEXTURE_BINDING | wgpu::TextureUsages::COPY_DST | wgpu::TextureUsages::COPY_SRC,
                view_formats: &[],
            });

             let texture_view = texture.create_view(&wgpu::TextureViewDescriptor::default());

            let sampler = device.create_sampler(&wgpu::SamplerDescriptor {
                address_mode_u: wgpu::AddressMode::ClampToEdge,
                address_mode_v: wgpu::AddressMode::ClampToEdge,
                address_mode_w: wgpu::AddressMode::ClampToEdge,
                mag_filter: wgpu::FilterMode::Linear,
                min_filter: wgpu::FilterMode::Linear,
                mipmap_filter: wgpu::FilterMode::Linear,
                ..Default::default()
            });

            queue.write_texture(
                wgpu::ImageCopyTexture {
                    texture: &texture,
                    mip_level: 0,
                    origin: wgpu::Origin3d::ZERO,
                    aspect: wgpu::TextureAspect::All,
                },
                &default_tex.as_rgba_bytes(),
                wgpu::ImageDataLayout {
                    offset: 0,
                    bytes_per_row: Some(4 * default_tex.width),
                    rows_per_image: Some(default_tex.height),
                },
                texture_size,
            );

            (Some(texture), Some(texture_view), sampler)
        };

        // Grid Pipeline Setup
        let grid_bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Bind Group Layout"),
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
                    visibility: wgpu::ShaderStages::FRAGMENT,
                    ty: wgpu::BindingType::Texture {
                        multisampled: false,
                        view_dimension: wgpu::TextureViewDimension::D2,
                        sample_type: wgpu::TextureSampleType::Float { filterable: true },
                    },
                    count: None,
                },
                wgpu::BindGroupLayoutEntry {
                    binding: 2,
                    visibility: wgpu::ShaderStages::FRAGMENT,
                    ty: wgpu::BindingType::Sampler(wgpu::SamplerBindingType::Filtering),
                    count: None,
                },
            ],
        });

        let bind_group = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Bind Group"),
            layout: &grid_bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: uniform_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: wgpu::BindingResource::TextureView(
                        rts_texture_view.as_ref().unwrap()
                    ),
                },
                wgpu::BindGroupEntry {
                    binding: 2,
                    resource: wgpu::BindingResource::Sampler(&rts_texture_sampler),
                },
            ],
        });

        let grid_pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Grid Pipeline Layout"),
            bind_group_layouts: &[&grid_bind_group_layout],
            push_constant_ranges: &[],
        });

        let render_pipeline = device.create_render_pipeline(&wgpu::RenderPipelineDescriptor {
            label: Some("Render Pipeline"),
            layout: Some(&grid_pipeline_layout),
            vertex: wgpu::VertexState {
                module: &grid_shader,
                entry_point: "vs_main",
                buffers: &[],
            },
            fragment: Some(wgpu::FragmentState {
                module: &grid_shader,
                entry_point: "fs_main",
                targets: &[Some(wgpu::ColorTargetState {
                    format: config.format,
                    blend: Some(wgpu::BlendState::ALPHA_BLENDING),
                    write_mask: wgpu::ColorWrites::ALL,
                })],
            }),
            primitive: wgpu::PrimitiveState {
                topology: wgpu::PrimitiveTopology::TriangleList,
                strip_index_format: None,
                front_face: wgpu::FrontFace::Ccw,
                cull_mode: None,
                polygon_mode: wgpu::PolygonMode::Fill,
                unclipped_depth: false,
                conservative: false,
            },
            depth_stencil: None,
            multisample: wgpu::MultisampleState::default(),
            multiview: None,
        });

        // Phase 2: Surface Pipeline Setup
        let surface_bind_group_layout = Arc::new(device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Surface Bind Group Layout"),
            entries: &[
                wgpu::BindGroupLayoutEntry {
                    binding: 0,
                    visibility: wgpu::ShaderStages::FRAGMENT,
                    ty: wgpu::BindingType::Texture {
                        multisampled: false,
                        view_dimension: wgpu::TextureViewDimension::D2,
                        sample_type: wgpu::TextureSampleType::Float { filterable: true },
                    },
                    count: None,
                },
                wgpu::BindGroupLayoutEntry {
                    binding: 1,
                    visibility: wgpu::ShaderStages::FRAGMENT,
                    ty: wgpu::BindingType::Sampler(wgpu::SamplerBindingType::Filtering),
                    count: None,
                },
            ],
        }));

        // Wrap sampler in Arc for SurfaceManager
        // Note: rts_texture_sampler is a Value, not a reference we can retain easily if we don't clone.
        // But wgpu::Sampler is NOT cloneable in a way that creates a new resource, it's a handle. 
        // We need to create a shared sampler or reuse this one. 
        // Best practice: Create a dedicated sampler for surfaces or share via Arc. 
        // Since rts_texture_sampler is local, let's create a shared handle.
        // Wait, rts_texture_sampler is a struct, not an Arc. We have to wrap it earlier or clone? 
        // Actually wgpu resources are just handles (internally Arcs). But strictly speaking we need to pass ownership or reference.
        // Let's create a dedicated common sampler wrapped in Arc.
        let shared_sampler = Arc::new(device.create_sampler(&wgpu::SamplerDescriptor {
            address_mode_u: wgpu::AddressMode::ClampToEdge,
            address_mode_v: wgpu::AddressMode::ClampToEdge,
            address_mode_w: wgpu::AddressMode::ClampToEdge,
            mag_filter: wgpu::FilterMode::Linear,
            min_filter: wgpu::FilterMode::Linear,
            mipmap_filter: wgpu::FilterMode::Linear,
            ..Default::default()
        }));

        let surface_manager = SurfaceManager::new(
            device.clone(), 
            queue.clone(), 
            surface_bind_group_layout.clone(),
            shared_sampler
        );
        
        // Surface Shader
        let surface_shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Surface Shader"),
            source: wgpu::ShaderSource::Wgsl(include_str!("shaders/surface.wgsl").into()),
        });

        let surface_pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Surface Pipeline Layout"),
            bind_group_layouts: &[&surface_bind_group_layout],
            push_constant_ranges: &[],
        });

        let surface_pipeline = device.create_render_pipeline(&wgpu::RenderPipelineDescriptor {
            label: Some("Surface Render Pipeline"),
            layout: Some(&surface_pipeline_layout),
            vertex: wgpu::VertexState {
                module: &surface_shader,
                entry_point: "vs_main",
                buffers: &[],
            },
            fragment: Some(wgpu::FragmentState {
                module: &surface_shader,
                entry_point: "fs_main",
                targets: &[Some(wgpu::ColorTargetState {
                    format: config.format,
                    blend: Some(wgpu::BlendState::ALPHA_BLENDING),
                    write_mask: wgpu::ColorWrites::ALL,
                })],
            }),
            primitive: wgpu::PrimitiveState {
                topology: wgpu::PrimitiveTopology::TriangleList,
                ..Default::default()
            },
            depth_stencil: None,
            multisample: wgpu::MultisampleState::default(),
            multiview: None,
        });

        // Phase 5: Decoration Pipeline Setup
        let decoration_shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Decoration Shader"),
            source: wgpu::ShaderSource::Wgsl(include_str!("shaders/flat_color.wgsl").into()),
        });

        let decoration_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Decoration Uniform Buffer"),
            size: 16, // vec4<f32>
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let decoration_bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Decoration Bind Group Layout"),
            entries: &[
                wgpu::BindGroupLayoutEntry {
                    binding: 0,
                    visibility: wgpu::ShaderStages::FRAGMENT,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Uniform,
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
            ],
        });

        let decoration_bind_group = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Decoration Bind Group"),
            layout: &decoration_bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: decoration_buffer.as_entire_binding(),
                },
            ],
        });

        // Phase 46: Initialize Agent Renderer
        let agent_renderer = Some(crate::agent_renderer::AgentRenderer::new(
            &device,
            config.format,
            &uniform_buffer,
        ));

        let decoration_pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Decoration Pipeline Layout"),
            bind_group_layouts: &[&decoration_bind_group_layout],
            push_constant_ranges: &[],
        });

        let decoration_pipeline = device.create_render_pipeline(&wgpu::RenderPipelineDescriptor {
            label: Some("Decoration Render Pipeline"),
            layout: Some(&decoration_pipeline_layout),
            vertex: wgpu::VertexState {
                module: &decoration_shader,
                entry_point: "vs_main",
                buffers: &[],
            },
            fragment: Some(wgpu::FragmentState {
                module: &decoration_shader,
                entry_point: "fs_main",
                targets: &[Some(wgpu::ColorTargetState {
                    format: config.format,
                    blend: Some(wgpu::BlendState::ALPHA_BLENDING),
                    write_mask: wgpu::ColorWrites::ALL,
                })],
            }),
            primitive: wgpu::PrimitiveState {
                topology: wgpu::PrimitiveTopology::TriangleList,
                ..Default::default()
            },
            depth_stencil: None,
            multisample: wgpu::MultisampleState::default(),
            multiview: None,
        });

        eprintln!("debug: Renderer initialization complete.");

        // Helper to load shader from brick or fallback
        let load_shader = |name: &str, fallback: &str| -> wgpu::ShaderModule {
            // Try to load from assets/shaders/{name}.brick
            let mut brick_path = std::path::PathBuf::from("assets/shaders");
            brick_path.push(format!("{}.brick", name));
            
            let source_str = if brick_path.exists() {
                eprintln!("debug: Optical Loading shader: {:?}", brick_path);
                match crate::foundry::optical_loader::OpticalLoader::load_text_source(&brick_path) {
                    Ok(s) => {
                        eprintln!("debug: Optical Load SUCCESS ({} bytes)", s.len());
                        s
                    },
                    Err(e) => {
                        eprintln!("error: Optical Load FAILED: {}", e);
                        fallback.to_string()
                    }
                }
            } else {
                fallback.to_string()
            };

            device.create_shader_module(wgpu::ShaderModuleDescriptor {
                label: Some(name),
                source: wgpu::ShaderSource::Wgsl(source_str.into()),
            })
        };

        // Phase 33: Initialize Memory Artifact Pipeline
        let memory_artifact_shader = load_shader(
            "morph_transition", 
            include_str!("shaders/morph_transition.wgsl")
        );

        let memory_artifact_bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Memory Artifact Bind Group Layout"),
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
            ],
        });

        let memory_artifact_uniform_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Memory Artifact Uniform Buffer"),
            size: 80, // mat4x4 + f32 + f32 = 64 + 4 + 4 + 4 + 4 = 80 bytes
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let memory_artifact_pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Memory Artifact Pipeline Layout"),
            bind_group_layouts: &[&memory_artifact_bind_group_layout],
            push_constant_ranges: &[],
        });

        let memory_artifact_pipeline = device.create_render_pipeline(&wgpu::RenderPipelineDescriptor {
            label: Some("Memory Artifact Render Pipeline"),
            layout: Some(&memory_artifact_pipeline_layout),
            vertex: wgpu::VertexState {
                module: &memory_artifact_shader,
                entry_point: "vs_main",
                buffers: &[wgpu::VertexBufferLayout {
                    array_stride: std::mem::size_of::<crate::memory_artifacts::MemoryVertex>() as wgpu::BufferAddress,
                    step_mode: wgpu::VertexStepMode::Vertex,
                    attributes: &[
                        wgpu::VertexAttribute {
                            offset: 0,
                            shader_location: 0,
                            format: wgpu::VertexFormat::Float32x3,
                        },
                        wgpu::VertexAttribute {
                            offset: std::mem::size_of::<[f32; 3]>() as wgpu::BufferAddress,
                            shader_location: 1,
                            format: wgpu::VertexFormat::Float32x4,
                        },
                        wgpu::VertexAttribute {
                            offset: std::mem::size_of::<[f32; 7]>() as wgpu::BufferAddress,
                            shader_location: 2,
                            format: wgpu::VertexFormat::Float32x2,
                        },
                        wgpu::VertexAttribute {
                            offset: std::mem::size_of::<[f32; 9]>() as wgpu::BufferAddress,
                            shader_location: 3,
                            format: wgpu::VertexFormat::Float32,
                        },
                    ],
                }],
            },
            fragment: Some(wgpu::FragmentState {
                module: &memory_artifact_shader,
                entry_point: "fs_main",
                targets: &[Some(wgpu::ColorTargetState {
                    format: config.format,
                    blend: Some(wgpu::BlendState::ALPHA_BLENDING),
                    write_mask: wgpu::ColorWrites::ALL,
                })],
            }),
            primitive: wgpu::PrimitiveState {
                topology: wgpu::PrimitiveTopology::TriangleList,
                strip_index_format: None,
                front_face: wgpu::FrontFace::Ccw,
                cull_mode: Some(wgpu::Face::Back),
                polygon_mode: wgpu::PolygonMode::Fill,
                unclipped_depth: false,
                conservative: false,
            },
            depth_stencil: None,
            multisample: wgpu::MultisampleState::default(),
            multiview: None,
        });

        // Visual AST Renderer (Phase 41)
        let visual_ast_renderer = crate::visual_ast_renderer::VisualASTRenderer::new(
            &device,
            config.format,
            &uniform_buffer,
        );

        // Phase 42: Create border pipeline
        let border_pipeline = Self::create_border_pipeline(&device, config.format);
        let border_bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Border Bind Group Layout"),
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
            ],
        });
        let border_uniform_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Border Uniform Buffer"),
            size: std::mem::size_of::<BorderUniforms>() as u64,
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // Phase 3: Terminal Clone Renderer
        let terminal_renderer = Some(crate::terminal_clone::TerminalRenderer::new(&device));

        Self {
            surface,
            device: device.clone(),
            queue,
            config,
            render_pipeline,
            uniform_buffer,
            bind_group,
            rts_texture,
            rts_texture_view,
            rts_texture_sampler,
            surface_manager,
            surface_pipeline,
            surface_bind_group_layout,
            decoration_pipeline,
            decoration_bind_group,
            decoration_buffer,
            grid_bind_group_layout,
            grid_pipeline_layout,
            memory_artifact_pipeline: Some(memory_artifact_pipeline),
            memory_artifact_bind_group: Some(device.create_bind_group(&wgpu::BindGroupDescriptor {
                label: Some("Memory Artifact Bind Group"),
                layout: &memory_artifact_bind_group_layout,
                entries: &[
                    wgpu::BindGroupEntry {
                        binding: 0,
                        resource: memory_artifact_uniform_buffer.as_entire_binding(),
                    },
                ],
            })),
            memory_artifact_uniform_buffer: Some(memory_artifact_uniform_buffer),
            memory_artifact_bind_group_layout: Some(memory_artifact_bind_group_layout),
            memory_artifact_shader_path: std::path::PathBuf::from("systems/infinite_map_rs/src/shaders/morph_transition.wgsl"),
            memory_artifact_mtime: std::fs::metadata("systems/infinite_map_rs/src/shaders/morph_transition.wgsl").ok().and_then(|m| m.modified().ok()),
            last_hot_reload_check: std::time::Instant::now(),

            // Bootable Cartridge (Ground Truth Substrate)
            cartridge: None,
            cartridge_pipeline: None,
            cartridge_bind_group: None,
            cartridge_uniform_buffer: None,
            cartridge_bind_group_layout: None,
            cartridge_state: CartridgeState::default(),
            use_cartridge_as_ground: false,

            // Phase 39: Neural Terrain - Initialize as None (will be enabled later)
            neural_terrain: None,
            terrain_pipeline: None,
            terrain_bind_group_layout: None,
            terrain_bind_group: None,
            terrain_camera_buffer: None,
            cognitive_texture: None,
            cognitive_texture_view: None,
            cognitive_sampler: None,
            terrain_enabled: false,
            
            // Evolution Terrain Bridge - initialized as None
            evolution_terrain_enabled: false,
            evolution_terrain_pipeline: None,
            evolution_terrain_bind_group_0: None,
            evolution_terrain_bind_group_layout_0: None,
            evolution_terrain_bind_group_layout_1: None,
            evolution_terrain_bind_group_layout_2: None,
            evolution_lighting_buffer: None,
            
            agent_renderer,
            text_engine: None,
            visual_ast_renderer: Some(visual_ast_renderer),
            cortex_renderer: None,
            terminal_renderer,

            // Phase 42: Compilation Visual Feedback
            compilation_status: crate::app::CompilationStatus::None,
            compilation_status_time: None,
            border_pipeline,
            border_bind_group_layout,
            border_uniform_buffer,
        }
    }

    // Phase 42: Create border quad pipeline for rendering colored tile borders
    fn create_border_pipeline(
        device: &wgpu::Device,
        surface_format: wgpu::TextureFormat,
    ) -> wgpu::RenderPipeline {
        let shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Border Quad Shader"),
            source: wgpu::ShaderSource::Wgsl(include_str!("shaders/border_quad.wgsl").into()),
        });

        let bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Border Bind Group Layout"),
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
            ],
        });

        let pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Border Pipeline Layout"),
            bind_group_layouts: &[&bind_group_layout],
            push_constant_ranges: &[],
        });

        device.create_render_pipeline(&wgpu::RenderPipelineDescriptor {
            label: Some("Border Render Pipeline"),
            layout: Some(&pipeline_layout),
            vertex: wgpu::VertexState {
                module: &shader,
                entry_point: "vs_main",
                buffers: &[],
            },
            fragment: Some(wgpu::FragmentState {
                module: &shader,
                entry_point: "fs_main",
                targets: &[Some(wgpu::ColorTargetState {
                    format: surface_format,
                    blend: Some(wgpu::BlendState::ALPHA_BLENDING),
                    write_mask: wgpu::ColorWrites::ALL,
                })],
            }),
            primitive: wgpu::PrimitiveState {
                topology: wgpu::PrimitiveTopology::TriangleList,
                ..Default::default()
            },
            depth_stencil: None,
            multisample: wgpu::MultisampleState::default(),
            multiview: None,
        })
    }

    // Phase 42: Render compilation status border
    fn render_compilation_border(
        &self,
        encoder: &mut wgpu::CommandEncoder,
        view: &wgpu::TextureView,
    ) {
        use crate::app::CompilationStatus;

        // Early return if no compilation status
        if self.compilation_status == CompilationStatus::None {
            return;
        }

        // Determine border color based on status
        let border_color = match self.compilation_status {
            CompilationStatus::Compiling => [1.0, 1.0, 0.0, 1.0], // Yellow
            CompilationStatus::Success => [0.0, 1.0, 0.0, 1.0], // Green
            CompilationStatus::Error => [1.0, 0.0, 0.0, 1.0],   // Red
            CompilationStatus::None => [0.0; 4],
        };

        // Create uniforms with fixed tile position and size
        let uniforms = BorderUniforms {
            tile_pos: [100.0, 100.0], // Fixed position for now
            tile_size: [256.0, 256.0], // Fixed size for now
            border_thickness: 4.0,
            _pad1: 0.0,
            border_color,
            screen_size: [self.config.width as f32, self.config.height as f32],
            _pad2: [0.0; 2],
        };

        // Write to uniform buffer
        self.queue.write_buffer(
            &self.border_uniform_buffer,
            0,
            bytemuck::cast_slice(&[uniforms]),
        );

        // Create bind group
        let bind_group = self.device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Border Bind Group"),
            layout: &self.border_bind_group_layout,
            entries: &[wgpu::BindGroupEntry {
                binding: 0,
                resource: self.border_uniform_buffer.as_entire_binding(),
            }],
        });

        // Create render pass for border
        let mut rpass = encoder.begin_render_pass(&wgpu::RenderPassDescriptor {
            label: Some("Compilation Border Pass"),
            color_attachments: &[Some(wgpu::RenderPassColorAttachment {
                view,
                resolve_target: None,
                ops: wgpu::Operations {
                    load: wgpu::LoadOp::Load,
                    store: wgpu::StoreOp::Store,
                },
            })],
            depth_stencil_attachment: None,
            timestamp_writes: None,
            occlusion_query_set: None,
        });

        rpass.set_pipeline(&self.border_pipeline);
        rpass.set_bind_group(0, &bind_group, &[]);
        rpass.draw(0..6, 0..1); // 6 vertices for quad
    }

    // Phase 37.3: Enable Cortex Layer
    pub fn enable_cortex(&mut self) {
        eprintln!("debug: Enabling Cortex Layer...");
        let mut cortex = crate::cortex::CortexRenderer::new(&self.device, self.config.format);

        // Add layers matching Python defaults
        // IOR: Red
        cortex.add_layer(&self.device, "attention_ior", [1.0, 0.0, 0.0, 0.8]);
        // Net Attention: Green
        cortex.add_layer(&self.device, "attention_net", [0.0, 1.0, 0.0, 0.5]);

        self.cortex_renderer = Some(cortex);
    }

    // Phase 42: Set compilation status for visual feedback
    pub fn set_compilation_status(&mut self, status: crate::app::CompilationStatus) {
        self.compilation_status = status;
        self.compilation_status_time = Some(std::time::Instant::now());
    }

    // Phase 42: Get current compilation status
    pub fn get_compilation_status(&self) -> crate::app::CompilationStatus {
        self.compilation_status
    }

    // Phase 42: Check if status should be reset (after 1 second)
    pub fn maybe_reset_compilation_status(&mut self) {
        if let Some(instant) = self.compilation_status_time {
            if instant.elapsed() > std::time::Duration::from_secs(1) {
                self.compilation_status = crate::app::CompilationStatus::None;
                self.compilation_status_time = None;
            }
        }
    }

    // Phase 39: Initialize neural terrain rendering
    pub fn enable_neural_terrain(&mut self, cognitive_texture_path: &str) {
        eprintln!("debug: Enabling neural terrain rendering...");

        // Load cognitive state texture (antigravity.pixelrts.png)
        let cognitive_image = image::open(cognitive_texture_path)
            .expect("Failed to load cognitive texture")
            .to_rgba8();

        let cognitive_size = wgpu::Extent3d {
            width: cognitive_image.width(),
            height: cognitive_image.height(),
            depth_or_array_layers: 1,
        };

        let cognitive_texture = self.device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Cognitive State Texture"),
            size: cognitive_size,
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8UnormSrgb,
            usage: wgpu::TextureUsages::TEXTURE_BINDING | wgpu::TextureUsages::COPY_DST,
            view_formats: &[],
        });

        let cognitive_texture_view = cognitive_texture.create_view(&wgpu::TextureViewDescriptor::default());

        let cognitive_sampler = self.device.create_sampler(&wgpu::SamplerDescriptor {
            address_mode_u: wgpu::AddressMode::ClampToEdge,
            address_mode_v: wgpu::AddressMode::ClampToEdge,
            address_mode_w: wgpu::AddressMode::ClampToEdge,
            mag_filter: wgpu::FilterMode::Linear,
            min_filter: wgpu::FilterMode::Linear,
            mipmap_filter: wgpu::FilterMode::Linear,
            ..Default::default()
        });

        // Upload texture data
        self.queue.write_texture(
            wgpu::ImageCopyTexture {
                texture: &cognitive_texture,
                mip_level: 0,
                origin: wgpu::Origin3d::ZERO,
                aspect: wgpu::TextureAspect::All,
            },
            &cognitive_image.as_raw(),
            wgpu::ImageDataLayout {
                offset: 0,
                bytes_per_row: Some(4 * cognitive_image.width()),
                rows_per_image: Some(cognitive_image.height()),
            },
            cognitive_size,
        );

        // Create terrain mesh (256x256 resolution)
        let neural_terrain = NeuralTerrain::new(&self.device, 256);

        // Create terrain camera buffer
        let terrain_camera_uniform = TerrainCameraUniform {
            view_proj: [[0.0; 4]; 4], // Will be updated in render()
            view_pos: [0.0, 50.0, 500.0],
            _padding: 0.0,
        };

        let terrain_camera_buffer = self.device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("Terrain Camera Buffer"),
            contents: bytemuck::cast_slice(&[terrain_camera_uniform]),
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
        });

        // Create terrain shader
        let terrain_shader = self.device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Neural Terrain Shader"),
            source: wgpu::ShaderSource::Wgsl(include_str!("../shaders/neural_terrain.wgsl").into()),
        });

        // Create terrain bind group layout (2 groups: camera+config, texture+sampler)
        let terrain_bind_group_layout_0 = self.device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Terrain Bind Group Layout 0"),
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
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Uniform,
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
            ],
        });

        let terrain_bind_group_layout_1 = self.device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Terrain Bind Group Layout 1"),
            entries: &[
                wgpu::BindGroupLayoutEntry {
                    binding: 0,
                    visibility: wgpu::ShaderStages::FRAGMENT,
                    ty: wgpu::BindingType::Texture {
                        multisampled: false,
                        view_dimension: wgpu::TextureViewDimension::D2,
                        sample_type: wgpu::TextureSampleType::Float { filterable: true },
                    },
                    count: None,
                },
                wgpu::BindGroupLayoutEntry {
                    binding: 1,
                    visibility: wgpu::ShaderStages::FRAGMENT,
                    ty: wgpu::BindingType::Sampler(wgpu::SamplerBindingType::Filtering),
                    count: None,
                },
            ],
        });

        // Create terrain bind groups
        let terrain_bind_group_0 = self.device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Terrain Bind Group 0"),
            layout: &terrain_bind_group_layout_0,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: terrain_camera_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: neural_terrain.config_buffer.as_entire_binding(),
                },
            ],
        });

        let terrain_bind_group_1 = self.device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Terrain Bind Group 1"),
            layout: &terrain_bind_group_layout_1,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: wgpu::BindingResource::TextureView(&cognitive_texture_view),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: wgpu::BindingResource::Sampler(&cognitive_sampler),
                },
            ],
        });

        // Create terrain pipeline
        let terrain_pipeline_layout = self.device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Terrain Pipeline Layout"),
            bind_group_layouts: &[&terrain_bind_group_layout_0, &terrain_bind_group_layout_1],
            push_constant_ranges: &[],
        });

        let terrain_pipeline = self.device.create_render_pipeline(&wgpu::RenderPipelineDescriptor {
            label: Some("Neural Terrain Pipeline"),
            layout: Some(&terrain_pipeline_layout),
            vertex: wgpu::VertexState {
                module: &terrain_shader,
                entry_point: "vs_main",
                buffers: &[TerrainVertex::desc()],
            },
            fragment: Some(wgpu::FragmentState {
                module: &terrain_shader,
                entry_point: "fs_main",
                targets: &[Some(wgpu::ColorTargetState {
                    format: self.config.format,
                    blend: Some(wgpu::BlendState::ALPHA_BLENDING),
                    write_mask: wgpu::ColorWrites::ALL,
                })],
            }),
            primitive: wgpu::PrimitiveState {
                topology: wgpu::PrimitiveTopology::TriangleList,
                strip_index_format: None,
                front_face: wgpu::FrontFace::Ccw,
                cull_mode: Some(wgpu::Face::Back),
                polygon_mode: wgpu::PolygonMode::Fill,
                unclipped_depth: false,
                conservative: false,
            },
            depth_stencil: None,
            multisample: wgpu::MultisampleState::default(),
            multiview: None,
        });

        // Store terrain resources
        self.neural_terrain = Some(neural_terrain);
        self.terrain_pipeline = Some(terrain_pipeline);
        self.terrain_bind_group_layout = Some(terrain_bind_group_layout_0);
        self.terrain_bind_group = Some(terrain_bind_group_0);
        self.terrain_camera_buffer = Some(terrain_camera_buffer);
        self.cognitive_texture = Some(cognitive_texture);
        self.cognitive_texture_view = Some(cognitive_texture_view);
        self.cognitive_sampler = Some(cognitive_sampler);
        self.terrain_enabled = true;

        eprintln!("debug: Neural terrain enabled successfully!");
    }

    /// Enable evolution terrain rendering from the Evolution → Infinite Map Bridge
    pub fn enable_evolution_terrain(&mut self, gpu_resources: &crate::evolution_terrain_bridge::EvolutionTerrainGPU) {
        return; // TEMPORARY: Disable to stop crash due to shader binding mismatch
        eprintln!("debug: Enabling evolution terrain rendering...");

        // Create evolution terrain shader
        let evolution_shader = self.device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Evolution Terrain Shader"),
            source: wgpu::ShaderSource::Wgsl(include_str!("shaders/evolution_terrain.wgsl").into()),
        });

        // Create bind group layouts
        let layout_0 = self.device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Evolution Terrain Layout 0 (Camera + Config)"),
            entries: &[
                wgpu::BindGroupLayoutEntry {
                    binding: 0,
                    visibility: wgpu::ShaderStages::VERTEX,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Uniform,
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                wgpu::BindGroupLayoutEntry {
                    binding: 1,
                    visibility: wgpu::ShaderStages::VERTEX,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Uniform,
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
            ],
        });

        let layout_1 = self.device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Evolution Terrain Layout 1 (Heightmap + Color)"),
            entries: &[
                wgpu::BindGroupLayoutEntry {
                    binding: 0,
                    visibility: wgpu::ShaderStages::VERTEX | wgpu::ShaderStages::FRAGMENT,
                    ty: wgpu::BindingType::Texture {
                        multisampled: false,
                        view_dimension: wgpu::TextureViewDimension::D2,
                        sample_type: wgpu::TextureSampleType::Float { filterable: true },
                    },
                    count: None,
                },
                wgpu::BindGroupLayoutEntry {
                    binding: 1,
                    visibility: wgpu::ShaderStages::FRAGMENT,
                    ty: wgpu::BindingType::Texture {
                        multisampled: false,
                        view_dimension: wgpu::TextureViewDimension::D2,
                        sample_type: wgpu::TextureSampleType::Float { filterable: true },
                    },
                    count: None,
                },
                wgpu::BindGroupLayoutEntry {
                    binding: 2,
                    visibility: wgpu::ShaderStages::VERTEX | wgpu::ShaderStages::FRAGMENT,
                    ty: wgpu::BindingType::Sampler(wgpu::SamplerBindingType::Filtering),
                    count: None,
                },
            ],
        });

        let layout_2 = self.device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Evolution Terrain Layout 2 (Lighting)"),
            entries: &[
                wgpu::BindGroupLayoutEntry {
                    binding: 0,
                    visibility: wgpu::ShaderStages::FRAGMENT,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Uniform,
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
            ],
        });

        // Create lighting uniform buffer
        #[repr(C)]
        #[derive(Copy, Clone, bytemuck::Pod, bytemuck::Zeroable)]
        struct LightingUniforms {
            light_dir: [f32; 3],
            ambient: f32,
            light_color: [f32; 3],
            specular_power: f32,
            specular_intensity: f32,
            _padding: [f32; 2],
        }

        let lighting = LightingUniforms {
            light_dir: [0.5, -1.0, 0.5],
            ambient: 0.3,
            light_color: [1.0, 0.95, 0.8],
            specular_power: 32.0,
            specular_intensity: 0.5,
            _padding: [0.0, 0.0],
        };

        let lighting_buffer = self.device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("Evolution Terrain Lighting"),
            contents: bytemuck::cast_slice(&[lighting]),
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
        });

        // Create camera buffer (reuse neural terrain camera format)
        let terrain_camera_uniform = TerrainCameraUniform {
            view_proj: [[0.0; 4]; 4],
            view_pos: [0.0, 100.0, 200.0],
            _padding: 0.0,
        };

        let terrain_camera_buffer = self.device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("Evolution Terrain Camera Buffer"),
            contents: bytemuck::cast_slice(&[terrain_camera_uniform]),
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
        });

        // Create config buffer
        #[repr(C)]
        #[derive(Copy, Clone, bytemuck::Pod, bytemuck::Zeroable)]
        struct TerrainConfig {
            height_scale: f32,
            terrain_size: f32,
            min_height: f32,
            max_height: f32,
        }

        let config = TerrainConfig {
            height_scale: 50.0,
            terrain_size: 500.0,
            min_height: -10.0,
            max_height: 100.0,
        };

        let config_buffer = self.device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("Evolution Terrain Config"),
            contents: bytemuck::cast_slice(&[config]),
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
        });

        // Create bind group 0
        let bind_group_0 = self.device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Evolution Terrain Bind Group 0"),
            layout: &layout_0,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: terrain_camera_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: config_buffer.as_entire_binding(),
                },
            ],
        });

        // Create pipeline
        let pipeline_layout = self.device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Evolution Terrain Pipeline Layout"),
            bind_group_layouts: &[&layout_0, &layout_1, &layout_2],
            push_constant_ranges: &[],
        });

        let pipeline = self.device.create_render_pipeline(&wgpu::RenderPipelineDescriptor {
            label: Some("Evolution Terrain Pipeline"),
            layout: Some(&pipeline_layout),
            vertex: wgpu::VertexState {
                module: &evolution_shader,
                entry_point: "vs_main",
                buffers: &[crate::neural_terrain::TerrainVertex::desc()],
            },
            fragment: Some(wgpu::FragmentState {
                module: &evolution_shader,
                entry_point: "fs_main",
                targets: &[Some(wgpu::ColorTargetState {
                    format: self.config.format,
                    blend: Some(wgpu::BlendState::ALPHA_BLENDING),
                    write_mask: wgpu::ColorWrites::ALL,
                })],
            }),
            primitive: wgpu::PrimitiveState {
                topology: wgpu::PrimitiveTopology::TriangleList,
                strip_index_format: None,
                front_face: wgpu::FrontFace::Ccw,
                cull_mode: Some(wgpu::Face::Back),
                polygon_mode: wgpu::PolygonMode::Fill,
                unclipped_depth: false,
                conservative: false,
            },
            depth_stencil: None,
            multisample: wgpu::MultisampleState::default(),
            multiview: None,
        });

        // Store resources
        self.evolution_terrain_pipeline = Some(pipeline);
        self.evolution_terrain_bind_group_0 = Some(bind_group_0);
        self.evolution_terrain_bind_group_layout_0 = Some(layout_0);
        self.evolution_terrain_bind_group_layout_1 = Some(layout_1);
        self.evolution_terrain_bind_group_layout_2 = Some(layout_2);
        self.evolution_lighting_buffer = Some(lighting_buffer);
        self.terrain_camera_buffer = Some(terrain_camera_buffer);
        self.evolution_terrain_enabled = true;

        eprintln!("debug: Evolution terrain enabled successfully!");
    }

    /// Update evolution terrain lighting
    pub fn update_evolution_terrain_lighting(&mut self, light_dir: [f32; 3], ambient: f32) {
        if let Some(ref buffer) = self.evolution_lighting_buffer {
            #[repr(C)]
            #[derive(Copy, Clone, bytemuck::Pod, bytemuck::Zeroable)]
            struct LightingUniforms {
                light_dir: [f32; 3],
                ambient: f32,
                light_color: [f32; 3],
                specular_power: f32,
                specular_intensity: f32,
                _padding: [f32; 2],
            }

            let lighting = LightingUniforms {
                light_dir,
                ambient,
                light_color: [1.0, 0.95, 0.8],
                specular_power: 32.0,
                specular_intensity: 0.5,
                _padding: [0.0, 0.0],
            };

            self.queue.write_buffer(buffer, 0, bytemuck::cast_slice(&[lighting]));
        }
    }

    /// Set a new background texture (e.g. from Visual Shell)
    pub fn set_background_texture(&mut self, texture_view: &wgpu::TextureView) {
        // Recreate bind group with new texture
        self.bind_group = self.device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Grid Bind Group (Visual Shell)"),
            layout: &self.grid_bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: self.uniform_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: wgpu::BindingResource::TextureView(texture_view),
                },
                wgpu::BindGroupEntry {
                    binding: 2,
                    resource: wgpu::BindingResource::Sampler(&self.rts_texture_sampler),
                },
            ],
        });
        
        // Also update uniforms to use texture size if possible?
        // Note: PixelRTSBridge emits 1024x1024 or based on resolution (256).
        // The uniform buffer has rts_texture_size. 
        // We might want to update that too, but we don't have the size here easily without asking the texture view (which we can't).
        // Assuming 256 or 1024 is fine for the shader.
    }

    /// Update the RTS texture (Ground Truth Substrate) with new data
    pub fn update_rts_texture(&mut self, data: &[u8], width: u32, height: u32) {
        let size = wgpu::Extent3d {
            width,
            height,
            depth_or_array_layers: 1,
        };

        // Check if we need to recreate the texture (size change)
        let needs_recreate = if let Some(tex) = &self.rts_texture {
            tex.width() != width || tex.height() != height
        } else {
            true
        };

        if needs_recreate {
            eprintln!("debug: Recreating RTS Texture ({}x{})", width, height);
            let texture = self.device.create_texture(&wgpu::TextureDescriptor {
                label: Some("RTS Texture Update"),
                size,
                mip_level_count: 1,
                sample_count: 1,
                dimension: wgpu::TextureDimension::D2,
                format: wgpu::TextureFormat::Rgba8UnormSrgb,
                usage: wgpu::TextureUsages::TEXTURE_BINDING | wgpu::TextureUsages::COPY_DST | wgpu::TextureUsages::COPY_SRC,
                view_formats: &[],
            });
            
            let view = texture.create_view(&wgpu::TextureViewDescriptor::default());
            
            self.rts_texture = Some(texture);
            self.rts_texture_view = Some(view);
            
            // Recreate bind group
             self.bind_group = self.device.create_bind_group(&wgpu::BindGroupDescriptor {
                label: Some("Grid Bind Group (Updated)"),
                layout: &self.grid_bind_group_layout,
                entries: &[
                    wgpu::BindGroupEntry {
                        binding: 0,
                        resource: self.uniform_buffer.as_entire_binding(),
                    },
                    wgpu::BindGroupEntry {
                        binding: 1,
                        resource: wgpu::BindingResource::TextureView(self.rts_texture_view.as_ref().unwrap()),
                    },
                    wgpu::BindGroupEntry {
                        binding: 2,
                        resource: wgpu::BindingResource::Sampler(&self.rts_texture_sampler),
                    },
                ],
            });
        }
        
        // Write data to texture
        if let Some(texture) = &self.rts_texture {
             self.queue.write_texture(
                wgpu::ImageCopyTexture {
                    texture,
                    mip_level: 0,
                    origin: wgpu::Origin3d::ZERO,
                    aspect: wgpu::TextureAspect::All,
                },
                data,
                wgpu::ImageDataLayout {
                    offset: 0,
                    bytes_per_row: Some(4 * width),
                    rows_per_image: Some(height),
                },
                size,
            );
        }
    }

    #[allow(dead_code)]
    pub fn update_cartridge_texture(&mut self, width: u32, height: u32, data: &[u8]) {
        if let Some(cartridge) = &mut self.cartridge {
             cartridge.update_texture(width, height, data);
             
             // Recreate bind group because texture view might have changed
             if let (Some(layout), Some(buf)) = (&self.cartridge_bind_group_layout, &self.cartridge_uniform_buffer) {
                 self.cartridge_bind_group = Some(create_cartridge_bind_group(
                     &self.device,
                     layout,
                     cartridge,
                     &self.uniform_buffer,
                     buf
                 ));
             }
        }
    }

    pub fn resize(&mut self, new_size: winit::dpi::PhysicalSize<u32>) {
        if new_size.width > 0 && new_size.height > 0 {
            self.config.width = new_size.width;
            self.config.height = new_size.height;
            self.surface.configure(&self.device, &self.config);
        }
    }

    pub fn get_surface_manager(&mut self) -> &mut SurfaceManager {
        &mut self.surface_manager
    }

    pub fn get_device(&self) -> Arc<wgpu::Device> {
        Arc::clone(&self.device)
    }

    pub fn get_config(&self) -> &wgpu::SurfaceConfiguration {
        &self.config
    }

    pub fn get_queue(&self) -> Arc<wgpu::Queue> {
        Arc::clone(&self.queue)
    }

    pub fn get_width(&self) -> u32 {
        self.config.width
    }

    pub fn get_height(&self) -> u32 {
        self.config.height
    }

    pub fn get_neural_texture_view(&self) -> Option<&wgpu::TextureView> {
        self.rts_texture_view.as_ref()
    }

    pub fn get_output_texture(&self) -> Option<&wgpu::Texture> {
        // Return the RTS/Neural texture for feedback
        // This allows the system to see its own "mind" texture
        self.rts_texture.as_ref()
    }

    pub fn get_surface_bind_group_layout(&self) -> Arc<wgpu::BindGroupLayout> {
        Arc::clone(&self.surface_bind_group_layout)
    }

    pub fn get_surface_format(&self) -> wgpu::TextureFormat {
        self.config.format
    }

    pub fn get_shared_sampler(&self) -> Arc<wgpu::Sampler> {
        // Note: We need to create a shared sampler for this to work
        // For now, create one on demand (this is a temporary solution)
        // In production, we should store the shared sampler in the Renderer struct
        Arc::new(self.device.create_sampler(&wgpu::SamplerDescriptor {
            address_mode_u: wgpu::AddressMode::ClampToEdge,
            address_mode_v: wgpu::AddressMode::ClampToEdge,
            address_mode_w: wgpu::AddressMode::ClampToEdge,
            mag_filter: wgpu::FilterMode::Linear,
            min_filter: wgpu::FilterMode::Linear,
            mipmap_filter: wgpu::FilterMode::Linear,
            ..Default::default()
        }))
    }

    /// Enable the Crystallized Text Engine (GPU-native Word Processor)
    pub fn enable_text_engine(&mut self) {
        eprintln!("debug: Enabling Crystallized Text Engine...");
        let text_engine = crate::text_engine::TextEngine::new(&self.device, &self.queue, &self.config);
        self.text_engine = Some(text_engine);
        eprintln!("debug: Text Engine enabled successfully!");
    }

    /// Update memory artifact uniforms
    pub fn update_memory_artifact_uniforms(&self, view_proj: [[f32; 4]; 4], time: f32, entropy_threshold: f32) {
        if let Some(buffer) = &self.memory_artifact_uniform_buffer {
            let uniforms = [
                view_proj[0][0], view_proj[0][1], view_proj[0][2], view_proj[0][3],
                view_proj[1][0], view_proj[1][1], view_proj[1][2], view_proj[1][3],
                view_proj[2][0], view_proj[2][1], view_proj[2][2], view_proj[2][3],
                view_proj[3][0], view_proj[3][1], view_proj[3][2], view_proj[3][3],
                time,
                entropy_threshold,
                0.0, // padding
            ];

            self.queue.write_buffer(buffer, 0, bytemuck::cast_slice(&uniforms));
        }
    }

    // Phase 39: Update neural terrain camera uniforms
    pub fn update_terrain_camera(&mut self, view_proj: [[f32; 4]; 4], view_pos: [f32; 3]) {
        if let Some(buffer) = &self.terrain_camera_buffer {
            let uniform = TerrainCameraUniform {
                view_proj,
                view_pos,
                _padding: 0.0,
            };
            self.queue.write_buffer(buffer, 0, bytemuck::cast_slice(&[uniform]));
        }
    }

    pub fn check_hot_reload(&mut self) {
        if self.last_hot_reload_check.elapsed() < std::time::Duration::from_millis(1000) {
            return;
        }
        self.last_hot_reload_check = std::time::Instant::now();

        if !self.memory_artifact_shader_path.exists() {
            return;
        }

        let current_mtime = std::fs::metadata(&self.memory_artifact_shader_path)
            .ok()
            .and_then(|m| m.modified().ok());

        if current_mtime > self.memory_artifact_mtime {
            eprintln!("debug: Hot Reload detected for {:?}", self.memory_artifact_shader_path);
            
            // Reload Source
            let source_str = match crate::foundry::optical_loader::OpticalLoader::load_text_source(&self.memory_artifact_shader_path) {
                Ok(s) => s,
                Err(e) => {
                    eprintln!("error: Hot Reload Failed to load brick: {}", e);
                    return; 
                }
            };

            // Compile Shader
            let shader = self.device.create_shader_module(wgpu::ShaderModuleDescriptor {
                label: Some("Memory Artifact Shader (Hot Reloaded)"),
                source: wgpu::ShaderSource::Wgsl(source_str.into()),
            });

            // Recreate Pipeline
            if let Some(layout) = &self.memory_artifact_bind_group_layout {
                 let pipeline_layout = self.device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
                    label: Some("Memory Artifact Pipeline Layout (Hot Reloaded)"),
                    bind_group_layouts: &[layout],
                    push_constant_ranges: &[],
                });

                let pipeline = self.device.create_render_pipeline(&wgpu::RenderPipelineDescriptor {
                    label: Some("Memory Artifact Render Pipeline"),
                    layout: Some(&pipeline_layout),
                    vertex: wgpu::VertexState {
                        module: &shader,
                        entry_point: "vs_main",
                        buffers: &[wgpu::VertexBufferLayout {
                            array_stride: std::mem::size_of::<crate::memory_artifacts::MemoryVertex>() as wgpu::BufferAddress,
                            step_mode: wgpu::VertexStepMode::Vertex,
                            attributes: &[
                                wgpu::VertexAttribute {
                                    offset: 0,
                                    shader_location: 0,
                                    format: wgpu::VertexFormat::Float32x3,
                                },
                                wgpu::VertexAttribute {
                                    offset: std::mem::size_of::<[f32; 3]>() as wgpu::BufferAddress,
                                    shader_location: 1,
                                    format: wgpu::VertexFormat::Float32x4,
                                },
                                wgpu::VertexAttribute {
                                    offset: std::mem::size_of::<[f32; 7]>() as wgpu::BufferAddress,
                                    shader_location: 2,
                                    format: wgpu::VertexFormat::Float32x2,
                                },
                                wgpu::VertexAttribute {
                                    offset: std::mem::size_of::<[f32; 9]>() as wgpu::BufferAddress,
                                    shader_location: 3,
                                    format: wgpu::VertexFormat::Float32,
                                },
                            ],
                        }],
                    },
                    fragment: Some(wgpu::FragmentState {
                        module: &shader,
                        entry_point: "fs_main",
                        targets: &[Some(wgpu::ColorTargetState {
                            format: self.config.format,
                            blend: Some(wgpu::BlendState::ALPHA_BLENDING),
                            write_mask: wgpu::ColorWrites::ALL,
                        })],
                    }),
                    primitive: wgpu::PrimitiveState {
                        topology: wgpu::PrimitiveTopology::TriangleList,
                        strip_index_format: None,
                        front_face: wgpu::FrontFace::Ccw,
                        cull_mode: Some(wgpu::Face::Back),
                        polygon_mode: wgpu::PolygonMode::Fill,
                        unclipped_depth: false,
                        conservative: false,
                    },
                    depth_stencil: None,
                    multisample: wgpu::MultisampleState::default(),
                    multiview: None,
                });

                self.memory_artifact_pipeline = Some(pipeline);
                self.memory_artifact_mtime = current_mtime;
                eprintln!("debug: Hot Reload SUCCESS!");
            }
        }
    }

    /// Render a terminal tile using the GPU compute shader
    pub fn render_terminal_tile(
        &self,
        window_id: usize,
        rows: u32,
        cols: u32,
        terminal_ram_view: &wgpu::TextureView,
        cursor_x: u32,
        cursor_y: u32,
        time: f32,
        vm_texture_manager: &mut crate::vm_texture_manager::VmTextureManager,
    ) {
        if let Some(ref tr) = self.terminal_renderer {
            // 1. Ensure we have a texture in the manager
            let _ = vm_texture_manager.update_vm_texture(window_id, &[0; 4], cols * 8, rows * 16);
            
            if let Some(vm_tex) = vm_texture_manager.get_texture(window_id) {
                let mut encoder = self.device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
                    label: Some("Terminal Compute Encoder"),
                });

                tr.render(
                    &self.device,
                    &mut encoder,
                    &vm_tex.view,
                    rows,
                    cols,
                    terminal_ram_view,
                    cursor_x,
                    cursor_y,
                    time,
                );

                self.queue.submit(std::iter::once(encoder.finish()));
            }
        }
    }

    pub fn render(&mut self, camera: &Camera, window_manager: &crate::window::WindowManager, thought_renderer: Option<&ThoughtRenderer>, vm_texture_manager: Option<&crate::vm_texture_manager::VmTextureManager>, memory_texture_manager: Option<&crate::memory_texture_manager::MemoryTextureManager>, cartridge_texture_manager: Option<&crate::cartridge_texture_manager::CartridgeTextureManager>, memory_artifact_manager: Option<&crate::memory_artifacts::MemoryArtifactManager>, graph_renderer: Option<&std::sync::Arc<crate::graph_renderer::GraphRenderer>>, inspector_ui: Option<&std::sync::Arc<crate::inspector_ui::InspectorUI>>, agent_manager: Option<&crate::cognitive::agents::CityAgentManager>, visual_ast: Option<&crate::visual_ast::VisualAST>, inspector_visible: bool, screenshot_request: Option<(i32, i32, u32, u32)>) -> Result<Option<(Vec<u8>, u32, u32)>, wgpu::SurfaceError> {
        self.check_hot_reload();
        let output = self.surface.get_current_texture()?;
        let view = output.texture.create_view(&wgpu::TextureViewDescriptor::default());

        let mut encoder = self.device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
            label: Some("Render Encoder"),
        });

        // Update uniforms
        let rts_size = if let (Some(tex), Some(_view)) = (&self.rts_texture, &self.rts_texture_view) {
            [tex.width() as f32, tex.height() as f32]
        } else {
            [1024.0, 1024.0]
        };

        let uniforms = Uniforms {
            screen_size: [self.config.width as f32, self.config.height as f32],
            camera_pos: [camera.x, camera.y],
            zoom: camera.zoom,
            grid_size: 100.0,
            grid_opacity: 0.3,
            time: (SystemTime::now().duration_since(UNIX_EPOCH).unwrap().as_millis() % 1000000) as f32 / 1000.0,
            rts_texture_size: rts_size,
            _padding2: [0.0; 2],
        };

        self.queue.write_buffer(
            &self.uniform_buffer,
            0,
            bytemuck::cast_slice(&[uniforms]),
        );

        // Phase 39: Update neural terrain camera & Memory Artifacts
        // Shared View-Projection for 3D elements
        let mut view_proj_matrix = [[0.0; 4]; 4];
        let time = std::time::SystemTime::now().duration_since(std::time::UNIX_EPOCH).unwrap_or_default().as_secs_f32();

        // Constants for 3D View
        let aspect = self.config.width as f32 / self.config.height as f32;
        let fov = std::f32::consts::PI / 4.0; // 45 degrees
        let near = 1.0;
        let far = 5000.0; // Increased draw distance for infinite map

        // Perspective projection
        let f = 1.0 / (fov / 2.0).tan();
        let proj = [
            [f / aspect, 0.0, 0.0, 0.0],
            [0.0, f, 0.0, 0.0],
            [0.0, 0.0, (far + near) / (near - far), -1.0],
            [0.0, 0.0, (2.0 * far * near) / (near - far), 0.0],
        ];

        // View matrix (Sync with 2D Camera)
        // Map 2D World (X,Y) to 3D World (X,Z) with Y as Height to be consistent with "Terrain"
        // Camera (x,y) -> Target (x, 0, y)
        // This makes "Up" on the map correspond to "+Z" in 3D world, which is "Into the distance"
        
        let pan_x = camera.x;
        let pan_y = camera.y;

        // Isometric-style view following the camera
        let eye = [pan_x, 800.0, pan_y + 800.0]; 
        let target = [pan_x, 0.0, pan_y];
        let up = [0.0, 1.0, 0.0]; // Y is Up (Height)

        let f_vec = Self::normalize_vec3(Self::subtract_vec3(target, eye));
        let s_vec = Self::normalize_vec3(Self::cross_vec3(f_vec, up));
        let u_vec = Self::cross_vec3(s_vec, f_vec);

        let view_matrix = [
            [s_vec[0], u_vec[0], -f_vec[0], 0.0],
            [s_vec[1], u_vec[1], -f_vec[1], 0.0],
            [s_vec[2], u_vec[2], -f_vec[2], 0.0],
            [-Self::dot_vec3(s_vec, eye), -Self::dot_vec3(u_vec, eye), Self::dot_vec3(f_vec, eye), 1.0],
        ];

        // Multiply view * projection
        view_proj_matrix = Self::multiply_matrices(view_matrix, proj);
        
        // Update Terrain Camera
        if self.terrain_enabled {
            self.update_terrain_camera(view_proj_matrix, eye);
        }
        
        // Update Memory Artifacts Uniforms
        // Use same view-projection for consistency
        self.update_memory_artifact_uniforms(view_proj_matrix, time, 0.1);

        struct WindowDrawCall<'a> {
            // Surface content
            surface_bind_group: Option<&'a wgpu::BindGroup>,
            content_rect: [f32; 4], // x, y, w, h
            
            // Decoration
            frame_rect: [f32; 4], // x, y, w, h
            frame_color: [f32; 4],
            _marker: std::marker::PhantomData<&'a ()>
        }

        let mut draw_calls = Vec::new();

        for window in window_manager.get_windows() {
            // Calculate coordinates
            // World space:
            let window_x = window.x;
            let window_y = window.y;
            let window_w = window.width;
            let window_h = window.height;
            
            let title_height = window.decorations.title_bar_height;
            let border = window.decorations.border_width;

            // Frame (Decoration) Rect: includes border and title
            let frame_world_x = window_x - border;
            let frame_world_y = window_y - title_height - border;
            let frame_world_w = window_w + 2.0 * border;
            let frame_world_h = window_h + title_height + 2.0 * border;

            let frame_screen_pos = camera.world_to_screen(
                frame_world_x, frame_world_y,
                self.config.width as f32, self.config.height as f32
            );
            let frame_screen_w = frame_world_w * camera.zoom;
            let frame_screen_h = frame_world_h * camera.zoom;

            // Content Rect
            let content_screen_pos = camera.world_to_screen(
                window_x, window_y,
                self.config.width as f32, self.config.height as f32
            );
            let content_screen_w = window_w * camera.zoom;
            let content_screen_h = window_h * camera.zoom;

            let frame_color = window.custom_border_color.unwrap_or_else(|| {
                // Phase 35.9.3: Use boot state color for EvolutionZone cartridges
                if window.window_type == crate::window::WindowType::EvolutionZone {
                    let color = match window.boot_state {
                        crate::window::CartridgeBootState::Idle => (1.0, 0.84, 0.0), // Gold
                        crate::window::CartridgeBootState::Booting => (0.0, 1.0, 1.0), // Cyan
                        crate::window::CartridgeBootState::Running => (0.0, 1.0, 0.0), // Green
                        crate::window::CartridgeBootState::Failed => (1.0, 0.0, 0.0), // Red
                    };
                    [color.0, color.1, color.2, 1.0]
                } else {
                    let color = window.window_type.border_color();
                    [color.0, color.1, color.2, 1.0]
                }
            });

            let mut surface_bind_group = None;
            if let Some(surface) = &window.surface {
                 if let Some(surface_texture) = self.surface_manager.get_texture(surface) {
                      // CACHED: Use the pre-created bind group
                      surface_bind_group = Some(&surface_texture.bind_group);
                  }
            }
            
            // Phase 30.2: Check for VM texture
            // If window has VM texture, use it instead of Wayland surface
            if window.has_vm_texture {
                if let Some(vm_texture_manager) = vm_texture_manager {
                    if let Some(vm_texture) = vm_texture_manager.get_texture(window.id) {
                        surface_bind_group = Some(&vm_texture.bind_group);
                    }
                }
            }

            // Phase 3: Terminal Clone Integration
            if window.has_terminal_texture {
                if let Some(vm_texture_manager) = vm_texture_manager {
                    if let Some(vm_texture) = vm_texture_manager.get_texture(window.id) {
                        surface_bind_group = Some(&vm_texture.bind_group);
                    }
                }
            }

            // Phase 33: Check for Memory texture
            // If window has memory texture, use it instead of Wayland surface
            if window.has_memory_texture {
                if let Some(memory_texture_manager) = memory_texture_manager {
                    if let Some(memory_texture) = memory_texture_manager.get_texture(window.id) {
                        surface_bind_group = Some(&memory_texture.bind_group);
                    }
                }
            }

            // Phase 35.9.1: Check for Cartridge texture (.rts.png)
            // If window has cartridge texture, use it instead of other textures
            if window.has_cartridge_texture {
                if let Some(cartridge_texture_manager) = cartridge_texture_manager {
                    if let Some(cartridge_id) = &window.cartridge_texture_id {
                        if let Some(cartridge_texture) = cartridge_texture_manager.get_texture(cartridge_id) {
                            surface_bind_group = Some(&cartridge_texture.bind_group);
                        }
                    }
                }
            }

            draw_calls.push(WindowDrawCall {
                surface_bind_group,
                content_rect: [content_screen_pos.x, content_screen_pos.y, content_screen_w, content_screen_h],
                frame_rect: [frame_screen_pos.x, frame_screen_pos.y, frame_screen_w, frame_screen_h],
                frame_color,
                _marker: std::marker::PhantomData
            });
        }

        // Create dynamic terrain bind group if needed (must live longer than render pass)
        let mut dynamic_terrain_bind_group = None;
        if self.terrain_enabled {
             if let (Some(pipeline), Some(cog_view), Some(cog_sampler)) = (&self.terrain_pipeline, &self.cognitive_texture_view, &self.cognitive_sampler) {
                  dynamic_terrain_bind_group = Some(self.device.create_bind_group(&wgpu::BindGroupDescriptor {
                        label: Some("Terrain Bind Group 1 (Dynamic)"),
                        layout: &pipeline.get_bind_group_layout(1),
                        entries: &[
                            wgpu::BindGroupEntry {
                                binding: 0,
                                resource: wgpu::BindingResource::TextureView(cog_view),
                            },
                            wgpu::BindGroupEntry {
                                binding: 1,
                                resource: wgpu::BindingResource::Sampler(cog_sampler),
                            },
                        ],
                    }));
             }
        }

        // Phase 37.3: Update Cortex Layer
        if let Some(cortex) = &mut self.cortex_renderer {
            let queue = &self.queue;
            cortex.update(queue);
        }

        {
            let mut render_pass = encoder.begin_render_pass(&wgpu::RenderPassDescriptor {
                label: Some("Render Pass"),
                color_attachments: &[Some(wgpu::RenderPassColorAttachment {
                    view: &view,
                    resolve_target: None,
                    ops: wgpu::Operations {
                        load: wgpu::LoadOp::Clear(wgpu::Color {
                            r: 0.02,
                            g: 0.02,
                            b: 0.02,
                            a: 1.0,
                        }),
                        store: wgpu::StoreOp::Store,
                    },
                })],
                depth_stencil_attachment: None,
                timestamp_writes: None,
                occlusion_query_set: None,
            });

            // 1. Draw Grid/Background
            render_pass.set_pipeline(&self.render_pipeline);
            render_pass.set_bind_group(0, &self.bind_group, &[]);
            render_pass.draw(0..6, 0..1); // Full-screen quad

            // 1.4. Draw Neural Terrain (Phase 39)
            if self.terrain_enabled {
                if let (Some(terrain), Some(pipeline), Some(bind_group_0)) = (
                    &self.neural_terrain,
                    &self.terrain_pipeline,
                    &self.terrain_bind_group
                ) {
                    render_pass.set_pipeline(pipeline);
                    render_pass.set_bind_group(0, bind_group_0, &[]);
                    
                    // Set bind group 1 (cognitive texture + sampler)
                    if let Some(bg) = &dynamic_terrain_bind_group {
                        render_pass.set_bind_group(1, bg, &[]);
                    }
                    
                    render_pass.set_vertex_buffer(0, terrain.vertex_buffer.slice(..));
                    render_pass.set_index_buffer(terrain.index_buffer.slice(..), wgpu::IndexFormat::Uint32);
                    render_pass.draw_indexed(0..terrain.num_indices, 0, 0..1);
                }
            }

            // 1.4b. Draw Evolution Terrain (Evolution → Infinite Map Bridge)
            /* TEMPORARILY DISABLED due to WGSL binding mismatch
            if self.evolution_terrain_enabled {
                if let (Some(terrain), Some(pipeline), Some(bg_0)) = (
                    &self.neural_terrain,  // Reuse the mesh from neural terrain
                    &self.evolution_terrain_pipeline,
                    &self.evolution_terrain_bind_group_0
                ) {
                    render_pass.set_pipeline(pipeline);
                    render_pass.set_bind_group(0, bg_0, &[]);
                    // Note: Bind groups 1 and 2 are set dynamically from the app layer
                    // with evolution textures. See app.rs for integration.
                    render_pass.set_vertex_buffer(0, terrain.vertex_buffer.slice(..));
                    render_pass.set_index_buffer(terrain.index_buffer.slice(..), wgpu::IndexFormat::Uint32);
                    render_pass.draw_indexed(0..terrain.num_indices, 0, 0..1);
                }
            }
            */

            // 1.5. Draw Thoughts
            if let Some(tr) = thought_renderer {
                tr.render(&mut render_pass);
            }

            // 1.6. Draw Memory Artifacts (3D geometry)
            if let (Some(pipeline), Some(bind_group), Some(manager)) = (&self.memory_artifact_pipeline, &self.memory_artifact_bind_group, memory_artifact_manager) {
                if let (Some(vbuf), Some(ibuf)) = (manager.get_vertex_buffer(), manager.get_index_buffer()) {
                    let index_count = manager.get_index_count();
                    if index_count > 0 {
                        render_pass.set_pipeline(pipeline);
                        render_pass.set_bind_group(0, bind_group, &[]);
                        render_pass.set_vertex_buffer(0, vbuf.slice(..));
                        render_pass.set_index_buffer(ibuf.slice(..), wgpu::IndexFormat::Uint16);
                        render_pass.draw_indexed(0..index_count, 0, 0..1);
                    }
                }
            }

            // 1.6.5. Draw Cortex Overlay (Phase 37.3)
            if let Some(cortex) = &self.cortex_renderer {
                cortex.render(&mut render_pass);
            }

            // 1.7. Draw Cognitive Agents (Phase 46 Task 3)
            if let (Some(renderer), Some(manager)) = (&mut self.agent_renderer, agent_manager) {
                renderer.update_instances(&self.queue, manager);
                renderer.render(&mut render_pass, manager.list_agents().len() as u32);
            }

            // 1.8. Draw Visual AST (Phase 41)
            if let (Some(renderer), Some(ast)) = (&mut self.visual_ast_renderer, visual_ast) {
                renderer.update(&self.queue, ast);
                renderer.render(&mut render_pass);
            }

            // 2. Draw Windows (Painter's Algorithm)
            for call in &draw_calls {
                // Safety check to prevent viewport panics
                let surface_width = self.config.width as f32;
                let surface_height = self.config.height as f32;

                let is_viewport_valid = |x: f32, y: f32, w: f32, h: f32| -> bool {
                    x < surface_width && y < surface_height && (x + w) > 0.0 && (y + h) > 0.0 && w > 0.0 && h > 0.0
                };

                let clamp_viewport = |rect: [f32; 4]| -> Option<[f32; 4]> {
                    if !is_viewport_valid(rect[0], rect[1], rect[2], rect[3]) {
                        return None;
                    }
                    
                    let vx = rect[0].max(0.0);
                    let vy = rect[1].max(0.0);
                    let vw = (rect[0] + rect[2]).min(surface_width) - vx;
                    let vh = (rect[1] + rect[3]).min(surface_height) - vy;
                    
                    if vw > 0.0 && vh > 0.0 {
                        Some([vx, vy, vw, vh])
                    } else {
                        None
                    }
                };

                // A. Draw Decoration Frame
                self.queue.write_buffer(&self.decoration_buffer, 0, bytemuck::cast_slice(&[call.frame_color]));
                render_pass.set_pipeline(&self.decoration_pipeline);
                render_pass.set_bind_group(0, &self.decoration_bind_group, &[]);
                
                if let Some(v) = clamp_viewport(call.frame_rect) {
                    render_pass.set_viewport(v[0], v[1], v[2], v[3], 0.0, 1.0);
                    render_pass.set_scissor_rect(v[0] as u32, v[1] as u32, v[2] as u32, v[3] as u32);
                    render_pass.draw(0..6, 0..1);
                }

                // B. Draw Surface Content (if available)
                if let Some(bg) = call.surface_bind_group {
                    render_pass.set_pipeline(&self.surface_pipeline);
                    render_pass.set_bind_group(0, bg, &[]);
                    
                    if let Some(v) = clamp_viewport(call.content_rect) {
                         render_pass.set_viewport(v[0], v[1], v[2], v[3], 0.0, 1.0);
                         render_pass.set_scissor_rect(v[0] as u32, v[1] as u32, v[2] as u32, v[3] as u32);
                         render_pass.draw(0..6, 0..1);
                    }
                }
            }

            // Render memory graph if available
            if let Some(graph_renderer) = graph_renderer {
                graph_renderer.render(&mut render_pass);
            }

            // Render inspector UI overlay if visible
            if inspector_visible {
                if let Some(inspector_ui) = inspector_ui {
                    // TODO: Implement proper WGPU UI rendering
                    // inspector_ui.render(&mut render_pass);
                }
            }
        }

        if let Some((rx, ry, rw, rh)) = screenshot_request {
            // Phase 36: Framebuffer Capture with Unpadding
            let bytes_per_pixel = 4;
            let unpadded_bytes_per_row = rw * bytes_per_pixel;
            let align = 256;
            let padded_bytes_per_row_padding = (align - unpadded_bytes_per_row % align) % align;
            let padded_bytes_per_row = unpadded_bytes_per_row + padded_bytes_per_row_padding;
            
            let buffer_size = (padded_bytes_per_row * rh) as wgpu::BufferAddress;
            
            let buffer_desc = wgpu::BufferDescriptor {
                size: buffer_size,
                usage: wgpu::BufferUsages::COPY_DST | wgpu::BufferUsages::MAP_READ,
                label: Some("Screenshot Buffer"),
                mapped_at_creation: false,
            };
            let buffer = self.device.create_buffer(&buffer_desc);
            
            encoder.copy_texture_to_buffer(
                wgpu::ImageCopyTexture {
                    texture: &output.texture,
                    mip_level: 0,
                    origin: wgpu::Origin3d { x: rx as u32, y: ry as u32, z: 0 },
                    aspect: wgpu::TextureAspect::All,
                },
                wgpu::ImageCopyBuffer {
                    buffer: &buffer,
                    layout: wgpu::ImageDataLayout {
                        offset: 0,
                        bytes_per_row: Some(padded_bytes_per_row),
                        rows_per_image: Some(rh),
                    },
                },
                wgpu::Extent3d {
                    width: rw,
                    height: rh,
                    depth_or_array_layers: 1,
                },
            );
            
            self.queue.submit(std::iter::once(encoder.finish()));
            
            // Map buffer synchronously
            let buffer_slice = buffer.slice(..);
            let (tx, rx) = std::sync::mpsc::channel();
            buffer_slice.map_async(wgpu::MapMode::Read, move |v| tx.send(v).unwrap());
            
            self.device.poll(wgpu::Maintain::Wait);
            
            let screenshot_data = if let Ok(Ok(())) = rx.recv() {
                 let data = buffer_slice.get_mapped_range();
                 // Unpad row by row
                 let mut unpadded_data = Vec::with_capacity((rw * rh * 4) as usize);
                 for chunk in data.chunks(padded_bytes_per_row as usize) {
                     unpadded_data.extend_from_slice(&chunk[..unpadded_bytes_per_row as usize]);
                 }
                 Some((unpadded_data, rw, rh))
            } else {
                eprintln!("Failed to map buffer for screenshot");
                None
            };
            
            buffer.unmap();
            
            output.present();
            return Ok(screenshot_data);
        }

        // Phase 30: Crystallized MSDF Text Rendering
        if let Some(text_engine) = &mut self.text_engine {
            // Phase 40: Hex Tensor Editor Compute Pass
            text_engine.prepare_gpu(&self.queue, &mut encoder);

            let mut rpass = encoder.begin_render_pass(&wgpu::RenderPassDescriptor {
                label: Some("MSDF Text Pass"),
                color_attachments: &[Some(wgpu::RenderPassColorAttachment {
                    view: &view,
                    resolve_target: None,
                    ops: wgpu::Operations {
                        load: wgpu::LoadOp::Load,
                        store: wgpu::StoreOp::Store,
                    },
                })],
                depth_stencil_attachment: None,
                timestamp_writes: None,
                occlusion_query_set: None,
            });

            rpass.set_pipeline(&text_engine.pipeline);
            rpass.set_bind_group(0, &text_engine.bind_group, &[]);
            rpass.draw(0..4, 0..1);
        }

        // Phase 42: Render compilation status border
        self.render_compilation_border(&mut encoder, &view);

        self.queue.submit(std::iter::once(encoder.finish()));
        output.present();

        Ok(None)
    }

    /// Load a bootable cartridge as ground truth substrate
    pub fn load_bootable_cartridge(&mut self, path: &str) -> Result<(), String> {
        log::info!("Loading bootable cartridge: {}", path);
        
        let mut cartridge = BootableCartridge::new(self.device.clone(), self.queue.clone());
        
        cartridge.load_cartridge(path)?;
        
        // Create cartridge pipeline
        let cartridge_shader = self.device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Ground Truth Shader"),
            source: wgpu::ShaderSource::Wgsl(include_str!("shaders/ground_truth.wgsl").into()),
        });

        let cartridge_bind_group_layout = create_cartridge_bind_group_layout(&self.device);
        
        let cartridge_uniform_buffer = create_cartridge_uniform_buffer(&self.device, cartridge.get_state());
        
        let cartridge_bind_group = create_cartridge_bind_group(
            &self.device,
            &cartridge_bind_group_layout,
            &cartridge,
            &self.uniform_buffer,
            &cartridge_uniform_buffer
        );
        
        let cartridge_pipeline_layout = self.device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Cartridge Pipeline Layout"),
            bind_group_layouts: &[&cartridge_bind_group_layout],
            push_constant_ranges: &[],
        });
        
        let cartridge_pipeline = self.device.create_render_pipeline(&wgpu::RenderPipelineDescriptor {
            label: Some("Cartridge Render Pipeline"),
            layout: Some(&cartridge_pipeline_layout),
            vertex: wgpu::VertexState {
                module: &cartridge_shader,
                entry_point: "vs_main",
                buffers: &[],
            },
            fragment: Some(wgpu::FragmentState {
                module: &cartridge_shader,
                entry_point: "fs_main",
                targets: &[Some(wgpu::ColorTargetState {
                    format: self.config.format,
                    blend: Some(wgpu::BlendState::ALPHA_BLENDING),
                    write_mask: wgpu::ColorWrites::ALL,
                })],
            }),
            primitive: wgpu::PrimitiveState {
                topology: wgpu::PrimitiveTopology::TriangleList,
                strip_index_format: None,
                front_face: wgpu::FrontFace::Ccw,
                cull_mode: None,
                polygon_mode: wgpu::PolygonMode::Fill,
                unclipped_depth: false,
                conservative: false,
            },
            depth_stencil: None,
            multisample: wgpu::MultisampleState::default(),
            multiview: None,
        });
        
        self.cartridge = Some(cartridge);
        self.cartridge_pipeline = Some(cartridge_pipeline);
        self.cartridge_bind_group = Some(cartridge_bind_group);
        self.cartridge_uniform_buffer = Some(cartridge_uniform_buffer);
        self.cartridge_bind_group_layout = Some(cartridge_bind_group_layout);
        self.use_cartridge_as_ground = true;
        
        log::info!("Bootable cartridge loaded successfully");
        Ok(())
    }

    /// Update cartridge state from AI neural data
    pub fn update_cartridge_state(&mut self, confidence: f32, fatigue: f32, alignment: f32) {
        if let Some(cartridge) = &mut self.cartridge {
            cartridge.update_state(confidence, fatigue, alignment);
            self.cartridge_state = cartridge.get_state().clone();
            
            // Update uniform buffer
            if let Some(uniform_buffer) = &self.cartridge_uniform_buffer {
                update_cartridge_uniform_buffer(&self.queue, uniform_buffer, &self.cartridge_state);
            }
        }
    }

    /// Get cartridge state
    pub fn get_cartridge_state(&self) -> &CartridgeState {
        &self.cartridge_state
    }

    /// Check if cartridge is mounted
    pub fn is_cartridge_mounted(&self) -> bool {
        self.cartridge.is_some() && self.use_cartridge_as_ground
    }

    /// Enable/disable cartridge as ground truth substrate
    pub fn set_cartridge_as_ground(&mut self, enabled: bool) {
        self.use_cartridge_as_ground = enabled;
    }

    /// Phase 39.2: Hot-swap the main grid shader
    pub fn recompile_grid_pipeline(&mut self, source: &str) -> Result<(), String> {
        log::info!("⚡ Phase 39.2: Recompiling Grid pipeline...");
        
        let shader_module = self.device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Hot-Swapped Grid Shader"),
            source: wgpu::ShaderSource::Wgsl(source.into()),
        });

        let new_pipeline = self.device.create_render_pipeline(&wgpu::RenderPipelineDescriptor {
            label: Some("Grid Hot-Swap Pipeline"),
            layout: Some(&self.grid_pipeline_layout),
            vertex: wgpu::VertexState {
                module: &shader_module,
                entry_point: "vs_main",
                buffers: &[],
            },
            fragment: Some(wgpu::FragmentState {
                module: &shader_module,
                entry_point: "fs_main",
                targets: &[Some(wgpu::ColorTargetState {
                    format: self.config.format,
                    blend: Some(wgpu::BlendState::ALPHA_BLENDING),
                    write_mask: wgpu::ColorWrites::ALL,
                })],
            }),
            primitive: wgpu::PrimitiveState {
                topology: wgpu::PrimitiveTopology::TriangleList,
                strip_index_format: None,
                front_face: wgpu::FrontFace::Ccw,
                cull_mode: None,
                polygon_mode: wgpu::PolygonMode::Fill,
                unclipped_depth: false,
                conservative: false,
            },
            depth_stencil: None,
            multisample: wgpu::MultisampleState::default(),
            multiview: None,
        });

        self.render_pipeline = new_pipeline;
        log::info!("✅ Phase 39.2: Grid shader hot-swapped successfully!");
        Ok(())
    }

    // Phase 39: Matrix math helpers for terrain camera
    fn subtract_vec3(a: [f32; 3], b: [f32; 3]) -> [f32; 3] {
        [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
    }

    fn normalize_vec3(v: [f32; 3]) -> [f32; 3] {
        let len = (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt();
        if len > 0.0001 {
            [v[0] / len, v[1] / len, v[2] / len]
        } else {
            [0.0, 0.0, 0.0]
        }
    }

    fn cross_vec3(a: [f32; 3], b: [f32; 3]) -> [f32; 3] {
        [
            a[1] * b[2] - a[2] * b[1],
            a[2] * b[0] - a[0] * b[2],
            a[0] * b[1] - a[1] * b[0],
        ]
    }

    fn dot_vec3(a: [f32; 3], b: [f32; 3]) -> f32 {
        a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
    }

    fn multiply_matrices(a: [[f32; 4]; 4], b: [[f32; 4]; 4]) -> [[f32; 4]; 4] {
        let mut result = [[0.0; 4]; 4];
        for i in 0..4 {
            for j in 0..4 {
                result[i][j] = a[i][0] * b[0][j] + a[i][1] * b[1][j] + a[i][2] * b[2][j] + a[i][3] * b[3][j];
            }
        }
        result
    }
    pub fn get_terrain_view_proj(&self) -> [[f32; 4]; 4] {
        [[0.0; 4]; 4] 
    }

    pub fn get_terrain_view_pos(&self) -> [f32; 3] {
        [0.0, 50.0, 500.0]
    }
}
