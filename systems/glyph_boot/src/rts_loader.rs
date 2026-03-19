//! RTS Texture Loader - Loads .rts.png glyph programs into GPU textures
//!
//! The .rts.png format encodes glyph instructions as RGBA pixels:
//!   R = opcode
//!   G = stratum
//!   B = p1 (parameter 1)
//!   A = p2 (parameter 2)

use anyhow::Result;

/// RTS Texture Loader
pub struct RtsLoader {
    /// GPU texture containing the glyph program
    pub texture: wgpu::Texture,

    /// Texture dimensions
    width: u32,
    height: u32,

    /// Instruction count (non-transparent pixels)
    instruction_count: u32,
}

impl RtsLoader {
    /// Load a .rts.png file into a GPU texture
    pub fn load(device: &wgpu::Device, queue: &wgpu::Queue, path: &str) -> Result<Self> {
        // Load image
        let img = image::open(path)?;
        let rgba = img.to_rgba8();
        let (width, height) = rgba.dimensions();

        log::info!("[RTS] Loaded image: {}x{} ({} bytes)", width, height, rgba.len());

        // Count non-transparent pixels (instructions)
        let instruction_count = rgba.pixels()
            .filter(|p| p.0[3] > 0) // Alpha > 0
            .count() as u32;

        // Create GPU texture
        let texture = device.create_texture(&wgpu::TextureDescriptor {
            label: Some(&format!("RTS Texture: {}", path)),
            size: wgpu::Extent3d {
                width,
                height,
                depth_or_array_layers: 1,
            },
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8Uint,
            usage: wgpu::TextureUsages::TEXTURE_BINDING
                 | wgpu::TextureUsages::COPY_DST
                 | wgpu::TextureUsages::STORAGE_BINDING,
            view_formats: &[],
        });

        // Write image data to texture
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
                bytes_per_row: Some(width * 4),
                rows_per_image: Some(height),
            },
            wgpu::Extent3d {
                width,
                height,
                depth_or_array_layers: 1,
            },
        );

        log::info!("[RTS] Uploaded to GPU: {} instructions", instruction_count);

        Ok(Self {
            texture,
            width,
            height,
            instruction_count,
        })
    }

    /// Get texture width
    pub fn width(&self) -> u32 {
        self.width
    }

    /// Get texture height
    pub fn height(&self) -> u32 {
        self.height
    }

    /// Get instruction count
    pub fn instruction_count(&self) -> u32 {
        self.instruction_count
    }
}
