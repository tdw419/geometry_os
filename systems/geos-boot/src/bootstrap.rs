//! Frozen Bootstrap Core
//!
//! The main GPU initialization and event loop structure.
//! This code is FROZEN after initial development.

use std::sync::Arc;
use std::time::Instant;

use bytemuck::{Pod, Zeroable};
use log::{error, info};
use winit::{
    dpi::{LogicalSize, PhysicalSize},
    event::{ElementState, MouseButton, MouseScrollDelta, WindowEvent},
    event_loop::{ControlFlow, EventLoop},
    keyboard::{ModifiersState, PhysicalKey},
    window::{Window, WindowBuilder},
};

use crate::adapter_selector::AdapterSelector;
use crate::gpu_requirements::validate_gpu;
use crate::io_contract::{Event as GeosEvent, EventsBuffer, PROGRAM_MEMORY_OFFSET, TOTAL_IO_SIZE};
use crate::glyph_loader::GlyphProgram;

/// Render uniforms for viewport
#[repr(C)]
#[derive(Clone, Copy, Pod, Zeroable)]
struct RenderUniforms {
    viewport_width: f32,
    viewport_height: f32,
    time: f32,
    _padding: f32,
}

/// The frozen bootstrap - handles GPU init and event forwarding
pub struct FrozenBootstrap {
    _window: Arc<Window>,
    device: wgpu::Device,
    queue: wgpu::Queue,
    surface: wgpu::Surface<'static>,
    surface_config: wgpu::SurfaceConfiguration,

    compute_pipeline: wgpu::ComputePipeline,
    render_pipeline: wgpu::RenderPipeline,

    vm_buffer: wgpu::Buffer,
    events_buffer: wgpu::Buffer,
    render_uniforms: wgpu::Buffer,

    compute_bind_group: wgpu::BindGroup,
    render_bind_group: wgpu::BindGroup,

    start_time: Instant,
    window_size: PhysicalSize<u32>,
    events: EventsBuffer,
}

impl FrozenBootstrap {
    pub async fn new(window: Arc<Window>, program: Option<GlyphProgram>) -> Self {
        info!("Initializing Geos-Boot...");

        // Create instance and surface
        let selector = AdapterSelector::new();
        let surface = selector.instance()
            .create_surface(window.clone())
            .expect("Failed to create surface");

        // Select and validate adapter
        let adapter = selector.select_adapter(&surface);
        validate_gpu(&adapter).unwrap_or_else(|e| {
            error!("{}", e);
            panic!("GPU validation failed");
        });

        // Request device
        let mut limits = adapter.limits();
        limits.max_storage_buffer_binding_size = limits.max_storage_buffer_binding_size.min(2_000_000_000);
        limits.max_buffer_size = limits.max_buffer_size.min(2_000_000_000);

        let (device, queue) = adapter
            .request_device(&wgpu::DeviceDescriptor {
                label: Some("Geos-Boot Device"),
                required_features: wgpu::Features::empty(),
                required_limits: limits,
                ..Default::default()
            }, None)
            .await
            .expect("Failed to create device");

        // Configure surface
        let surface_caps = surface.get_capabilities(&adapter);
        let surface_format = surface_caps.formats.iter()
            .copied()
            .find(|f| f.is_srgb())
            .unwrap_or(surface_caps.formats[0]);

        let size = window.inner_size();
        let surface_config = wgpu::SurfaceConfiguration {
            usage: wgpu::TextureUsages::RENDER_ATTACHMENT,
            format: surface_format,
            width: size.width.max(1),
            height: size.height.max(1),
            present_mode: wgpu::PresentMode::Fifo,
            alpha_mode: surface_caps.alpha_modes[0],
            view_formats: vec![],
            desired_maximum_frame_latency: 1,
        };
        surface.configure(&device, &surface_config);

        // Create buffers
        let vm_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("VM Memory"),
            size: TOTAL_IO_SIZE,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        let events_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Events Buffer"),
            size: std::mem::size_of::<EventsBuffer>() as u64,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let render_uniforms = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Render Uniforms"),
            size: std::mem::size_of::<RenderUniforms>() as u64,
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // Load program if provided
        if let Some(prog) = &program {
            let bytes = prog.as_bytes();
            queue.write_buffer(&vm_buffer, PROGRAM_MEMORY_OFFSET, &bytes);
            info!("Loaded {} words into VM memory at 0x{:X}", prog.word_count(), PROGRAM_MEMORY_OFFSET);
        }

        // Create pipelines
        let (compute_pipeline, render_pipeline, compute_bind_group, render_bind_group) =
            Self::create_pipelines(&device, &vm_buffer, &events_buffer, &render_uniforms, surface_format);

        info!("Geos-Boot initialized");

        Self {
            _window: window,
            device,
            queue,
            surface,
            surface_config,
            compute_pipeline,
            render_pipeline,
            vm_buffer,
            events_buffer,
            render_uniforms,
            compute_bind_group,
            render_bind_group,
            start_time: Instant::now(),
            window_size: size,
            events: EventsBuffer::new(),
        }
    }

