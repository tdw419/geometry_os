// ============================================
// GEOMETRY OS - FLASH TEXTURE LOADER
// Architecture: Flash movies as executable textures
//
// Implementation Strategy:
// - Phase 1: Texture infrastructure (this file)
// - Phase 2: Ruffle desktop IPC (external process)
// - Phase 3: In-process Ruffle integration
// ============================================

use std::sync::{Arc, Mutex};
use std::path::Path;
use std::process::Command;
use wgpu::util::DeviceExt;

/// Flash movie rendered as a texture on the infinite map
///
/// This represents SWF content as a first-class executable citizen
/// in Geometry OS - living as a texture that can be placed anywhere
/// on the infinite canvas.
pub struct FlashTexture {
    pub width: u32,
    pub height: u32,
    pub texture: wgpu::Texture,
    pub view: wgpu::TextureView,
    pub sampler: wgpu::Sampler,

    // SWF metadata
    pub swf_path: Option<String>,
    pub is_loaded: bool,

    // Runtime state (for Phase 2: Ruffle IPC)
    pub ruffle_process: Option<std::process::Child>,
}

impl FlashTexture {
    /// Create a new FlashTexture container for SWF content
    pub fn new(device: &wgpu::Device, width: u32, height: u32) -> Self {
        let texture_size = wgpu::Extent3d {
            width,
            height,
            depth_or_array_layers: 1,
        };

        let texture = device.create_texture(&wgpu::TextureDescriptor {
            size: texture_size,
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8UnormSrgb,
            usage: wgpu::TextureUsages::TEXTURE_BINDING | wgpu::TextureUsages::COPY_DST | wgpu::TextureUsages::RENDER_ATTACHMENT,
            label: Some("flash_texture"),
            view_formats: &[],
        });

        let view = texture.create_view(&wgpu::TextureViewDescriptor::default());

        let sampler = device.create_sampler(&wgpu::SamplerDescriptor {
            address_mode_u: wgpu::AddressMode::ClampToEdge,
            address_mode_v: wgpu::AddressMode::ClampToEdge,
            address_mode_w: wgpu::AddressMode::ClampToEdge,
            mag_filter: wgpu::FilterMode::Linear,
            min_filter: wgpu::FilterMode::Nearest,
            mipmap_filter: wgpu::FilterMode::Nearest,
            ..Default::default()
        });

        Self {
            width,
            height,
            texture,
            view,
            sampler,
            swf_path: None,
            is_loaded: false,
            ruffle_process: None,
        }
    }

    /// Load an SWF file for rendering
    ///
    /// Phase 1: Validates and stores path
    /// Phase 2: Spawns Ruffle desktop process with IPC
    /// Phase 3: In-process Ruffle rendering
    pub fn load_swf<P: AsRef<Path>>(&mut self, path: P) -> Result<(), Box<dyn std::error::Error>> {
        let path = path.as_ref();

        // Validate SWF file exists and has valid signature
        if !path.exists() {
            return Err(format!("SWF file not found: {}", path.display()).into());
        }

        // Check SWF signature (FWS/CWS/ZWS)
        let mut file = std::fs::File::open(path)?;
        let mut signature = [0u8; 3];
        std::io::Read::read_exact(&mut file, &mut signature)?;

        if !matches!(&signature[..], b"FWS" | b"CWS" | b"ZWS") {
            return Err(format!("Invalid SWF signature: {:?}", signature).into());
        }

        self.swf_path = Some(path.display().to_string());
        self.is_loaded = true;

        log::info!("FlashTexture: Loaded SWF: {} (Phase 1: Path validated)", path.display());

        Ok(())
    }

    /// Update the Flash movie (advance frame)
    /// Phase 2: Communicate with Ruffle process via IPC
    pub fn update(&mut self, dt: f64) {
        if !self.is_loaded {
            return;
        }
        // Phase 2: Send tick message to Ruffle process
        // Phase 3: Call self.player.tick(dt)
    }

    /// Render the current Flash frame to the texture
    /// Phase 2: Receive framebuffer from Ruffle via shared memory
    /// Phase 3: Direct wgpu rendering
    pub fn render(&mut self, device: &wgpu::Device, queue: &wgpu::Queue) {
        if !self.is_loaded {
            return;
        }
        // Phase 2: Blit shared memory framebuffer to texture
        // Phase 3: self.renderer.render(&self.player, &self.view)
    }

    /// Get info about the Flash texture for debugging
    pub fn info(&self) -> String {
        format!(
            "FlashTexture[{}x{}] loaded={} swf={}",
            self.width,
            self.height,
            self.is_loaded,
            self.swf_path.as_deref().unwrap_or("none")
        )
    }
}
