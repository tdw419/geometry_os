//! GlyphRenderer - Hardware-accelerated blitting for the Native Glyph Shell.
//!
//! This module manages the WGPU pipeline for rendering glyphs from the 
//! GlyphAtlas onto the GlyphSubstrate.
//!
//! Supports two rendering modes:
//! - Fullscreen: Renders substrate covering entire viewport
//! - Positioned: Renders substrate at specific screen position (for text overlays)

use wgpu::util::DeviceExt;
use crate::glyph_substrate::GlyphSubstrate;

/// Uniform buffer structure for glyph rendering
/// Must match GlyphUniforms in glyph_shell.wgsl
#[repr(C)]
#[derive(Copy, Clone, bytemuck::Pod, bytemuck::Zeroable)]
pub struct GlyphUniforms {
    /// Screen position in pixels (top-left corner)
    pub position: [f32; 2],
    /// Size in pixels
    pub size: [f32; 2],
    /// Screen dimensions for NDC conversion
    pub screen_size: [f32; 2],
    /// 1.0 for positioned mode, 0.0 for fullscreen
    pub positioned: f32,
    /// Padding for 16-byte alignment
    pub _pad: f32,
}

impl GlyphUniforms {
    /// Create fullscreen uniforms (backward compatibility)
    pub fn fullscreen(screen_width: f32, screen_height: f32) -> Self {
        Self {
            position: [0.0, 0.0],
            size: [screen_width, screen_height],
            screen_size: [screen_width, screen_height],
            positioned: 0.0,
            _pad: 0.0,
        }
    }
    
    /// Create positioned uniforms for text overlay
    pub fn positioned(x: f32, y: f32, width: f32, height: f32, screen_width: f32, screen_height: f32) -> Self {
        Self {
            position: [x, y],
            size: [width, height],
            screen_size: [screen_width, screen_height],
            positioned: 1.0,
            _pad: 0.0,
        }
    }
}

pub struct GlyphRenderer {
    pipeline: wgpu::RenderPipeline,
    bind_group: wgpu::BindGroup,
    bind_group_layout: wgpu::BindGroupLayout,
    substrate_buffer: wgpu::Buffer,
    uniform_buffer: wgpu::Buffer,
}

impl GlyphRenderer {
    pub fn new(device: &wgpu::Device, format: wgpu::TextureFormat, substrate: &GlyphSubstrate) -> Self {
        // Create the substrate buffer for GPU access
        let substrate_buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("Glyph Substrate Buffer"),
            contents: bytemuck::cast_slice(substrate.buffer()),
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_SRC | wgpu::BufferUsages::COPY_DST,
        });

        // Create uniform buffer with default fullscreen settings
        let uniforms = GlyphUniforms::fullscreen(1024.0, 768.0);
        let uniform_buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("Glyph Uniform Buffer"),
            contents: bytemuck::cast_slice(&[uniforms]),
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
        });

        // Load the specialized Glyph Shader (WGSL)
        let shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Glyph Shader"),
            source: wgpu::ShaderSource::Wgsl(include_str!("../shaders/glyph_shell.wgsl").into()),
        });

        // Create Bind Group Layout
        let bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Glyph Bind Group Layout"),
            entries: &[
                // Binding 0: Substrate storage buffer
                wgpu::BindGroupLayoutEntry {
                    binding: 0,
                    visibility: wgpu::ShaderStages::FRAGMENT,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: true },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // Binding 1: Uniform buffer
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

        // Create Bind Group
        let bind_group = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Glyph Bind Group"),
            layout: &bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: substrate_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: uniform_buffer.as_entire_binding(),
                },
            ],
        });

        let render_pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Glyph Pipeline Layout"),
            bind_group_layouts: &[&bind_group_layout],
            push_constant_ranges: &[],
        });

        // Use alpha blending for text overlays
        let blend = wgpu::BlendState {
            color: wgpu::BlendComponent {
                src_factor: wgpu::BlendFactor::SrcAlpha,
                dst_factor: wgpu::BlendFactor::OneMinusSrcAlpha,
                operation: wgpu::BlendOperation::Add,
            },
            alpha: wgpu::BlendComponent {
                src_factor: wgpu::BlendFactor::One,
                dst_factor: wgpu::BlendFactor::OneMinusSrcAlpha,
                operation: wgpu::BlendOperation::Add,
            },
        };

        let pipeline = device.create_render_pipeline(&wgpu::RenderPipelineDescriptor {
            label: Some("Glyph Render Pipeline"),
            layout: Some(&render_pipeline_layout),
            vertex: wgpu::VertexState {
                module: &shader,
                entry_point: "vs_main",
                buffers: &[],
            },
            fragment: Some(wgpu::FragmentState {
                module: &shader,
                entry_point: "fs_main",
                targets: &[Some(wgpu::ColorTargetState {
                    format,
                    blend: Some(blend),
                    write_mask: wgpu::ColorWrites::ALL,
                })],
            }),
            primitive: wgpu::PrimitiveState::default(),
            depth_stencil: None,
            multisample: wgpu::MultisampleState::default(),
            multiview: None,
        });

        Self {
            pipeline,
            bind_group,
            bind_group_layout,
            substrate_buffer,
            uniform_buffer,
        }
    }

    /// Update the substrate buffer contents
    pub fn update_substrate(&self, queue: &wgpu::Queue, substrate: &GlyphSubstrate) {
        queue.write_buffer(&self.substrate_buffer, 0, bytemuck::cast_slice(substrate.buffer()));
    }

    /// Update the position/size uniforms for positioned rendering
    pub fn set_position(&self, queue: &wgpu::Queue, uniforms: GlyphUniforms) {
        queue.write_buffer(&self.uniform_buffer, 0, bytemuck::cast_slice(&[uniforms]));
    }
    
    /// Helper to create positioned uniforms
    pub fn create_positioned_uniforms(
        x: f32, y: f32, width: f32, height: f32,
        screen_width: f32, screen_height: f32
    ) -> GlyphUniforms {
        GlyphUniforms::positioned(x, y, width, height, screen_width, screen_height)
    }

    /// Render the glyph substrate
    pub fn render<'a>(&'a self, render_pass: &mut wgpu::RenderPass<'a>) {
        render_pass.set_pipeline(&self.pipeline);
        render_pass.set_bind_group(0, &self.bind_group, &[]);
        render_pass.draw(0..4, 0..1); // Draw a quad (2 triangles = 4 vertices)
    }
    
    /// Get the bind group layout (for recreating bind groups if needed)
    pub fn bind_group_layout(&self) -> &wgpu::BindGroupLayout {
        &self.bind_group_layout
    }
}