    fn create_pipelines(
        device: &wgpu::Device,
        vm_buffer: &wgpu::Buffer,
        events_buffer: &wgpu::Buffer,
        render_uniforms: &wgpu::Buffer,
        surface_format: wgpu::TextureFormat,
    ) -> (wgpu::ComputePipeline, wgpu::RenderPipeline, wgpu::BindGroup, wgpu::BindGroup) {
        // Load WGSL shaders from files
        let compute_shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Glyph VM Compute"),
            source: wgpu::ShaderSource::Wgsl(include_str!("../shaders/glyph_vm_compute.wgsl").into()),
        });

        let render_shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Glyph VM Render"),
            source: wgpu::ShaderSource::Wgsl(include_str!("../shaders/glyph_vm_render.wgsl").into()),
        });

        // Bind group layouts
        let compute_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Compute Layout"),
            entries: &[
                wgpu::BindGroupLayoutEntry {
                    binding: 0,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
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
            ],
        });

        let render_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Render Layout"),
            entries: &[
                wgpu::BindGroupLayoutEntry {
                    binding: 0,
                    visibility: wgpu::ShaderStages::VERTEX | wgpu::ShaderStages::FRAGMENT,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: true },
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

        // Bind groups
        let compute_bind_group = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Compute Bind Group"),
            layout: &compute_layout,
            entries: &[
                wgpu::BindGroupEntry { binding: 0, resource: vm_buffer.as_entire_binding() },
                wgpu::BindGroupEntry { binding: 1, resource: events_buffer.as_entire_binding() },
            ],
        });

        let render_bind_group = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Render Bind Group"),
            layout: &render_layout,
            entries: &[
                wgpu::BindGroupEntry { binding: 0, resource: vm_buffer.as_entire_binding() },
                wgpu::BindGroupEntry { binding: 1, resource: render_uniforms.as_entire_binding() },
            ],
        });

        // Pipelines
        let compute_pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Compute Pipeline Layout"),
            bind_group_layouts: &[&compute_layout],
            push_constant_ranges: &[],
        });

        let compute_pipeline = device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("Glyph VM Compute Pipeline"),
            layout: Some(&compute_pipeline_layout),
            module: &compute_shader,
            entry_point: "main",
        });

        let render_pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Render Pipeline Layout"),
            bind_group_layouts: &[&render_layout],
            push_constant_ranges: &[],
        });

        let render_pipeline = device.create_render_pipeline(&wgpu::RenderPipelineDescriptor {
            label: Some("Glyph VM Render Pipeline"),
            layout: Some(&render_pipeline_layout),
            vertex: wgpu::VertexState {
                module: &render_shader,
                entry_point: "vs_main",
                buffers: &[],
            },
            primitive: wgpu::PrimitiveState::default(),
            depth_stencil: None,
            multisample: wgpu::MultisampleState::default(),
            fragment: Some(wgpu::FragmentState {
                module: &render_shader,
                entry_point: "fs_main",
                targets: &[Some(wgpu::ColorTargetState {
                    format: surface_format,
                    blend: Some(wgpu::BlendState::ALPHA_BLENDING),
                    write_mask: wgpu::ColorWrites::ALL,
                })],
            }),
            multiview: None,
        });

        (compute_pipeline, render_pipeline, compute_bind_group, render_bind_group)
    }

    pub fn dispatch_compute(&mut self) {
        let mut encoder = self.device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
            label: Some("Compute Encoder"),
        });

        {
            let mut pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                label: Some("Glyph VM Compute Pass"),
                timestamp_writes: None,
            });
            pass.set_pipeline(&self.compute_pipeline);
            pass.set_bind_group(0, &self.compute_bind_group, &[]);
            pass.dispatch_workgroups(1, 1, 1);
        }

        self.queue.submit(Some(encoder.finish()));
    }

    pub fn render(&mut self) {
        // Update uniforms
        let uniforms = RenderUniforms {
            viewport_width: self.window_size.width.max(1) as f32,
            viewport_height: self.window_size.height.max(1) as f32,
            time: self.start_time.elapsed().as_secs_f32(),
            _padding: 0.0,
        };
        self.queue.write_buffer(&self.render_uniforms, 0, bytemuck::bytes_of(&uniforms));

        // Flush events to GPU
        self.queue.write_buffer(&self.events_buffer, 0, self.events.as_bytes());
        self.events.clear();

        // Render
        let output = match self.surface.get_current_texture() {
            Ok(tex) => tex,
            Err(wgpu::SurfaceError::Lost) => {
                self.surface.configure(&self.device, &self.surface_config);
                return;
            }
            Err(e) => {
                error!("Surface error: {:?}", e);
                return;
            }
        };

        let view = output.texture.create_view(&wgpu::TextureViewDescriptor::default());
        let mut encoder = self.device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
            label: Some("Render Encoder"),
        });

        {
            let mut pass = encoder.begin_render_pass(&wgpu::RenderPassDescriptor {
                label: Some("Glyph VM Render Pass"),
                color_attachments: &[Some(wgpu::RenderPassColorAttachment {
                    view: &view,
                    resolve_target: None,
                    ops: wgpu::Operations {
                        load: wgpu::LoadOp::Clear(wgpu::Color { r: 0.05, g: 0.06, b: 0.08, a: 1.0 }),
                        store: wgpu::StoreOp::Store,
                    },
                })],
                depth_stencil_attachment: None,
                timestamp_writes: None,
                occlusion_query_set: None,
            });
            pass.set_pipeline(&self.render_pipeline);
            pass.set_bind_group(0, &self.render_bind_group, &[]);
            pass.draw(0..3, 0..1);
        }

        self.queue.submit(Some(encoder.finish()));
        output.present();
    }

    pub fn push_event(&mut self, event: GeosEvent) {
        self.events.push(event);
    }

    pub fn resize(&mut self, size: PhysicalSize<u32>) {
        if size.width == 0 || size.height == 0 {
            return;
        }
        self.window_size = size;
        self.surface_config.width = size.width;
        self.surface_config.height = size.height;
        self.surface.configure(&self.device, &self.surface_config);
    }
}

