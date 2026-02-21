//! Evolution → Infinite Map Bridge
//!
//! This module bridges the gap between the Neural Quine (abstract evolution)
//! and the Infinite Map (physical embodiment). The evolution engine's output
//! becomes terrain in the 3D world.
//!
//! Architecture:
//! ```
//! Evolution Canvas          Infinite Map
//!      │                        │
//!      ▼                        ▼
//! ┌─────────┐            ┌─────────┐
//! │ 32x32   │   ────►    │ 3D Tile │
//! │ Pixels  │   Grow     │ Terrain │
//! └─────────┘            └─────────┘
//!    (Genome)              (Body)
//! ```

use wgpu::util::DeviceExt;
use std::sync::{Arc, Mutex};

/// Size of the evolution canvas (32x32 pixels from Neural Quine)
pub const EVOLUTION_CANVAS_SIZE: usize = 32;

/// Size of the terrain heightmap (256x256 for smooth interpolation)
pub const TERRAIN_HEIGHTMAP_SIZE: usize = 256;

/// Represents an evolved organism's genome as a 32x32 pixel grid
#[derive(Debug, Clone)]
pub struct EvolutionGenome {
    /// RGBA pixel data (32x32 = 1024 pixels)
    pub pixels: Vec<u8>,
    /// Generation number
    pub generation: u64,
    /// Fitness score (0.0 - 1.0)
    pub fitness: f32,
    /// Species identifier
    pub species: String,
    /// Position on the infinite map
    pub map_position: (i32, i32),
    /// Unique genome ID
    pub id: String,
}

impl EvolutionGenome {
    /// Create a new genome from raw pixel data
    pub fn from_pixels(pixels: Vec<u8>, generation: u64, fitness: f32) -> Self {
        assert_eq!(pixels.len(), EVOLUTION_CANVAS_SIZE * EVOLUTION_CANVAS_SIZE * 4,
            "Pixel data must be 32x32 RGBA");
        
        Self {
            pixels,
            generation,
            fitness,
            species: "unknown".to_string(),
            map_position: (0, 0),
            id: format!("gen{}_{}", generation, uuid::Uuid::new_v4().to_string()[..8].to_string()),
        }
    }
    
    /// Create a genome from a 32x32 grayscale array
    pub fn from_grayscale(data: [[f32; EVOLUTION_CANVAS_SIZE]; EVOLUTION_CANVAS_SIZE], generation: u64) -> Self {
        let mut pixels = Vec::with_capacity(EVOLUTION_CANVAS_SIZE * EVOLUTION_CANVAS_SIZE * 4);
        
        for y in 0..EVOLUTION_CANVAS_SIZE {
            for x in 0..EVOLUTION_CANVAS_SIZE {
                let value = (data[y][x] * 255.0) as u8;
                pixels.push(value); // R
                pixels.push(value); // G
                pixels.push(value); // B
                pixels.push(255);   // A
            }
        }
        
        Self {
            pixels,
            generation,
            fitness: 0.5,
            species: "grayscale".to_string(),
            map_position: (0, 0),
            id: format!("gen{}_gray", generation),
        }
    }
    
    /// Get the pixel at a specific coordinate
    pub fn get_pixel(&self, x: usize, y: usize) -> [u8; 4] {
        let idx = (y * EVOLUTION_CANVAS_SIZE + x) * 4;
        [
            self.pixels[idx],
            self.pixels[idx + 1],
            self.pixels[idx + 2],
            self.pixels[idx + 3],
        ]
    }
    
    /// Extract height value (0.0 - 1.0) from a pixel
    pub fn get_height_at(&self, x: usize, y: usize) -> f32 {
        let pixel = self.get_pixel(x, y);
        // Use luminance as height
        (0.299 * pixel[0] as f32 + 0.587 * pixel[1] as f32 + 0.114 * pixel[2] as f32) / 255.0
    }
}

/// Terrain heightmap generated from evolution genome
#[derive(Debug)]
pub struct EvolutionTerrainHeightmap {
    /// Height values (0.0 - 1.0) as a 256x256 grid
    pub heights: Vec<f32>,
    /// Normal vectors for lighting (calculated from heights)
    pub normals: Vec<[f32; 3]>,
    /// Color texture derived from genome
    pub colors: Vec<[u8; 4]>,
    /// Metadata
    pub generation: u64,
    pub fitness: f32,
    pub species: String,
}

