#![allow(dead_code, unused_imports, unused_variables)]
// Phase 30.2: VM Framebuffer Rendering
// VM Texture Manager - Manages VM framebuffer textures for WGPU rendering
//
// This module handles the mapping of VM framebuffer data to WGPU textures,
// enabling real-time visualization of guest OS output in the 3D infinite map.

use std::collections::HashMap;
use std::sync::Arc;
use wgpu::{
    Device, Extent3d, ImageCopyTexture, ImageDataLayout, Queue, Texture, TextureDescriptor,
    TextureDimension, TextureFormat, TextureUsages, TextureView, BindGroup, BindGroupLayout,
    Sampler,
};

// Phase 30.7: Terminal Emulator Support
use crate::terminal_emulator::{TerminalBuffer};

// Phase 30.8: GlyphAtlas for font rendering
use crate::glyph_atlas::GlyphAtlas;

/// Represents a VM framebuffer texture
pub struct VmTexture {
    /// The WGPU texture
    pub texture: Arc<Texture>,

    /// The texture view for rendering
    pub view: TextureView,

    /// Cached BindGroup for rendering
    pub bind_group: BindGroup,

    /// Framebuffer dimensions
    pub width: u32,
    pub height: u32,

    /// Whether the texture has pending updates
    pub dirty: bool,
}

/// Manages VM framebuffer textures
pub struct VmTextureManager {
    /// Maps window IDs to their VM textures
    textures: HashMap<usize, VmTexture>,

    /// WGPU device for texture creation
    device: Arc<Device>,

    /// WGPU queue for texture uploads
    queue: Arc<Queue>,

    /// Layout for VM texture bind groups
    bind_group_layout: Arc<BindGroupLayout>,

    /// Sampler for VM textures
    sampler: Arc<Sampler>,

    /// Phase 30.8: GlyphAtlas for font rendering
    glyph_atlas: GlyphAtlas,
}

impl VmTextureManager {
    pub fn new(
        device: Arc<Device>,
        queue: Arc<Queue>,
        bind_group_layout: Arc<BindGroupLayout>,
        sampler: Arc<Sampler>,
    ) -> Self {
        VmTextureManager {
            textures: HashMap::new(),
            device,
            queue,
            bind_group_layout,
            sampler,
            glyph_atlas: GlyphAtlas::new(1024, 1024),
        }
    }