/// Run the frozen bootstrap with optional program
pub fn run(program: Option<GlyphProgram>) {
    env_logger::Builder::from_default_env()
        .filter_level(log::LevelFilter::Info)
        .init();

    info!("Geos-Boot v{} starting", crate::GEOS_BOOT_VERSION);

    let event_loop = EventLoop::new().expect("Failed to create event loop");
    let window = Arc::new(
        WindowBuilder::new()
            .with_title("Geometry OS - Glyph VM")
            .with_inner_size(LogicalSize::new(1200, 800))
            .build(&event_loop)
            .expect("Failed to create window"),
    );

    let mut bootstrap = pollster::block_on(FrozenBootstrap::new(window.clone(), program));
    let window_id = window.id();
    let mut modifiers = ModifiersState::empty();

    event_loop.run(move |event, target| {
        target.set_control_flow(ControlFlow::Wait);

        match event {
            winit::event::Event::WindowEvent { window_id: id, event } if id == window_id => {
                match event {
                    WindowEvent::CloseRequested => target.exit(),
                    WindowEvent::Resized(size) => bootstrap.resize(size),
                    WindowEvent::ModifiersChanged(state) => modifiers = state.state(),
                    WindowEvent::CursorMoved { position, .. } => {
                        bootstrap.push_event(GeosEvent::mouse_move(
                            position.x as f32,
                            position.y as f32,
                            bootstrap.window_size.width as f32,
                            bootstrap.window_size.height as f32,
                        ));
                    }
                    WindowEvent::MouseInput { state, button, .. } => {
                        let btn = match button {
                            MouseButton::Left => 0,
                            MouseButton::Right => 1,
                            MouseButton::Middle => 2,
                            _ => 3,
                        };
                        bootstrap.push_event(GeosEvent::mouse_button(btn, state == ElementState::Pressed));
                    }
                    WindowEvent::MouseWheel { delta, .. } => {
                        let dy = match delta {
                            MouseScrollDelta::LineDelta(_, y) => y,
                            MouseScrollDelta::PixelDelta(p) => p.y as f32 / 60.0,
                        };
                        bootstrap.push_event(GeosEvent::scroll(dy));
                    }
                    WindowEvent::KeyboardInput { event, .. } if !event.repeat => {
                        if let PhysicalKey::Code(code) = event.physical_key {
                            let mods = modifiers_to_bits(modifiers);
                            bootstrap.push_event(GeosEvent::keyboard(code as u32, mods));
                        }
                    }
                    WindowEvent::RedrawRequested => {
                        bootstrap.dispatch_compute();
                        bootstrap.render();
                    }
                    _ => {}
                }
            }
            winit::event::Event::AboutToWait => {
                window.request_redraw();
            }
            _ => {}
        }
    }).expect("Event loop error");
}

fn modifiers_to_bits(modifiers: ModifiersState) -> u32 {
    let mut bits = 0u32;
    if modifiers.control_key() { bits |= 1; }
    if modifiers.shift_key() { bits |= 2; }
    if modifiers.alt_key() { bits |= 4; }
    bits
}
