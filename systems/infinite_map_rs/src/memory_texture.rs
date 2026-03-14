#![allow(dead_code, unused_variables)]
use std::fs::File;
use std::io::{self, Read};
use std::path::Path;
use std::time::{Duration, Instant};
use wgpu::*;

/// Memory region information
#[derive(Debug, Clone)]
pub struct MemoryRegion {
    pub name: String,
    pub start_addr: usize,
    pub end_addr: usize,
    pub permissions: String,
}

use std::sync::Arc;

/// Maps process memory regions to GPU textures
pub struct MemoryTextureMapper {
    heap_texture: Option<Texture>,
    pub heap_region: Option<MemoryRegion>, // Made public for inspection
    config: MemoryTextureConfig,
    last_update: Instant,
    device: Arc<Device>,
    queue: Arc<Queue>,
}

/// Memory texture configuration
#[derive(Debug, Clone)]
pub struct MemoryTextureConfig {
    pub width: u32,
    pub height: u32,
    pub format: TextureFormat,
    pub update_interval: Duration,
}

impl Default for MemoryTextureConfig {
    fn default() -> Self {
        Self {
            width: 4096,
            height: 4096,
            format: TextureFormat::Rgba8UnormSrgb,
            update_interval: Duration::from_millis(100),
        }
    }
}

impl MemoryTextureMapper {
    pub fn new(device: Arc<Device>, queue: Arc<Queue>, config: Option<MemoryTextureConfig>) -> Self {
        let config = config.unwrap_or_default();
        Self {
            heap_texture: None,
            heap_region: None,
            config,
            last_update: Instant::now(),
            device,
            queue,
        }
    }

    pub fn map_memory_regions(&mut self) -> io::Result<()> {
        let maps_path = Path::new("/proc/self/maps");
        let maps_content = std::fs::read_to_string(maps_path)?;
        
        for line in maps_content.lines() {
            if let Some(region) = self.parse_maps_line(line) {
                if region.name == "[heap]" {
                    self.heap_region = Some(region.clone());
                    self.heap_texture = Some(self.create_memory_texture("heap_texture"));
                    break;
                }
            }
        }
        
        Ok(())
    }

    fn parse_maps_line(&self, line: &str) -> Option<MemoryRegion> {
        let parts: Vec<&str> = line.split_whitespace().collect();
        if parts.len() < 5 {
            return None;
        }
        
        let addrs: Vec<&str> = parts[0].split('-').collect();
        if addrs.len() != 2 { return None; }
        
        let start_addr = usize::from_str_radix(addrs[0], 16).ok()?;
        let end_addr = usize::from_str_radix(addrs[1], 16).ok()?;
        
        Some(MemoryRegion {
            name: parts.get(5).unwrap_or(&"[anonymous]").to_string(),
            start_addr,
            end_addr,
            permissions: parts[1].to_string(),
        })
    }

    pub fn read_memory(&self, addr: usize, size: usize) -> io::Result<Vec<u8>> {
        let mut mem_file = File::open("/proc/self/mem")?;
        use std::io::{Seek, SeekFrom};
        mem_file.seek(SeekFrom::Start(addr as u64))?;
        let mut buffer = vec![0u8; size];
        mem_file.read_exact(&mut buffer)?;
        Ok(buffer)
    }

    pub fn update_textures(&mut self) {
        let now = Instant::now();
        if now.duration_since(self.last_update) < self.config.update_interval {
            return;
        }
        
        self.last_update = now;
        
        // We need to clone region and texture ref to avoid borrow checker issues if we used self inside update_region_texture in a way that conflicted
        // But here update_region_texture takes &self, so we need to be careful not to borrow self mutably while calling it?
        // Actually update_textures takes &mut self.
        
        // To avoid "cannot borrow `*self` as immutable because it is also borrowed as mutable", 
        // we extract the fields we need.
        
        if self.heap_region.is_some() && self.heap_texture.is_some() {
             let region = self.heap_region.clone().unwrap();
             let texture = self.heap_texture.as_ref().unwrap(); // Use the ref from self
             
             // We can't call self.update_region_texture(region, texture) easily if texture is borrowed from self
             // However, texture is behind Option.
             
             // Let's implement the logic inline or structure it differently. 
             // Ideally helper should not take &self if it needs to use fields that are borrowed.
             // But update_region_texture needs `self.read_memory` and `self.queue`.
             
             // READ MEMORY does NOT require mutable self. queue is in self.
             
             // The issue is `update_textures` is `&mut self`.
             // `update_region_texture` takes `&self`.
             // If we call `self.update_region_texture`, we downgrade to `&self`, which is fine.
             // But we need to pass `texture` which is in `self`.
             // It should be fine as long as we don't mutate `self` *during* the call.
        }
        
        // Refactored call to avoid issues:
        if let Some(ref region) = self.heap_region {
             if let Some(ref texture) = self.heap_texture {
                 // Check if we can do this. 
                 // We need to clone region because we might pass it? No, passed by reference.
             }
        }
        
        // Actually, let's just implement the loop here to be safe and simple for now, or use a helper that doesn't take &self but takes components.
        
        // For now, let's proceed with the structure from the quickstart but ensure it compiles.
        // The quickstart code:
        /*
        if let (Some(ref region), Some(ref texture)) = (&self.heap_region, &self.heap_texture) {
            self.update_region_texture(region, texture);
        }
        */
        // This works because &self.heap_region borrows self immutably. update_region_texture takes &self (immutable).
        // The outer function update_textures takes &mut self.
        // Reborrowing as immutable is allowed if there are no active mutable borrows.
        // Wait, update_textures took &mut self. So we have a generic mutable borrow active.
        // We can reborrow as immutable.
        
        // However, if we want to call self.update_region_texture, we pass `texture` which is a reference to a field in `self`.
        
        if self.heap_region.is_some() && self.heap_texture.is_some() {
            // Clone the region to avoid holding a borrow to self.heap_region
            let region = self.heap_region.as_ref().unwrap().clone();
            // We can't easily clone the texture (it's a wgpu::Texture, not Clone usually, or expensive/invalid).
            // But we can pass a reference to it.
            
            // NOTE: To make this robust, I'll temporarily put the logic here or make sure the helper usage is correct.
            
            self.update_heap_texture_internal(&region);
        }
    }
    
