// Phase 39: Neural Terrain Mesh Generator
// Creates a grid mesh for rendering the 3D cognitive landscape

use wgpu::util::DeviceExt;

#[repr(C)]
#[derive(Copy, Clone, Debug, bytemuck::Pod, bytemuck::Zeroable)]
pub struct TerrainVertex {
    pub position: [f32; 3],
    pub uv: [f32; 2],
}

impl TerrainVertex {
    pub fn desc<'a>() -> wgpu::VertexBufferLayout<'a> {
        wgpu::VertexBufferLayout {
            array_stride: std::mem::size_of::<TerrainVertex>() as wgpu::BufferAddress,
            step_mode: wgpu::VertexStepMode::Vertex,
            attributes: &[
                // Position
                wgpu::VertexAttribute {
                    offset: 0,
                    shader_location: 0,
                    format: wgpu::VertexFormat::Float32x3,
                },
                // UV
                wgpu::VertexAttribute {
                    offset: std::mem::size_of::<[f32; 3]>() as wgpu::BufferAddress,
                    shader_location: 1,
                    format: wgpu::VertexFormat::Float32x2,
                },
            ],
        }
    }
}

#[repr(C)]
#[derive(Copy, Clone, Debug, bytemuck::Pod, bytemuck::Zeroable)]
pub struct TerrainConfig {
    pub height_scale: f32,
    pub terrain_size: f32,
    pub min_height: f32,
    pub max_height: f32,
}

impl Default for TerrainConfig {
    fn default() -> Self {
        Self {
            height_scale: 50.0,
            terrain_size: 1000.0,
            min_height: -10.0,
            max_height: 100.0,
        }
    }
}

pub struct NeuralTerrain {
    pub vertex_buffer: wgpu::Buffer,
    pub index_buffer: wgpu::Buffer,
    pub num_indices: u32,
    pub config_buffer: wgpu::Buffer,
    pub config: TerrainConfig,
    pub resolution: u32,
}

impl NeuralTerrain {
    /// Create a new neural terrain mesh
    /// 
    /// # Arguments
    /// * `device` - WGPU device
    /// * `resolution` - Grid resolution (e.g., 256 = 256x256 vertices)
    pub fn new(device: &wgpu::Device, resolution: u32) -> Self {
        let (vertices, indices) = Self::generate_grid(resolution);
        
        let vertex_buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("Neural Terrain Vertex Buffer"),
            contents: bytemuck::cast_slice(&vertices),
            usage: wgpu::BufferUsages::VERTEX,
        });
        
        let index_buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("Neural Terrain Index Buffer"),
            contents: bytemuck::cast_slice(&indices),
            usage: wgpu::BufferUsages::INDEX,
        });
        
        let config = TerrainConfig::default();
        let config_buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("Neural Terrain Config Buffer"),
            contents: bytemuck::cast_slice(&[config]),
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
        });
        
        Self {
            vertex_buffer,
            index_buffer,
            num_indices: indices.len() as u32,
            config_buffer,
            config,
            resolution,
        }
    }
    
    /// Generate a grid mesh for the terrain
    fn generate_grid(resolution: u32) -> (Vec<TerrainVertex>, Vec<u32>) {
        let mut vertices = Vec::new();
        let mut indices = Vec::new();
        
        // Generate vertices
        for z in 0..resolution {
            for x in 0..resolution {
                let u = x as f32 / (resolution - 1) as f32;
                let v = z as f32 / (resolution - 1) as f32;
                
                // Position will be displaced by shader based on cognitive state
                // Start with flat grid at y=0
                vertices.push(TerrainVertex {
                    position: [0.0, 0.0, 0.0], // Shader will set actual position
                    uv: [u, v],
                });
            }
        }
        
        // Generate indices (two triangles per quad)
        for z in 0..(resolution - 1) {
            for x in 0..(resolution - 1) {
                let top_left = z * resolution + x;
                let top_right = top_left + 1;
                let bottom_left = (z + 1) * resolution + x;
                let bottom_right = bottom_left + 1;
                
                // First triangle
                indices.push(top_left);
                indices.push(bottom_left);
                indices.push(top_right);
                
                // Second triangle
                indices.push(top_right);
                indices.push(bottom_left);
                indices.push(bottom_right);
            }
        }
        
        (vertices, indices)
    }
    
    /// Update terrain configuration
    pub fn update_config(&mut self, queue: &wgpu::Queue, config: TerrainConfig) {
        self.config = config;
        queue.write_buffer(&self.config_buffer, 0, bytemuck::cast_slice(&[config]));
    }
    
    /// Get the memory address at a given UV coordinate
    /// Uses Hilbert curve mapping to convert 2D position → 1D address
    pub fn uv_to_memory_address(&self, uv: (f32, f32)) -> u64 {
        // Convert UV to pixel coordinates
        let texture_size = 1024; // antigravity.pixelrts.png is 1024x1024
        let x = (uv.0 * texture_size as f32) as u32;
        let y = (uv.1 * texture_size as f32) as u32;
        
        // Convert to Hilbert index (this is "The Glass Drill")
        hilbert_xy2d(texture_size, x, y)
    }
}

/// Convert (x, y) coordinates to Hilbert curve distance
/// This is the inverse of the Hilbert mapping used in PixelRTS
fn hilbert_xy2d(n: u32, mut x: u32, mut y: u32) -> u64 {
    let mut d: u64 = 0;
    let mut s = n / 2;
    
    while s > 0 {
        let rx = ((x & s) > 0) as u32;
        let ry = ((y & s) > 0) as u32;
        d += (s * s) as u64 * ((3 * rx) ^ ry) as u64;
        
        // Rotate
        if ry == 0 {
            if rx == 1 {
                x = s - 1 - x;
                y = s - 1 - y;
            }
            std::mem::swap(&mut x, &mut y);
        }
        
        s /= 2;
    }
    
    d
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_hilbert_mapping() {
        // Test corner cases
        assert_eq!(hilbert_xy2d(1024, 0, 0), 0);
        assert_eq!(hilbert_xy2d(1024, 1023, 1023), 1024 * 1024 - 1);
        
        // Test that nearby pixels have nearby addresses (spatial locality)
        let addr1 = hilbert_xy2d(1024, 100, 100);
        let addr2 = hilbert_xy2d(1024, 101, 100);
        assert!((addr1 as i64 - addr2 as i64).abs() < 10);
    }
}