impl EvolutionTerrainHeightmap {
    /// Generate a heightmap from an evolution genome
    pub fn from_genome(genome: &EvolutionGenome) -> Self {
        let mut heights = vec![0.0; TERRAIN_HEIGHTMAP_SIZE * TERRAIN_HEIGHTMAP_SIZE];
        let mut colors = vec![[0u8; 4]; TERRAIN_HEIGHTMAP_SIZE * TERRAIN_HEIGHTMAP_SIZE];
        
        // Scale up 32x32 to 256x256 using bilinear interpolation
        for y in 0..TERRAIN_HEIGHTMAP_SIZE {
            for x in 0..TERRAIN_HEIGHTMAP_SIZE {
                // Map to genome coordinates
                let genome_x = (x as f32 / TERRAIN_HEIGHTMAP_SIZE as f32) * (EVOLUTION_CANVAS_SIZE as f32 - 1.0);
                let genome_y = (y as f32 / TERRAIN_HEIGHTMAP_SIZE as f32) * (EVOLUTION_CANVAS_SIZE as f32 - 1.0);
                
                // Bilinear interpolation
                let x0 = genome_x.floor() as usize;
                let y0 = genome_y.floor() as usize;
                let x1 = (x0 + 1).min(EVOLUTION_CANVAS_SIZE - 1);
                let y1 = (y0 + 1).min(EVOLUTION_CANVAS_SIZE - 1);
                
                let fx = genome_x - x0 as f32;
                let fy = genome_y - y0 as f32;
                
                // Sample four corners
                let h00 = genome.get_height_at(x0, y0);
                let h10 = genome.get_height_at(x1, y0);
                let h01 = genome.get_height_at(x0, y1);
                let h11 = genome.get_height_at(x1, y1);
                
                // Interpolate height
                let h0 = h00 * (1.0 - fx) + h10 * fx;
                let h1 = h01 * (1.0 - fx) + h11 * fx;
                let height = h0 * (1.0 - fy) + h1 * fy;
                
                // Apply fitness-based amplification
                let amplified_height = height * (0.5 + genome.fitness * 0.5);
                
                let idx = y * TERRAIN_HEIGHTMAP_SIZE + x;
                heights[idx] = amplified_height;
                
                // Interpolate color
                let c00 = genome.get_pixel(x0, y0);
                let c10 = genome.get_pixel(x1, y0);
                let c01 = genome.get_pixel(x0, y1);
                let c11 = genome.get_pixel(x1, y1);
                
                colors[idx] = [
                    Self::interpolate_color(c00[0], c10[0], c01[0], c11[0], fx, fy),
                    Self::interpolate_color(c00[1], c10[1], c01[1], c11[1], fx, fy),
                    Self::interpolate_color(c00[2], c10[2], c01[2], c11[2], fx, fy),
                    255,
                ];
            }
        }
        
        // Calculate normals from heightmap
        let normals = Self::calculate_normals(&heights);
        
        Self {
            heights,
            normals,
            colors,
            generation: genome.generation,
            fitness: genome.fitness,
            species: genome.species.clone(),
        }
    }
    
    fn interpolate_color(c00: u8, c10: u8, c01: u8, c11: u8, fx: f32, fy: f32) -> u8 {
        let c0 = c00 as f32 * (1.0 - fx) + c10 as f32 * fx;
        let c1 = c01 as f32 * (1.0 - fx) + c11 as f32 * fx;
        (c0 * (1.0 - fy) + c1 * fy) as u8
    }
    
    fn calculate_normals(heights: &[f32]) -> Vec<[f32; 3]> {
        let mut normals = vec![[0.0f32; 3]; TERRAIN_HEIGHTMAP_SIZE * TERRAIN_HEIGHTMAP_SIZE];
        
        for y in 0..TERRAIN_HEIGHTMAP_SIZE {
            for x in 0..TERRAIN_HEIGHTMAP_SIZE {
                // Sample neighbors for normal calculation
                let left = if x > 0 { heights[y * TERRAIN_HEIGHTMAP_SIZE + (x - 1)] } else { heights[y * TERRAIN_HEIGHTMAP_SIZE + x] };
                let right = if x < TERRAIN_HEIGHTMAP_SIZE - 1 { heights[y * TERRAIN_HEIGHTMAP_SIZE + (x + 1)] } else { heights[y * TERRAIN_HEIGHTMAP_SIZE + x] };
                let up = if y > 0 { heights[(y - 1) * TERRAIN_HEIGHTMAP_SIZE + x] } else { heights[y * TERRAIN_HEIGHTMAP_SIZE + x] };
                let down = if y < TERRAIN_HEIGHTMAP_SIZE - 1 { heights[(y + 1) * TERRAIN_HEIGHTMAP_SIZE + x] } else { heights[y * TERRAIN_HEIGHTMAP_SIZE + x] };
                
                // Calculate gradient
                let dx = (right - left) * 0.5;
                let dy = (down - up) * 0.5;
                
                // Normal vector (pointing up)
                let normal = [-dx, 1.0, -dy];
                
                // Normalize
                let len = (normal[0] * normal[0] + normal[1] * normal[1] + normal[2] * normal[2]).sqrt();
                if len > 0.0 {
                    normals[y * TERRAIN_HEIGHTMAP_SIZE + x] = [
                        normal[0] / len,
                        normal[1] / len,
                        normal[2] / len,
                    ];
                } else {
                    normals[y * TERRAIN_HEIGHTMAP_SIZE + x] = [0.0, 1.0, 0.0];
                }
            }
        }
        
        normals
    }
    
