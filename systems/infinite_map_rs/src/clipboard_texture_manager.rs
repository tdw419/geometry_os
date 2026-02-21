#![allow(dead_code, unused_imports, unused_variables)]
//! Phase 31.2: Clipboard Texture Manager
//!
//! Manages clipboard.rts texture rendering on the infinite map.
//! The clipboard becomes a visible "data-noise" artifact with cyberpunk aesthetic.

use std::path::Path;
use wgpu::{
    Device, Queue, Sampler, BindGroup, BindGroupLayout,
    Texture, TextureView,
    TextureDescriptor, TextureDimension, TextureFormat, TextureUsages,
    Extent3d, TextureViewDescriptor, SamplerDescriptor, BindGroupDescriptor, BindGroupEntry,
    Buffer, BufferDescriptor, BufferUsages,
};
use std::fs;

/// Clipboard texture manager
pub struct ClipboardTextureManager {
    /// Clipboard texture
    texture: Option<Texture>,
    /// Clipboard texture view
    texture_view: Option<TextureView>,
    /// Clipboard sampler
    sampler: Sampler,
    /// Clipboard bind group
    bind_group: Option<BindGroup>,
    /// Bind group layout
    bind_group_layout: std::sync::Arc<BindGroupLayout>,
    /// Uniform buffer
    uniform_buffer: Buffer,
    /// Clipboard file path
    clipboard_path: String,
    /// Last modified time (for hot-reloading)
    last_modified: Option<std::time::SystemTime>,
}

/// Clipboard uniforms
#[repr(C)]
#[derive(Debug, Copy, Clone, bytemuck::Pod, bytemuck::Zeroable)]
struct ClipboardUniforms {
    screen_pos: [f32; 2],
    screen_size: [f32; 2],
    texture_size: [f32; 2],
    time: f32,
    opacity: f32,
    active: f32,
}