    /// Update VM framebuffer texture
    pub fn update_vm_texture(
        &mut self,
        window_id: usize,
        framebuffer_data: &[u8],
        width: u32,
        height: u32,
    ) -> Result<(), String> {
        // Calculate texture size
        let texture_size = Extent3d {
            width,
            height,
            depth_or_array_layers: 1,
        };

        // Check if we need to resize or recreate the texture
        let needs_recreate = if let Some(existing) = self.textures.get(&window_id) {
            existing.width != width || existing.height != height
        } else {
            true
        };

        if needs_recreate {
            // Create WGPU texture
            let texture = self.device.create_texture(&TextureDescriptor {
                label: Some(&format!("VM Framebuffer Window {}", window_id)),
                size: texture_size,
                mip_level_count: 1,
                sample_count: 1,
                dimension: TextureDimension::D2,
                format: TextureFormat::Rgba8UnormSrgb,
                usage: TextureUsages::TEXTURE_BINDING | TextureUsages::COPY_DST,
                view_formats: &[],
            });

            // Create texture view
            let view = texture.create_view(&Default::default());

            // Create BindGroup
            let bind_group = self.device.create_bind_group(&wgpu::BindGroupDescriptor {
                label: Some(&format!("VM Texture BindGroup Window {}", window_id)),
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

            let vm_texture = VmTexture {
                texture: Arc::new(texture),
                view,
                bind_group,
                width,
                height,
                dirty: true,
            };

            self.textures.insert(window_id, vm_texture);
            
            // For new textures, we must upload the full frame
            if let Some(vm_texture) = self.textures.get_mut(&window_id) {
                 let bytes_per_row = width * 4;
                 self.queue.write_texture(
                    ImageCopyTexture {
                        texture: &vm_texture.texture,
                        mip_level: 0,
                        origin: wgpu::Origin3d::ZERO,
                        aspect: wgpu::TextureAspect::All,
                    },
                    framebuffer_data,
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
        if let Some(vm_texture) = self.textures.get_mut(&window_id) {
            let bytes_per_row = width * 4;

            // Full upload (for now - could optimize with damage regions later)
            self.queue.write_texture(
                ImageCopyTexture {
                    texture: &vm_texture.texture,
                    mip_level: 0,
                    origin: wgpu::Origin3d::ZERO,
                    aspect: wgpu::TextureAspect::All,
                },
                framebuffer_data,
                ImageDataLayout {
                    offset: 0,
                    bytes_per_row: Some(bytes_per_row),
                    rows_per_image: Some(height),
                },
                texture_size,
            );
            vm_texture.dirty = true;
        }

        Ok(())
    }

    /// Register an external texture for a window
    pub fn register_external_texture(
        &mut self,
        window_id: usize,
        texture: Arc<Texture>,
    ) -> Result<(), String> {
        let width = texture.width();
        let height = texture.height();

        // Create texture view
        let view = texture.create_view(&Default::default());

        // Create BindGroup
        let bind_group = self.device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some(&format!("External VM Texture BindGroup Window {}", window_id)),
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

        // We can't easily store the external Texture because of ownership/lifetime issues if we want to keep it in VmTexture.
        // But since InfiniteMapApp holds both Executor and VmTextureManager, we can assume the texture lives long enough.
        // Actually, VmTexture::texture is wgpu::Texture which is a handle (Arc internal). Cloning it is fine.
        
        let vm_texture = VmTexture {
            texture,
            view,
            bind_group,
            width,
            height,
            dirty: true,
        };

        self.textures.insert(window_id, vm_texture);
        Ok(())
    }

    /// Get texture for a window
    pub fn get_texture(&self, window_id: usize) -> Option<&VmTexture> {
        self.textures.get(&window_id)
    }

    /// Mark texture as clean (after rendering)
    pub fn mark_clean(&mut self, window_id: usize) {
        if let Some(vm_texture) = self.textures.get_mut(&window_id) {
            vm_texture.dirty = false;
        }
    }

    /// Remove texture (when VM window is destroyed)
    pub fn remove_texture(&mut self, window_id: usize) {
        if self.textures.remove(&window_id).is_some() {
            log::debug!("Removed VM texture for window {}", window_id);
        }
    }

    /// Check if a window has a VM texture
    pub fn has_texture(&self, window_id: usize) -> bool {
        self.textures.contains_key(&window_id)
    }

    /// Update terminal texture
    pub fn update_terminal_texture(
        &mut self,
        window_id: usize,
        terminal_buffer: &TerminalBuffer,
        cursor_visible: bool,
        cursor_blink_state: f32,
        selection_range: Option<((usize, usize), (usize, usize))>
    ) -> Result<(), String> {
        let (rows, cols) = terminal_buffer.get_size();
        let char_width = 8;
        let char_height = 16;
        let width = (cols * char_width) as u32;
        let height = (rows * char_height) as u32;
        
        let data = self.render_terminal_buffer(
            terminal_buffer, 
            cursor_visible, 
            cursor_blink_state, 
            selection_range
        );
        
        self.update_vm_texture(window_id, &data, width, height)
    }

    // Phase 30.7: Terminal Buffer Rendering

    /// Render terminal buffer to RGBA texture data
    /// This converts the 2D grid of terminal cells to a pixel buffer
    pub fn render_terminal_buffer(
        &self, 
        terminal_buffer: &TerminalBuffer, 
        cursor_visible: bool, 
        cursor_blink_state: f32,
        selection_range: Option<((usize, usize), (usize, usize))>
    ) -> Vec<u8> {
        let (rows, cols) = terminal_buffer.get_size();
        
        // Character dimensions (in pixels)
        let char_width = 8;
        let char_height = 16;
        
        // Calculate texture dimensions
        let texture_width = cols * char_width;
        let texture_height = rows * char_height;
        
        // Create RGBA buffer
        let mut framebuffer = vec![0u8; texture_width * texture_height * 4];
        
        // Simple 8x16 bitmap font (ASCII 32-126)
        let font = Self::get_bitmap_font();
        
        // Get cursor position
        let (cursor_row, cursor_col) = terminal_buffer.get_cursor();
        
        // Check if we are scrolled up
        let view_offset = terminal_buffer.get_view_offset();
        
        // Render each cell
        for row in 0..rows {
            for col in 0..cols {
                // Use get_render_cell to respect view offset
                if let Some(cell) = terminal_buffer.get_render_cell(row, col) {
                    let char_idx = (cell.c as usize).saturating_sub(32);
                    
                    // Get character bitmap
                    let bitmap = if char_idx < font.len() {
                        &font[char_idx]
                    } else {
                        &font[0]
                    };
                    
                    // Get colors
                    let fg_color = cell.attrs.effective_fg().to_rgba();
                    let bg_color = cell.attrs.effective_bg().to_rgba();
                    
                    // Phase 31: Check selection highlighting
                    // Adjust row for scrollback if necessary provided selection is absolute?
                    // TerminalClipboard selection is usually absolute buffer coordinates.
                    // But `row` here is visual row (0..rows).
                    // `get_render_cell(row, col)` maps visual row to absolute index.
                    // We need to know the ABSOLUTE row to check against selection.
                    // TerminalBuffer::get_render_cell logic: absolute_index = (total_history + row) - view_offset.
                    // We should expose absolute row index from TerminalBuffer or calculate it here.
                    // Since selection range is likely in absolute coordinates (if it tracks scrollback) OR visual?
                    // Usually selection tracks ABSOLUTE coordinates.
                    // Let's assume selection tracks VISUAL coordinates for simplicity if it handles ViewPort.
                    // But `TerminalClipboard` binds to `TerminalBuffer`.
                    // The standard way: Selection is absolute.
                    
                    // For now, let's implement Visual Selection Highlighting assuming 'row' matches selection logic 
                    // (i.e. selection is cleared on scroll or tracks visual screen).
                    // If selection tracks absolute, we need to map visual `row` to `abs_row`.
                    // But `TerminalClipboard` in `clipboard_manager` uses `buffer.get_size()` so is likely Visual relative to current buffer state?
                    // Actually, `TerminalClipboard` uses `row` passed from `start_selection`.
                    // `start_selection` uses `row` from mouse click. Mouse click provides VISUAL row.
                    // So selection IS Visual relative to the viewport!
                    // So we can compare `row` directly.
                    
                    let is_selected = if let Some(((start_row, start_col), (end_row, end_col))) = selection_range {
                        if row < start_row || row > end_row { false }
                        else if row > start_row && row < end_row { true }
                        else if row == start_row && row == end_row {
                            col >= start_col && col <= end_col
                        } else if row == start_row {
                             col >= start_col
                        } else if row == end_row {
                             col <= end_col
                        } else { false }
                    } else { false };

                    // Cursor check
                    let is_cursor = view_offset == 0 && cursor_visible && cursor_blink_state > 0.5 && row == cursor_row && col == cursor_col;
                    
                    // Render character pixels
                    for char_row in 0..char_height {
                        for char_col in 0..char_width {
                            let pixel_x = col * char_width + char_col;
                            let pixel_y = row * char_height + char_row;
                            
                            if pixel_x >= texture_width || pixel_y >= texture_height {
                                continue;
                            }
                            
                            let pixel_idx = (pixel_y * texture_width + pixel_x) * 4;
                            
                            let bitmap_byte = bitmap[char_row];
                            let pixel_set = (bitmap_byte >> (7 - char_col)) & 1 == 1;
                            
                            // Determine final color
                            let color = if is_cursor {
                                if pixel_set { bg_color } else { fg_color }
                            } else if is_selected {
                                // Selection style: Invert colors (same as cursor for now)
                                if pixel_set { bg_color } else { fg_color }
                            } else {
                                if pixel_set { fg_color } else { bg_color }
                            };
                            
                            framebuffer[pixel_idx] = color[0];     // R
                            framebuffer[pixel_idx + 1] = color[1]; // G
                            framebuffer[pixel_idx + 2] = color[2]; // B
                            framebuffer[pixel_idx + 3] = color[3]; // A
                        }
                    }
                }
            }
        }
        
        // Phase 30.8: Render simple scrollbar indicator if scrolled up
        if view_offset > 0 {
            let scrollbar_width = 4;
            let scrollbar_color = [200, 200, 200, 255]; // Light grey
            
            for y in 0..texture_height {
                for x in (texture_width - scrollbar_width)..texture_width {
                    let pixel_idx = (y as usize * texture_width as usize + x as usize) * 4;
                    if pixel_idx + 3 < framebuffer.len() {
                         framebuffer[pixel_idx] = scrollbar_color[0];
                         framebuffer[pixel_idx+1] = scrollbar_color[1];
                         framebuffer[pixel_idx+2] = scrollbar_color[2];
                         framebuffer[pixel_idx+3] = scrollbar_color[3];
                    }
                }
            }
        }
        
        framebuffer
    }

    /// Get simple 8x16 bitmap font for ASCII 32-126
    /// Get simple 8x16 bitmap font for ASCII 32-126
    fn get_bitmap_font() -> Vec<[u8; 16]> {
        crate::font_bitmap::FONT_8X16.to_vec()
    }
}