    /// Get height at a specific coordinate
    pub fn get_height(&self, x: usize, y: usize) -> f32 {
        self.heights[y * TERRAIN_HEIGHTMAP_SIZE + x]
    }
    
    /// Get color at a specific coordinate
    pub fn get_color(&self, x: usize, y: usize) -> [u8; 4] {
        self.colors[y * TERRAIN_HEIGHTMAP_SIZE + x]
    }
}

/// GPU-ready evolution terrain data
pub struct EvolutionTerrainGPU {
    /// Heightmap texture
    pub heightmap_texture: wgpu::Texture,
    pub heightmap_view: wgpu::TextureView,
    /// Color texture
    pub color_texture: wgpu::Texture,
    pub color_view: wgpu::TextureView,
    /// Sampler
    pub sampler: wgpu::Sampler,
    /// Uniform buffer for terrain parameters
    pub uniform_buffer: wgpu::Buffer,
    /// Generation info
    pub generation: u64,
    pub fitness: f32,
}

impl EvolutionTerrainGPU {
    /// Create GPU resources from a heightmap
    pub fn from_heightmap(
        device: &wgpu::Device,
        queue: &wgpu::Queue,
        heightmap: &EvolutionTerrainHeightmap,
    ) -> Self {
        let texture_size = wgpu::Extent3d {
            width: TERRAIN_HEIGHTMAP_SIZE as u32,
            height: TERRAIN_HEIGHTMAP_SIZE as u32,
            depth_or_array_layers: 1,
        };
        
        // Create heightmap texture (R32Float for precision)
        let heightmap_texture = device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Evolution Heightmap Texture"),
            size: texture_size,
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::R32Float,
            usage: wgpu::TextureUsages::TEXTURE_BINDING | wgpu::TextureUsages::COPY_DST,
            view_formats: &[],
        });
        
        let heightmap_view = heightmap_texture.create_view(&wgpu::TextureViewDescriptor::default());
        
        // Upload height data
        queue.write_texture(
            wgpu::ImageCopyTexture {
                texture: &heightmap_texture,
                mip_level: 0,
                origin: wgpu::Origin3d::ZERO,
                aspect: wgpu::TextureAspect::All,
            },
            bytemuck::cast_slice(&heightmap.heights),
            wgpu::ImageDataLayout {
                offset: 0,
                bytes_per_row: Some(4 * TERRAIN_HEIGHTMAP_SIZE as u32),
                rows_per_image: Some(TERRAIN_HEIGHTMAP_SIZE as u32),
            },
            texture_size,
        );
        
        // Create color texture (RGBA8)
        let color_texture = device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Evolution Color Texture"),
            size: texture_size,
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8UnormSrgb,
            usage: wgpu::TextureUsages::TEXTURE_BINDING | wgpu::TextureUsages::COPY_DST,
            view_formats: &[],
        });
        
        let color_view = color_texture.create_view(&wgpu::TextureViewDescriptor::default());
        
        // Flatten colors for upload
        let color_bytes: Vec<u8> = heightmap.colors.iter().flat_map(|c| c.iter().cloned()).collect();
        
        queue.write_texture(
            wgpu::ImageCopyTexture {
                texture: &color_texture,
                mip_level: 0,
                origin: wgpu::Origin3d::ZERO,
                aspect: wgpu::TextureAspect::All,
            },
            &color_bytes,
            wgpu::ImageDataLayout {
                offset: 0,
                bytes_per_row: Some(4 * TERRAIN_HEIGHTMAP_SIZE as u32),
                rows_per_image: Some(TERRAIN_HEIGHTMAP_SIZE as u32),
            },
            texture_size,
        );
        
        // Create sampler
        let sampler = device.create_sampler(&wgpu::SamplerDescriptor {
            address_mode_u: wgpu::AddressMode::ClampToEdge,
            address_mode_v: wgpu::AddressMode::ClampToEdge,
            address_mode_w: wgpu::AddressMode::ClampToEdge,
            mag_filter: wgpu::FilterMode::Linear,
            min_filter: wgpu::FilterMode::Linear,
            mipmap_filter: wgpu::FilterMode::Linear,
            ..Default::default()
        });
        
        // Create uniform buffer
        #[repr(C)]
        #[derive(Copy, Clone, bytemuck::Pod, bytemuck::Zeroable)]
        struct TerrainUniforms {
            generation: u32,
            fitness: f32,
            height_scale: f32,
            padding: f32,
        }
        
        let uniforms = TerrainUniforms {
            generation: heightmap.generation as u32,
            fitness: heightmap.fitness,
            height_scale: 50.0,
            padding: 0.0,
        };
        
        let uniform_buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("Evolution Terrain Uniforms"),
            contents: bytemuck::cast_slice(&[uniforms]),
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
        });
        
        Self {
            heightmap_texture,
            heightmap_view,
            color_texture,
            color_view,
            sampler,
            uniform_buffer,
            generation: heightmap.generation,
            fitness: heightmap.fitness,
        }
    }
    
    /// Update the heightmap with new data
    pub fn update_heightmap(
        &self,
        queue: &wgpu::Queue,
        heightmap: &EvolutionTerrainHeightmap,
    ) {
        let texture_size = wgpu::Extent3d {
            width: TERRAIN_HEIGHTMAP_SIZE as u32,
            height: TERRAIN_HEIGHTMAP_SIZE as u32,
            depth_or_array_layers: 1,
        };
        
        queue.write_texture(
            wgpu::ImageCopyTexture {
                texture: &self.heightmap_texture,
                mip_level: 0,
                origin: wgpu::Origin3d::ZERO,
                aspect: wgpu::TextureAspect::All,
            },
            bytemuck::cast_slice(&heightmap.heights),
            wgpu::ImageDataLayout {
                offset: 0,
                bytes_per_row: Some(4 * TERRAIN_HEIGHTMAP_SIZE as u32),
                rows_per_image: Some(TERRAIN_HEIGHTMAP_SIZE as u32),
            },
            texture_size,
        );
        
        // Update colors too
        let color_bytes: Vec<u8> = heightmap.colors.iter().flat_map(|c| c.iter().cloned()).collect();
        
        queue.write_texture(
            wgpu::ImageCopyTexture {
                texture: &self.color_texture,
                mip_level: 0,
                origin: wgpu::Origin3d::ZERO,
                aspect: wgpu::TextureAspect::All,
            },
            &color_bytes,
            wgpu::ImageDataLayout {
                offset: 0,
                bytes_per_row: Some(4 * TERRAIN_HEIGHTMAP_SIZE as u32),
                rows_per_image: Some(TERRAIN_HEIGHTMAP_SIZE as u32),
            },
            texture_size,
        );
    }
}

