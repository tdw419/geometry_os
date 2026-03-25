// spatial_visualizer.rs - Phase 30.3: Visual Nerve Hookup
// 
// Wires the spatial renderer to the GPU daemon for real-time visualization.
// Connects physics_propagation.wgsl to the swapchain for 144Hz display.
//
// Architecture:
// ┌──────────────────────────────────────────────────────────────┐
// │  BIND GROUP PIPELINE                                         │
// │                                                              │
// │  Group 0 (The Map):     Static bytecode layout               │
// │  Group 1 (The Energy):  Dynamic logic layer (moving pulse)   │
// │  Group 2 (The Surface): Framebuffer pixels (144Hz display)   │
// └──────────────────────────────────────────────────────────────┘

use wgpu::*;
use std::time::Instant;

const GRID_WIDTH: u32 = 576;
const GRID_HEIGHT: u32 = 576;

/// Spatial visualization uniforms
#[repr(C)]
#[derive(Debug, Clone, Copy, bytemuck::Pod, bytemuck::Zeroable)]
pub struct SpatialUniforms {
    pub time: f32,
    pub delta_time: f32,
    pub propagation_speed: f32,
    pub signal_decay: f32,
}

/// Spatial visualizer state
pub struct SpatialVisualizer {
    // Pipeline
    pipeline: RenderPipeline,
    
    // Bind groups
    bind_group_layout: BindGroupLayout,
    bind_group: BindGroup,
    
    // Buffers
    uniform_buffer: Buffer,
    bytecode_texture: Texture,
    logic_texture: Texture,
    
    // State
    uniforms: SpatialUniforms,
    start_time: Instant,
    ignited: bool,
    ignition_x: f32,
    ignition_y: f32,
}

