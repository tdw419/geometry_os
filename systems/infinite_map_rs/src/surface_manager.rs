use std::collections::HashMap;
use std::sync::Arc;

use smithay::reexports::wayland_server::{protocol::wl_surface::WlSurface, Resource};
use wgpu::{
    Device, Extent3d, ImageCopyTexture, ImageDataLayout, Queue, Texture, TextureDescriptor,
    TextureDimension, TextureFormat, TextureUsages, TextureView,
};

/// Manages Wayland surfaces and their WGPU textures
pub struct SurfaceManager {
    /// Maps Wayland surfaces to their WGPU textures
    textures: HashMap<WlSurface, SurfaceTexture>,

    /// WGPU device for texture creation
    device: Arc<Device>,

    /// WGPU queue for texture uploads
    queue: Arc<Queue>,

    /// Layout for surface bind groups
    bind_group_layout: Arc<wgpu::BindGroupLayout>,
    
    /// Sampler for surface textures
    sampler: Arc<wgpu::Sampler>,
}

/// Represents a Wayland surface with its WGPU texture
pub struct SurfaceTexture {
    /// The WGPU texture
    pub texture: Texture,

    /// The texture view for rendering
    #[allow(dead_code)]
    pub view: TextureView,

    /// Cached BindGroup for rendering
    pub bind_group: wgpu::BindGroup,

    /// Surface dimensions
    pub width: u32,
    pub height: u32,

    /// Buffer format (ARGB8888, XRGB8888, etc.)
    pub format: TextureFormat,

    /// Whether the surface has pending updates
    pub dirty: bool,
}

impl SurfaceManager {
    pub fn new(
        device: Arc<Device>, 
        queue: Arc<Queue>, 
        bind_group_layout: Arc<wgpu::BindGroupLayout>,
        sampler: Arc<wgpu::Sampler>
    ) -> Self {
        SurfaceManager {
            textures: HashMap::new(),
            device,
            queue,
            bind_group_layout,
            sampler,
        }
    }

    /// Import SHM buffer as WGPU texture
    pub fn update_surface(
        &mut self,
        surface: &WlSurface,
        buffer_data: &[u8],
        width: u32,
        height: u32,
        format: TextureFormat,
        damage: Option<&Vec<smithay::utils::Rectangle<i32, smithay::utils::Buffer>>>,
    ) -> Result<(), String> {
        // Calculate texture size
        let texture_size = Extent3d {
            width,
            height,
            depth_or_array_layers: 1,
        };

        // Check if we need to resize or recreate the texture
        let needs_recreate = if let Some(existing) = self.textures.get(surface) {
            existing.width != width || existing.height != height || existing.format != format
        } else {
            true
        };

        if needs_recreate {
            // Create WGPU texture
            let texture = self.device.create_texture(&TextureDescriptor {
                label: Some(&format!("Surface {:?}", surface.id())),
                size: texture_size,
                mip_level_count: 1,
                sample_count: 1,
                dimension: TextureDimension::D2,
                format,
                usage: TextureUsages::TEXTURE_BINDING | TextureUsages::COPY_DST,
                view_formats: &[],
            });

            // Create texture view
            let view = texture.create_view(&Default::default());

            // Create BindGroup
            let bind_group = self.device.create_bind_group(&wgpu::BindGroupDescriptor {
                label: Some(&format!("Surface BindGroup {:?}", surface.id())),
                layout: &self.bind_group_layout,
                entries: &[
                    wgpu::BindGroupEntry {
                        binding: 0,
                        resource: wgpu::BindingResource::TextureView(&view),
                    },
                    wgpu::BindGroupEntry {
                        binding: 1,
                        resource: wgpu::BindingResource::Sampler(&self.sampler),
                    },
                ],
            });

            let surface_texture = SurfaceTexture {
                texture,
                view,
                bind_group,
                width,
                height,
                format,
                dirty: true,
            };

            self.textures.insert(surface.clone(), surface_texture);
            
            // For new textures, we must upload the full frame regardless of damage
            if let Some(surface_texture) = self.textures.get_mut(surface) {
                 let bytes_per_row = width * 4;
                 self.queue.write_texture(
                    ImageCopyTexture {
                        texture: &surface_texture.texture,
                        mip_level: 0,
                        origin: wgpu::Origin3d::ZERO,
                        aspect: wgpu::TextureAspect::All,
                    },
                    buffer_data,
                    ImageDataLayout {
                        offset: 0,
                        bytes_per_row: Some(bytes_per_row),
                        rows_per_image: Some(height),
                    },
                    texture_size,
                );
                return Ok(());
            }
        }

        // We know the texture exists now
        if let Some(surface_texture) = self.textures.get_mut(surface) {
            let bytes_per_pixel = 4; // Assuming 32-bit formats for now
            let bytes_per_row = width * bytes_per_pixel;

            // Use damage regions if available to optimize upload
            if let Some(damage_rects) = damage {
                if damage_rects.is_empty() {
                    // It is possible for damage to be empty if only metadata changed?
                    // But usually we should interpret empty damage on commit as "no change".
                    // However, if we are here, we probably want to update something?
                    // If damage is provided but empty, we do nothing.
                } else {
                    for rect in damage_rects {
                         // Robust clipping
                         let x = rect.loc.x.max(0) as u32;
                         let y = rect.loc.y.max(0) as u32;
                         
                         // Determine copy width/height
                         // Must not exceed texture bounds
                         let w = (rect.size.w as u32).min(width.saturating_sub(x));
                         let h = (rect.size.h as u32).min(height.saturating_sub(y));

                         if w == 0 || h == 0 { continue; }

                         // Calculate offset into the source buffer
                         let offset = (y as u64 * bytes_per_row as u64) + (x as u64 * bytes_per_pixel as u64);

                         self.queue.write_texture(
                            ImageCopyTexture {
                                texture: &surface_texture.texture,
                                mip_level: 0,
                                origin: wgpu::Origin3d { x, y, z: 0 },
                                aspect: wgpu::TextureAspect::All,
                            },
                            buffer_data,
                            ImageDataLayout {
                                offset,
                                bytes_per_row: Some(bytes_per_row),
                                rows_per_image: Some(height),
                            },
                            Extent3d { width: w, height: h, depth_or_array_layers: 1 },
                        );
                    }
                }
            } else {
                // Fallback: Full upload
                self.queue.write_texture(
                    ImageCopyTexture {
                        texture: &surface_texture.texture,
                        mip_level: 0,
                        origin: wgpu::Origin3d::ZERO,
                        aspect: wgpu::TextureAspect::All,
                    },
                    buffer_data,
                    ImageDataLayout {
                        offset: 0,
                        bytes_per_row: Some(bytes_per_row),
                        rows_per_image: Some(height),
                    },
                    texture_size,
                );
            }
            surface_texture.dirty = true;
        }

        Ok(())
    }