/// The main bridge that connects evolution to terrain
pub struct EvolutionTerrainBridge {
    /// Current genome being displayed
    pub current_genome: Option<EvolutionGenome>,
    /// Current heightmap
    pub current_heightmap: Option<EvolutionTerrainHeightmap>,
    /// GPU resources
    pub gpu_resources: Option<EvolutionTerrainGPU>,
    /// History of genomes for phylogenetic display
    pub genome_history: Vec<EvolutionGenome>,
    /// Maximum history size
    pub max_history: usize,
    /// Bridge state
    pub is_active: bool,
    /// Auto-update interval (ms)
    pub update_interval_ms: u64,
    /// Last update time
    pub last_update: std::time::Instant,
}

impl EvolutionTerrainBridge {
    /// Create a new bridge
    pub fn new() -> Self {
        Self {
            current_genome: None,
            current_heightmap: None,
            gpu_resources: None,
            genome_history: Vec::new(),
            max_history: 100,
            is_active: true,
            update_interval_ms: 1000,
            last_update: std::time::Instant::now(),
        }
    }
    
    /// Submit a new genome to the bridge
    pub fn submit_genome(&mut self, genome: EvolutionGenome) {
        // Add to history
        self.genome_history.push(genome.clone());
        if self.genome_history.len() > self.max_history {
            self.genome_history.remove(0);
        }
        
        self.current_genome = Some(genome);
        
        // Generate heightmap
        if let Some(ref genome) = self.current_genome {
            self.current_heightmap = Some(EvolutionTerrainHeightmap::from_genome(genome));
        }
        
        self.last_update = std::time::Instant::now();
    }
    
