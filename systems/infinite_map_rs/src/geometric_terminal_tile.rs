//! Geometric Terminal Tile - Phase 30.11
//!
//! A fully GPU-native terminal tile that uses PixelRTS v3 for both
//! logic execution and rendering.

use std::sync::Arc;
use wgpu;
use crate::gpu::geometric_vm::{GeometricVM, GeometricState};
use crate::terminal_clone::terminal_renderer::TerminalRenderer;
use crate::terminal_clone::geometric_bridge::GeometricTerminalBuffer;

pub struct GeometricTerminalTile {
    pub id: usize,
    pub vm: GeometricVM,
    pub renderer: TerminalRenderer,
    pub buffer: GeometricTerminalBuffer,
    pub output_texture: wgpu::Texture,
    pub output_view: wgpu::TextureView,
    pub cols: u32,
    pub rows: u32,
    pub needs_update: bool,
}

impl GeometricTerminalTile {
    pub fn new(device: Arc<wgpu::Device>, queue: Arc<wgpu::Queue>, id: usize, cols: u32, rows: u32) -> Self {
        let grid_size = 256; // RAM size for GeometricVM
        let vm = GeometricVM::new(Arc::clone(&device), Arc::clone(&queue), grid_size);
        let renderer = TerminalRenderer::new(&device);
        let buffer = GeometricTerminalBuffer::new(cols as usize, rows as usize);

        // Create output texture for final glyph rendering
        let char_w = 8;
        let char_h = 16;
        let tw = cols * char_w;
        let th = rows * char_h;

        let texture_desc = wgpu::TextureDescriptor {
            label: Some("Geometric Terminal Output"),
            size: wgpu::Extent3d {
                width: tw,
                height: th,
                depth_or_array_layers: 1,
            },
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8Unorm,
            usage: wgpu::TextureUsages::TEXTURE_BINDING | wgpu::TextureUsages::STORAGE_BINDING | wgpu::TextureUsages::COPY_SRC,
            view_formats: &[],
        };
        let output_texture = device.create_texture(&texture_desc);
        let output_view = output_texture.create_view(&wgpu::TextureViewDescriptor::default());

        Self {
            id,
            vm,
            renderer,
            buffer,
            output_texture,
            output_view,
            cols,
            rows,
            needs_update: true,
        }
    }

    /// Push characters to the geometric terminal
    pub fn write(&mut self, text: &str) {
        let instructions = self.buffer.generate_pasm(text);
        self.vm.upload_program(&instructions);
        self.needs_update = true;
    }

    /// Run logic and render
    pub fn update(&mut self, device: &wgpu::Device, encoder: &mut wgpu::CommandEncoder, time: f32) {
        if !self.needs_update {
            return;
        }

        // 1. Execute Geometric VM (Run PUTC/MVCR instructions)
        // We execute N steps where N is the number of characters uploaded
        // For simplicity, let's just step 100 times.
        self.vm.step(encoder, 100);

        // 2. Render State to Glyphs
        let ram_view = self.vm.ram_texture.create_view(&wgpu::TextureViewDescriptor::default());
        
        self.renderer.render(
            device,
            encoder,
            &self.output_view,
            self.rows,
            self.cols,
            &ram_view,
            0, // cursor_x (placeholder)
            0, // cursor_y (placeholder)
            time,
        );

        self.needs_update = false;
    }
}
