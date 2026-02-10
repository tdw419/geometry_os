// ============================================
// CARTRIDGE TEXTURE MANAGER - Phase 35.9.1
// Manages .rts.png cartridge textures for Evolution Zone rendering
// ============================================

use std::collections::HashMap;
use std::path::Path;
use std::sync::Arc;
use wgpu::{self, Device, Queue, Texture, TextureView, BindGroup, Sampler};

use crate::rts_texture::RTSTexture;

/// Cartridge texture entry containing GPU resources
#[derive(Debug)]
pub struct CartridgeTexture {
    /// GPU texture
    pub texture: Texture,
    /// Texture view for rendering
    pub texture_view: TextureView,
    /// Bind group for rendering
    pub bind_group: BindGroup,
    /// Original image dimensions
    pub width: u32,
    pub height: u32,
    /// Cartridge ID
    pub cartridge_id: String,
    /// Last access timestamp
    pub last_access: std::time::Instant,
}

/// Statistics about cartridge textures
#[derive(Debug, Clone)]
pub struct CartridgeTextureStats {
    /// Total number of loaded textures
    pub total_textures: usize,
    /// Total VRAM usage in bytes
    pub total_vram_bytes: u64,
}

/// Cartridge texture manager for Evolution Zone rendering
///
/// Manages loading, caching, and GPU resources for .rts.png cartridges.
/// Similar to VmTextureManager and MemoryTextureManager.
pub struct CartridgeTextureManager {
    /// GPU device
    device: Arc<Device>,
    /// GPU queue
    queue: Arc<Queue>,
    /// Bind group layout for textures
    bind_group_layout: Arc<wgpu::BindGroupLayout>,
    /// Shared sampler
    sampler: Arc<Sampler>,
    /// Map of cartridge textures by cartridge ID
    textures: HashMap<String, CartridgeTexture>,
    /// Maximum cache size
    max_cache_size: usize,
}

impl CartridgeTextureManager {
    /// Create a new cartridge texture manager
    ///
    /// # Arguments
    /// * `device` - WGPU device
    /// * `queue` - WGPU queue
    /// * `bind_group_layout` - Bind group layout for textures
    /// * `sampler` - Shared sampler
    pub fn new(
        device: Arc<Device>,
        queue: Arc<Queue>,
        bind_group_layout: Arc<wgpu::BindGroupLayout>,
        sampler: Arc<Sampler>,
    ) -> Self {
        Self {
            device,
            queue,
            bind_group_layout,
            sampler,
            textures: HashMap::new(),
            max_cache_size: 32, // Cache up to 32 cartridges
        }
    }