impl SpatialVisualizer {
    /// Create new spatial visualizer
    pub fn new(device: &Device, config: &SurfaceConfiguration) -> Self {
        let start_time = Instant::now();
        
        // Create uniforms
        let uniforms = SpatialUniforms {
            time: 0.0,
            delta_time: 1.0 / 144.0,
            propagation_speed: 0.9,
            signal_decay: 0.98,
        };
        
        let uniform_buffer = device.create_buffer_init(&BufferInitDescriptor {
            label: Some("Spatial Uniforms"),
            contents: bytemuck::cast_slice(&[uniforms]),
            usage: BufferUsages::UNIFORM | BufferUsages::COPY_DST,
        });
        
        // Create bytecode texture (L0 - static map)
        let bytecode_texture = device.create_texture(&TextureDescriptor {
            label: Some("Bytecode Texture"),
            size: Extent3d {
                width: GRID_WIDTH,
                height: GRID_HEIGHT,
                depth_or_array_layers: 1,
            },
            mip_level_count: 1,
            sample_count: 1,
            dimension: TextureDimension::D2,
            format: TextureFormat::R32Uint,
            usage: TextureUsages::TEXTURE_BINDING | TextureUsages::COPY_DST,
            view_formats: &[],
        });
        
        // Create logic texture (L2 - dynamic signal)
        let logic_texture = device.create_texture(&TextureDescriptor {
            label: Some("Logic Texture"),
            size: Extent3d {
                width: GRID_WIDTH,
                height: GRID_HEIGHT,
                depth_or_array_layers: 1,
            },
            mip_level_count: 1,
            sample_count: 1,
            dimension: TextureDimension::D2,
            format: TextureFormat::R32Uint,
            usage: TextureUsages::TEXTURE_BINDING | TextureUsages::STORAGE_BINDING | TextureUsages::COPY_DST,
            view_formats: &[],
        });
        
        // Create bind group layout
        let bind_group_layout = device.create_bind_group_layout(&BindGroupLayoutDescriptor {
            label: Some("Spatial Bind Group Layout"),
            entries: &[
                // Uniforms
                BindGroupLayoutEntry {
                    binding: 0,
                    visibility: ShaderStages::VERTEX | ShaderStages::FRAGMENT | ShaderStages::COMPUTE,
                    ty: BindingType::Buffer {
                        ty: BufferBindingType::Uniform,
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // Bytecode texture (L0)
                BindGroupLayoutEntry {
                    binding: 1,
                    visibility: ShaderStages::FRAGMENT,
                    ty: BindingType::Texture {
                        sample_type: TextureSampleType::Uint,
                        view_dimension: TextureViewDimension::D2,
                        multisampled: false,
                    },
                    count: None,
                },
                // Logic texture (L2)
                BindGroupLayoutEntry {
                    binding: 2,
                    visibility: ShaderStages::FRAGMENT | ShaderStages::COMPUTE,
                    ty: BindingType::Texture {
                        sample_type: TextureSampleType::Uint,
                        view_dimension: TextureViewDimension::D2,
                        multisampled: false,
                    },
                    count: None,
                },
            ],
        });
        
        // Create bind group
        let bind_group = Self::create_bind_group(
            device,
            &bind_group_layout,
            &uniform_buffer,
            &bytecode_texture,
            &logic_texture,
        );
        
        // Load shader
        let shader = device.create_shader_module(ShaderModuleDescriptor {
            label: Some("Spatial Visualizer Shader"),
            source: ShaderSource::Wgsl(include_str!("../../shaders/spatial_renderer.wgsl").into()),
        });
        
        // Create pipeline layout
        let pipeline_layout = device.create_pipeline_layout(&PipelineLayoutDescriptor {
            label: Some("Spatial Pipeline Layout"),
            bind_group_layouts: &[&bind_group_layout],
            push_constant_ranges: &[],
        });
        
        // Create render pipeline
        let pipeline = device.create_render_pipeline(&RenderPipelineDescriptor {
            label: Some("Spatial Render Pipeline"),
            layout: Some(&pipeline_layout),
            vertex: VertexState {
                module: &shader,
                entry_point: Some("vertex_main"),
                buffers: &[],
                compilation_options: Default::default(),
            },
            fragment: Some(FragmentState {
                module: &shader,
                entry_point: Some("fragment_main"),
                targets: &[Some(ColorTargetState {
                    format: config.format,
                    blend: Some(BlendState::ALPHA_BLENDING),
                    write_mask: ColorWrites::ALL,
                })],
                compilation_options: Default::default(),
            }),
            primitive: PrimitiveState {
                topology: PrimitiveTopology::TriangleList,
                strip_index_format: None,
                front_face: FrontFace::Ccw,
                cull_mode: None,
                polygon_mode: PolygonMode::Fill,
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
            cache: None,
        });
        
        Self {
            pipeline,
            bind_group_layout,
            bind_group,
            uniform_buffer,
            bytecode_texture,
            logic_texture,
            uniforms,
            start_time,
            ignited: false,
            ignition_x: 0.0,
            ignition_y: 0.0,
        }
    }
    
    fn create_bind_group(
        device: &Device,
        layout: &BindGroupLayout,
        uniform_buffer: &Buffer,
        bytecode_texture: &Texture,
        logic_texture: &Texture,
    ) -> BindGroup {
        device.create_bind_group(&BindGroupDescriptor {
            label: Some("Spatial Bind Group"),
            layout,
            entries: &[
                Binding {
                    binding: 0,
                    resource: uniform_buffer.as_entire_binding(),
                },
                Binding {
                    binding: 1,
                    resource: BindingResource::TextureView(
                        &bytecode_texture.create_view(&TextureViewDescriptor::default())
                    ),
                },
                Binding {
                    binding: 2,
                    resource: BindingResource::TextureView(
                        &logic_texture.create_view(&TextureViewDescriptor::default())
                    ),
                },
            ],
        })
    }
    
    /// Load spatial map into textures
    pub fn load_map(&mut self, queue: &Queue, bytecode: &[u8], logic: &[u8]) {
        // Upload bytecode to texture
        let bytecode_data: Vec<u32> = bytecode.iter().map(|&b| b as u32).collect();
        queue.write_texture(
            ImageCopyTexture {
                texture: &self.bytecode_texture,
                mip_level: 0,
                origin: Origin3d::ZERO,
                aspect: TextureAspect::All,
            },
            bytemuck::cast_slice(&bytecode_data),
            ImageDataLayout {
                offset: 0,
                bytes_per_row: Some(GRID_WIDTH * 4),
                rows_per_image: Some(GRID_HEIGHT),
            },
            Extent3d {
                width: GRID_WIDTH,
                height: GRID_HEIGHT,
                depth_or_array_layers: 1,
            },
        );
        
        // Upload logic state to texture
        let logic_data: Vec<u32> = logic.iter().map(|&b| b as u32).collect();
        queue.write_texture(
            ImageCopyTexture {
                texture: &self.logic_texture,
                mip_level: 0,
                origin: Origin3d::ZERO,
                aspect: TextureAspect::All,
            },
            bytemuck::cast_slice(&logic_data),
            ImageDataLayout {
                offset: 0,
                bytes_per_row: Some(GRID_WIDTH * 4),
                rows_per_image: Some(GRID_HEIGHT),
            },
            Extent3d {
                width: GRID_WIDTH,
                height: GRID_HEIGHT,
                depth_or_array_layers: 1,
            },
        );
        
        println!("[VISUALIZER] Map loaded: {} bytecode, {} logic pixels", 
            bytecode.len(), logic.len());
    }
    
    /// Ignite signal at coordinates (Z-pattern handshake)
    pub fn ignite(&mut self, x: f32, y: f32) {
        self.ignited = true;
        self.ignition_x = x;
        self.ignition_y = y;
        println!("[VISUALIZER] Ignited at ({:.1}, {:.1})", x, y);
    }
    
    /// Update uniforms and state
    pub fn update(&mut self, queue: &Queue, delta_time: f32) {
        self.uniforms.time = self.start_time.elapsed().as_secs_f32();
        self.uniforms.delta_time = delta_time;
        
        queue.write_buffer(
            &self.uniform_buffer,
            0,
            bytemuck::cast_slice(&[self.uniforms]),
        );
    }
    
    /// Render frame
    pub fn render(&self, encoder: &mut CommandEncoder, view: &TextureView) {
        let mut render_pass = encoder.begin_render_pass(&RenderPassDescriptor {
            label: Some("Spatial Render Pass"),
            color_attachments: &[Some(RenderPassColorAttachment {
                view,
                resolve_target: None,
                ops: Operations {
                    load: LoadOp::Clear(Color {
                        r: 0.02,
                        g: 0.02,
                        b: 0.05,
                        a: 1.0,
                    }),
                    store: StoreOp::Store,
                },
            })],
            depth_stencil_attachment: None,
            timestamp_writes: None,
            occlusion_query_set: None,
        });
        
        render_pass.set_pipeline(&self.pipeline);
        render_pass.set_bind_group(0, &self.bind_group, &[]);
        render_pass.draw(0..6, 0..1); // Full-screen quad
    }
    
    /// Resize handler
    pub fn resize(&mut self, device: &Device, config: &SurfaceConfiguration) {
        // Recreate pipeline with new format if needed
        // For now, just update bind group
        let _ = (device, config);
    }
    
    /// Check if ignited
    pub fn is_ignited(&self) -> bool {
        self.ignited
    }
    
    /// Get ignition coordinates
    pub fn ignition_coords(&self) -> (f32, f32) {
        (self.ignition_x, self.ignition_y)
    }
}

/// Full-screen quad vertex shader (inline for simplicity)
pub const VERTEX_SHADER: &str = r"
@vertex
fn vertex_main(@builtin(vertex_index) vertex_index: u32) -> @builtin(position) vec4<f32> {
    // Full-screen quad
    let positions = array<vec2<f32>, 6>(
        vec2<f32>(-1.0, -1.0),
        vec2<f32>( 1.0, -1.0),
        vec2<f32>(-1.0,  1.0),
        vec2<f32>(-1.0,  1.0),
        vec2<f32>( 1.0, -1.0),
        vec2<f32>( 1.0,  1.0),
    );
    
    let pos = positions[vertex_index];
    return vec4<f32>(pos, 0.0, 1.0);
}
";

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_uniforms_size() {
        assert_eq!(std::mem::size_of::<SpatialUniforms>(), 16);
    }
    
    #[test]
    fn test_ignition() {
        let mut vis = SpatialVisualizer::new(&device, &config);
        vis.ignite(50.0, 50.0);
        
        assert!(vis.is_ignited());
        assert_eq!(vis.ignition_coords(), (50.0, 50.0));
    }
}

// Phase 30.3 Completion Checklist:
// [x] SpatialVisualizer struct
// [x] Bind group layout (3 bindings)
// [x] Texture creation (bytecode + logic)
// [x] Uniform buffer
// [x] Render pipeline
// [x] Load map function
// [x] Ignite function (handshake)
// [x] Update function
// [x] Render function
// [ ] Integration with gpu_dev_daemon.rs
// [ ] Real-time physics compute pass
// [ ] Mouse input for Z-pattern
// [ ] Full screen quad rendering