    /// Get texture for a surface
    pub fn get_texture(&self, surface: &WlSurface) -> Option<&SurfaceTexture> {
        self.textures.get(surface)
    }

    /// Mark surface as clean (after rendering)
    #[allow(dead_code)]
    pub fn mark_clean(&mut self, surface: &WlSurface) {
        if let Some(st) = self.textures.get_mut(surface) {
            st.dirty = false;
        }
    }

    /// Remove surface (when client destroys it)
    #[allow(dead_code)]
    pub fn remove_surface(&mut self, surface: &WlSurface) {
        if self.textures.remove(surface).is_some() {
            log::debug!("Removed surface {:?}", surface.id());
        }
    }
}

/// Convert Wayland SHM format to WGPU format
pub fn wayland_format_to_wgpu(format: u32) -> Option<TextureFormat> {
    // Wayland format codes (from wayland-protocols)
    match format {
        // ARGB8888 (alpha first)
        0 => Some(TextureFormat::Bgra8UnormSrgb),
        // XRGB8888 (no alpha)
        1 => Some(TextureFormat::Bgra8UnormSrgb),
        // RGB565 (Unsupported in some wgpu backends / convenience)
        2 => None,
        _ => {
            log::warn!("Unknown or unsupported Wayland format: {}", format);
            None
        }
    }
}

/// Convert SHM buffer pixel data to RGBA format if needed
/// Ideally we use the texture format directly, but sometimes conversion is needed.
#[allow(dead_code)]
pub fn convert_shm_to_rgba(
    buffer_data: &[u8],
    width: u32,
    height: u32,
    format: TextureFormat,
) -> Vec<u8> {
    match format {
        TextureFormat::Bgra8UnormSrgb => {
            // BGRA is generally supported by WGPU/hardware directly, so we might just pass it.
            // But if the source is truly just bytes, it matches.
            buffer_data.to_vec()
        }
        TextureFormat::Rgba8UnormSrgb => {
            // Convert BGRA to RGBA if source was BGRA (Wayland default) but we want RGBA
            // This assumes the input `buffer_data` is BGRA (common in Wayland SHM)
            let mut rgba_data = Vec::with_capacity((width * height * 4) as usize);
            for chunk in buffer_data.chunks_exact(4) {
                // B G R A -> R G B A
                rgba_data.extend_from_slice(&[chunk[2], chunk[1], chunk[0], chunk[3]]);
            }
            rgba_data
        }
        _ => {
            // For now, just copy as-is
            buffer_data.to_vec()
        }
    }
}