    fn update_heap_texture_internal(&self, region: &MemoryRegion) {
        if let Some(texture) = &self.heap_texture {
             self.update_region_texture(region, texture);
        }
    }

    fn create_memory_texture(&self, name: &str) -> Texture {
        let texture_desc = TextureDescriptor {
            label: Some(name),
            size: Extent3d {
                width: self.config.width,
                height: self.config.height,
                depth_or_array_layers: 1,
            },
            mip_level_count: 1,
            sample_count: 1,
            dimension: TextureDimension::D2,
            format: self.config.format,
            usage: TextureUsages::TEXTURE_BINDING | TextureUsages::COPY_DST,
            view_formats: &[],
        };
        
        self.device.create_texture(&texture_desc)
    }

    fn update_region_texture(&self, region: &MemoryRegion, texture: &Texture) {
        let region_size = region.end_addr - region.start_addr;
        let page_size = 4096;
        let num_pages = region_size / page_size;
        let max_pixels = (self.config.width * self.config.height) as usize;
        let pages_to_read = num_pages.min(max_pixels);
        
        // Limit max pages to read to avoid huge buffers for demo
        let limit_pages = 10000; // 40MB buffer
        let pages_to_read = pages_to_read.min(limit_pages);
        
        let mut texture_data = vec![0u8; pages_to_read * 4];
        
        for i in 0..pages_to_read {
            let page_addr = region.start_addr + i * page_size;
            // Read only small chunk to be fast
            if let Ok(page_data) = self.read_memory(page_addr, 256) {
                let color = self.page_to_color(&page_data);
                let pixel_idx = i * 4;
                if pixel_idx + 4 <= texture_data.len() {
                    texture_data[pixel_idx] = color[0];
                    texture_data[pixel_idx + 1] = color[1];
                    texture_data[pixel_idx + 2] = color[2];
                    texture_data[pixel_idx + 3] = 255;
                }
            }
        }
        
        let data_layout = ImageDataLayout {
            offset: 0,
            bytes_per_row: Some(self.config.width * 4),
            rows_per_image: None,
        };
        
        let image_copy_texture = ImageCopyTexture {
            texture,
            mip_level: 0,
            origin: Origin3d::ZERO,
            aspect: TextureAspect::All,
        };
        
        let extent = Extent3d {
            width: self.config.width, // Note: This assumes we fill the whole width. If we read less, we might have issues.
            // For now, let's assume partial updates aren't handled perfectly in this snippet and we just write what we have.
            // Actually, WriteTexture expects exact size matches for the extent.
            // We should calculate extent based on data size.
            height: (pages_to_read as u32 + self.config.width - 1) / self.config.width, // Calculate needed height
            depth_or_array_layers: 1,
        };
        
        // Ensure extent width is full line or partial
        // WriteTexture is strict.
        // For simplicity: Update 1 row at a time or just update the whole thing if data matches.
        // Let's just update the extent that matches our data.
        
        // Actually, let's allow the full texture update but pad the buffer?
        // Or simpler: Just write the whole buffer we allocated.
        // We allocated pages_to_read * 4.
        
        // If we don't have enough data to fill a row?
        
        // Correct approach: define extent to match data.
        let rows = (texture_data.len() as u32) / (self.config.width * 4);
        let extent_height = if rows == 0 { 1 } else { rows };
         
        let valid_extent = Extent3d {
             width: self.config.width,
             height: extent_height,
             depth_or_array_layers: 1,
        };
        
        // Only write if we have data
        if texture_data.len() > 0 {
             self.queue.write_texture(image_copy_texture, &texture_data, data_layout, valid_extent);
        }
    }

    fn page_to_color(&self, page_data: &[u8]) -> [u8; 4] {
        let non_zero_count = page_data.iter().filter(|&&b| b != 0).count();
        let ratio = non_zero_count as f32 / page_data.len() as f32;
        let brightness = (ratio * 255.0) as u8;
        // Green tint for memory
        [0, brightness, 0, 255]
    }
    
    pub fn get_heap_texture_view(&self) -> Option<TextureView> {
        self.heap_texture.as_ref().map(|t| t.create_view(&TextureViewDescriptor::default()))
    }

    pub fn get_stack_texture_view(&self) -> Option<TextureView> {
        None
    }

    pub fn get_code_texture_view(&self) -> Option<TextureView> {
        None
    }

    pub fn get_data_texture_view(&self) -> Option<TextureView> {
        None
    }
}