    /// Load a .rts.png file and create GPU texture
    ///
    /// # Arguments
    /// * `cartridge_id` - Unique cartridge identifier
    /// * `path` - Path to .rts.png file
    ///
    /// # Returns
    /// * `Ok(())` - Successfully loaded
    /// * `Err(String)` - Error message
    pub fn load_cartridge<P: AsRef<Path>>(
        &mut self,
        cartridge_id: &str,
        path: P,
    ) -> Result<(), String> {
        let path = path.as_ref();

        // Check if already loaded
        if self.textures.contains_key(cartridge_id) {
            // Update last access time
            if let Some(texture) = self.textures.get_mut(cartridge_id) {
                texture.last_access = std::time::Instant::now();
            }
            return Ok(());
        }

        // Check if file exists
        if !path.exists() {
            return Err(format!(
                "Cartridge file not found: {} (cartridge_id: {})",
                path.display(),
                cartridge_id
            ));
        }

        // Load .rts.png using existing RTSTexture loader
        let rts_texture = RTSTexture::load(path).map_err(|e| {
            format!(
                "Failed to load cartridge texture from {}: {} (cartridge_id: {})",
                path.display(),
                e,
                cartridge_id
            )
        })?;

        let width = rts_texture.width;
        let height = rts_texture.height;

        // Create GPU texture
        let texture = self.device.create_texture(&wgpu::TextureDescriptor {
            label: Some(&format!("Cartridge Texture: {}", cartridge_id)),
            size: wgpu::Extent3d {
                width,
                height,
                depth_or_array_layers: 1,
            },
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8UnormSrgb,
            usage: wgpu::TextureUsages::TEXTURE_BINDING | wgpu::TextureUsages::COPY_DST,
            view_formats: &[],
        });

        let texture_view = texture.create_view(&wgpu::TextureViewDescriptor::default());

        // Upload texture data
        let rgba_bytes = rts_texture.as_rgba_bytes();
        self.queue.write_texture(
            wgpu::ImageCopyTexture {
                texture: &texture,
                mip_level: 0,
                origin: wgpu::Origin3d::ZERO,
                aspect: wgpu::TextureAspect::All,
            },
            &rgba_bytes,
            wgpu::ImageDataLayout {
                offset: 0,
                bytes_per_row: Some(width * 4),
                rows_per_image: None,
            },
            wgpu::Extent3d {
                width,
                height,
                depth_or_array_layers: 1,
            },
        );

        // Create bind group
        let bind_group = self.device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some(&format!("Cartridge Bind Group: {}", cartridge_id)),
            layout: &self.bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: wgpu::BindingResource::TextureView(&texture_view),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: wgpu::BindingResource::Sampler(&self.sampler),
                },
            ],
        });

        // Store texture entry
        let entry = CartridgeTexture {
            texture,
            texture_view,
            bind_group,
            width,
            height,
            cartridge_id: cartridge_id.to_string(),
            last_access: std::time::Instant::now(),
        };

        self.textures.insert(cartridge_id.to_string(), entry);

        // Enforce cache size limit
        self.enforce_cache_limit();

        log::info!(
            "🎨 Loaded cartridge texture: {} ({}x{})",
            cartridge_id,
            width,
            height
        );

        Ok(())
    }

    /// Get texture by cartridge ID
    pub fn get_texture(&self, cartridge_id: &str) -> Option<&CartridgeTexture> {
        self.textures.get(cartridge_id)
    }

    /// Get mutable texture by cartridge ID
    pub fn get_texture_mut(&mut self, cartridge_id: &str) -> Option<&mut CartridgeTexture> {
        self.textures.get_mut(cartridge_id)
    }

    /// Check if a cartridge texture is already loaded
    pub fn has_texture(&self, cartridge_id: &str) -> bool {
        self.textures.contains_key(cartridge_id)
    }

    /// Get texture dimensions without loading
    pub fn get_texture_info(&self, cartridge_id: &str) -> Option<(u32, u32)> {
        self.textures
            .get(cartridge_id)
            .map(|tex| (tex.width, tex.height))
    }

    /// Get texture count
    pub fn len(&self) -> usize {
        self.textures.len()
    }

    /// Check if empty
    pub fn is_empty(&self) -> bool {
        self.textures.is_empty()
    }

    /// Remove a cartridge texture
    pub fn remove_cartridge(&mut self, cartridge_id: &str) -> bool {
        if let Some(texture) = self.textures.remove(cartridge_id) {
            log::info!("🗑️  Removed cartridge texture: {}", cartridge_id);
            true
        } else {
            false
        }
    }

    /// Clear all cartridge textures
    pub fn clear(&mut self) {
        let count = self.textures.len();
        self.textures.clear();
        log::info!("🗑️  Cleared {} cartridge textures", count);
    }

    /// Get statistics about loaded textures
    pub fn stats(&self) -> CartridgeTextureStats {
        let total_vram_bytes: u64 = self
            .textures
            .values()
            .map(|t| {
                let size = t.texture.size();
                (size.width * size.height * size.depth_or_array_layers * 4) as u64
            })
            .sum();

        CartridgeTextureStats {
            total_textures: self.textures.len(),
            total_vram_bytes,
        }
    }

    /// Get all cartridge IDs
    pub fn get_all_cartridge_ids(&self) -> Vec<String> {
        self.textures.keys().cloned().collect()
    }

    /// Set maximum cache size
    pub fn set_max_cache_size(&mut self, max_size: usize) {
        self.max_cache_size = max_size;
        self.enforce_cache_limit();
    }

    /// Enforce cache size limit by evicting least recently used textures
    fn enforce_cache_limit(&mut self) {
        while self.textures.len() > self.max_cache_size {
            // Find least recently used texture
            let mut lru_id = None;
            let mut lru_time = std::time::Instant::now();

            for (id, texture) in &self.textures {
                if texture.last_access < lru_time {
                    lru_time = texture.last_access;
                    lru_id = Some(id.clone());
                }
            }

            if let Some(id) = lru_id {
                self.remove_cartridge(&id);
                log::debug!("Evicted cartridge texture from cache: {}", id);
            } else {
                // Shouldn't happen, but break to avoid infinite loop
                break;
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_cartridge_texture_stats() {
        let stats = CartridgeTextureStats {
            total_textures: 5,
            total_vram_bytes: 1024 * 1024, // 1MB
        };

        assert_eq!(stats.total_textures, 5);
        assert_eq!(stats.total_vram_bytes, 1024 * 1024);
    }

    #[test]
    fn test_cartridge_texture_empty_manager() {
        // This test verifies the stats structure works
        // Actual manager tests require WGPU device
        let stats = CartridgeTextureStats {
            total_textures: 0,
            total_vram_bytes: 0,
        };

        assert_eq!(stats.total_textures, 0);
        assert_eq!(stats.total_vram_bytes, 0);
    }
}