    /// Initialize GPU resources
    pub fn initialize_gpu(
        &mut self,
        device: &wgpu::Device,
        queue: &wgpu::Queue,
    ) {
        if let Some(ref heightmap) = self.current_heightmap {
            self.gpu_resources = Some(EvolutionTerrainGPU::from_heightmap(device, queue, heightmap));
        }
    }
    
    /// Update GPU resources with current heightmap
    pub fn update_gpu(&self, queue: &wgpu::Queue) {
        if let (Some(ref gpu), Some(ref heightmap)) = (&self.gpu_resources, &self.current_heightmap) {
            gpu.update_heightmap(queue, heightmap);
        }
    }
    
    /// Check if update is needed based on interval
    pub fn should_update(&self) -> bool {
        self.last_update.elapsed().as_millis() as u64 >= self.update_interval_ms
    }
    
    /// Get the current genome ID
    pub fn get_current_genome_id(&self) -> Option<&str> {
        self.current_genome.as_ref().map(|g| g.id.as_str())
    }
    
    /// Get fitness of current genome
    pub fn get_current_fitness(&self) -> f32 {
        self.current_genome.as_ref().map(|g| g.fitness).unwrap_or(0.0)
    }
    
    /// Generate a demo genome for testing
    pub fn generate_demo_genome(&self) -> EvolutionGenome {
        let mut pixels = Vec::with_capacity(EVOLUTION_CANVAS_SIZE * EVOLUTION_CANVAS_SIZE * 4);
        
        // Create a pattern based on Perlin-like noise
        for y in 0..EVOLUTION_CANVAS_SIZE {
            for x in 0..EVOLUTION_CANVAS_SIZE {
                let fx = x as f32 / EVOLUTION_CANVAS_SIZE as f32;
                let fy = y as f32 / EVOLUTION_CANVAS_SIZE as f32;
                
                // Simple pattern: concentric circles
                let dist = ((fx - 0.5).powi(2) + (fy - 0.5).powi(2)).sqrt();
                let value = ((dist * 10.0).sin() * 0.5 + 0.5) * 255.0;
                
                // Color based on position
                let r = (fx * 255.0) as u8;
                let g = (fy * 255.0) as u8;
                let b = value as u8;
                
                pixels.push(r);
                pixels.push(g);
                pixels.push(b);
                pixels.push(255);
            }
        }
        
        EvolutionGenome {
            pixels,
            generation: 1,
            fitness: 0.75,
            species: "demo_pattern".to_string(),
            map_position: (0, 0),
            id: "demo_001".to_string(),
        }
    }
}

impl Default for EvolutionTerrainBridge {
    fn default() -> Self {
        Self::new()
    }
}

// Thread-safe wrapper
pub type SharedEvolutionTerrainBridge = Arc<Mutex<EvolutionTerrainBridge>>;

/// Create a shared bridge instance
pub fn create_shared_bridge() -> SharedEvolutionTerrainBridge {
    Arc::new(Mutex::new(EvolutionTerrainBridge::new()))
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_genome_creation() {
        let pixels = vec![128u8; EVOLUTION_CANVAS_SIZE * EVOLUTION_CANVAS_SIZE * 4];
        let genome = EvolutionGenome::from_pixels(pixels, 1, 0.5);
        
        assert_eq!(genome.generation, 1);
        assert_eq!(genome.fitness, 0.5);
        assert_eq!(genome.pixels.len(), 4096); // 32*32*4
    }
    
    #[test]
    fn test_heightmap_generation() {
        let pixels = vec![128u8; EVOLUTION_CANVAS_SIZE * EVOLUTION_CANVAS_SIZE * 4];
        let genome = EvolutionGenome::from_pixels(pixels, 1, 0.5);
        let heightmap = EvolutionTerrainHeightmap::from_genome(&genome);
        
        assert_eq!(heightmap.heights.len(), TERRAIN_HEIGHTMAP_SIZE * TERRAIN_HEIGHTMAP_SIZE);
        assert_eq!(heightmap.colors.len(), TERRAIN_HEIGHTMAP_SIZE * TERRAIN_HEIGHTMAP_SIZE);
    }
}