impl ClipboardTextureManager {
    /// Create new clipboard texture manager
    pub fn new(
        device: &Device,
        queue: &Queue,
        bind_group_layout: std::sync::Arc<BindGroupLayout>,
        clipboard_path: Option<String>,
    ) -> Self {
        let clipboard_path = clipboard_path.unwrap_or_else(|| {
            std::env::var("GEOMETRY_OS_CLIPBOARD_DIR")
                .unwrap_or_else(|_| "/tmp/geometry_os/clipboard".to_string())
        });

        let clipboard_file = Path::new(&clipboard_path).join("clipboard.rts");
        let clipboard_path_str = clipboard_file.to_string_lossy().to_string();

        // Create uniform buffer
        let uniform_buffer = device.create_buffer(&BufferDescriptor {
            label: Some("clipboard_uniform_buffer"),
            size: std::mem::size_of::<ClipboardUniforms>() as u64,
            usage: BufferUsages::UNIFORM | BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // Create sampler
        let sampler = device.create_sampler(&SamplerDescriptor {
            address_mode_u: wgpu::AddressMode::ClampToEdge,
            address_mode_v: wgpu::AddressMode::ClampToEdge,
            address_mode_w: wgpu::AddressMode::ClampToEdge,
            mag_filter: wgpu::FilterMode::Nearest,
            min_filter: wgpu::FilterMode::Nearest,
            mipmap_filter: wgpu::FilterMode::Nearest,
            ..Default::default()
        });

        let mut manager = Self {
            texture: None,
            texture_view: None,
            bind_group: None,
            bind_group_layout,
            uniform_buffer,
            sampler,
            clipboard_path: clipboard_path_str,
            last_modified: None,
        };

        // Try to load clipboard texture
        if let Err(e) = manager.load_texture(device, queue) {
            log::warn!("Failed to load clipboard texture: {}", e);
        }

        manager
    }

    /// Load clipboard texture from file
    pub fn load_texture(&mut self, device: &Device, queue: &Queue) -> Result<(), String> {
        let clipboard_path = Path::new(&self.clipboard_path);

        // Check if file exists
        if !clipboard_path.exists() {
            log::debug!("Clipboard file not found: {}", self.clipboard_path);
            return Ok(());
        }

        // Check if file was modified
        if let Ok(metadata) = fs::metadata(&clipboard_path) {
            if let Ok(modified) = metadata.modified() {
                if let Some(last_modified) = self.last_modified {
                    if modified <= last_modified {
                        // File not modified, skip reload
                        return Ok(());
                    }
                }
                self.last_modified = Some(modified);
            }
        }

        log::info!("Loading clipboard texture: {}", self.clipboard_path);

        // Load image using image crate
        let image_data = fs::read(&clipboard_path)
            .map_err(|e| format!("Failed to read clipboard file: {}", e))?;

        // Parse PNG
        let image = image::load_from_memory(&image_data)
            .map_err(|e| format!("Failed to parse clipboard image: {}", e))?;

        let rgba = image.to_rgba8();
        let dimensions = rgba.dimensions();

        // Create texture
        let texture = device.create_texture(&TextureDescriptor {
            label: Some("clipboard_texture"),
            size: Extent3d {
                width: dimensions.0,
                height: dimensions.1,
                depth_or_array_layers: 1,
            },
            mip_level_count: 1,
            sample_count: 1,
            dimension: TextureDimension::D2,
            format: TextureFormat::Rgba8UnormSrgb,
            usage: TextureUsages::TEXTURE_BINDING | TextureUsages::COPY_DST,
            view_formats: &[],
        });

        // Upload texture data
        queue.write_texture(
            wgpu::ImageCopyTexture {
                texture: &texture,
                mip_level: 0,
                origin: wgpu::Origin3d::ZERO,
                aspect: wgpu::TextureAspect::All,
            },
            &rgba,
            wgpu::ImageDataLayout {
                offset: 0,
                bytes_per_row: Some(dimensions.0 * 4),
                rows_per_image: Some(dimensions.1),
            },
            Extent3d {
                width: dimensions.0,
                height: dimensions.1,
                depth_or_array_layers: 1,
            },
        );

        // Create texture view
        let texture_view = texture.create_view(&TextureViewDescriptor::default());

        // Update uniform buffer
        let uniforms = ClipboardUniforms {
            screen_pos: [0.0, 0.0], // Will be updated during render
            screen_size: [dimensions.0 as f32, dimensions.1 as f32],
            texture_size: [dimensions.0 as f32, dimensions.1 as f32],
            time: 0.0, // Will be updated during render
            opacity: 0.8,
            active: 1.0,
        };

        queue.write_buffer(&self.uniform_buffer, 0, bytemuck::bytes_of(&uniforms));

        // Create bind group
        let bind_group = device.create_bind_group(&BindGroupDescriptor {
            label: Some("clipboard_bind_group"),
            layout: &self.bind_group_layout,
            entries: &[
                BindGroupEntry {
                    binding: 0,
                    resource: wgpu::BindingResource::TextureView(&texture_view),
                },
                BindGroupEntry {
                    binding: 1,
                    resource: wgpu::BindingResource::Sampler(&self.sampler),
                },
            ],
        });

        self.texture = Some(texture);
        self.texture_view = Some(texture_view);
        self.bind_group = Some(bind_group);

        log::info!("✅ Clipboard texture loaded: {}x{}", dimensions.0, dimensions.1);

        Ok(())
    }

    /// Update clipboard uniforms
    pub fn update_uniforms(&self, queue: &Queue, screen_pos: [f32; 2], time: f32) {
        if let (Some(texture_view), Some(bind_group)) = (&self.texture_view, &self.bind_group) {
            // Get texture size
            let texture_size = match &self.texture {
                Some(tex) => [tex.width() as f32, tex.height() as f32],
                None => [64.0, 64.0], // Default size
            };

            let uniforms = ClipboardUniforms {
                screen_pos,
                screen_size: [1920.0, 1080.0], // Will be updated from renderer
                texture_size,
                time,
                opacity: 0.8,
                active: 1.0,
            };

            queue.write_buffer(&self.uniform_buffer, 0, bytemuck::bytes_of(&uniforms));
        }
    }

    /// Get clipboard bind group
    pub fn get_bind_group(&self) -> Option<&BindGroup> {
        self.bind_group.as_ref()
    }

    /// Check if clipboard texture is loaded
    pub fn is_loaded(&self) -> bool {
        self.texture.is_some()
    }

    /// Get clipboard texture size
    pub fn get_size(&self) -> Option<(u32, u32)> {
        self.texture.as_ref().map(|tex| (tex.width(), tex.height()))
    }
}
