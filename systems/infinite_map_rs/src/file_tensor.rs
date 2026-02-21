//! File Tensor - GPU Compute Shader Architecture for File Visualization
//!
//! This module implements "Tensor-Compute" architecture for file visualization.
//! Instead of CPU iteration (O(N)), we use GPU compute shaders (O(1) dispatch).
//!
//! Architecture:
//! - Raw file bytes → GPU StorageBuffer (linear tensor)
//! - Compute Shader → Geometric Fold (Hilbert curve mapping)
//! - Output → GPU Texture (2D visualization)
//!
//! Key Benefits:
//! - Zero CPU overhead: Rust acts as a dumb pipe
//! - Real-time: 60 FPS file visualization
//! - File Gallery Purity: Physical folding, not symbolic interpretation
//!
//! Phase 34: Filesystem Gallery
//! - Files visualized as geometric artifacts
//! - File type detection (text, binary, compressed, image)
//! - Pattern detection for structure visualization

use wgpu::{self, Device, Queue, Buffer, Texture, TextureView, ComputePipeline, BindGroup, BindGroupLayout};
use bytemuck::{Pod, Zeroable};
use std::mem;
use std::fs;
use std::path::{Path, PathBuf};
use std::time::SystemTime;

// ============================================
// FILE TYPE DETECTION
// ============================================

/// File type classification
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum FileType {
    /// Unknown file type
    Unknown,
    /// Text file (ASCII/UTF-8)
    Text,
    /// Binary file (executable, libraries, data)
    Binary,
    /// Compressed file (zip, gzip, etc.)
    Compressed,
    /// Image file (png, jpg, etc.)
    Image,
    /// Directory
    Directory,
}

impl FileType {
    /// Detect file type from file extension and content
    pub fn detect(path: &Path, content: &[u8]) -> Self {
        // Check if directory
        if path.is_dir() {
            return FileType::Directory;
        }
        
        // Check file extension
        let ext = path.extension()
            .and_then(|e| e.to_str())
            .map(|e| e.to_lowercase());
        
        match ext.as_deref() {
            Some("txt") | Some("md") | Some("rs") | Some("py") | Some("js") | 
            Some("json") | Some("yaml") | Some("yml") | Some("toml") |
            Some("html") | Some("css") | Some("xml") => FileType::Text,
            Some("zip") | Some("gz") | Some("bz2") | Some("xz") | 
            Some("7z") | Some("rar") | Some("tar") => FileType::Compressed,
            Some("png") | Some("jpg") | Some("jpeg") | Some("gif") | 
            Some("bmp") | Some("webp") | Some("svg") => FileType::Image,
            Some("exe") | Some("dll") | Some("so") | Some("dylib") |
            Some("bin") | Some("o") | Some("a") => FileType::Binary,
            _ => {
                // Fallback: analyze content
                Self::detect_from_content(content)
            }
        }
    }
    
    /// Detect file type from content analysis
    fn detect_from_content(content: &[u8]) -> Self {
        if content.is_empty() {
            return FileType::Unknown;
        }
        
        // Sample first 1024 bytes
        let sample_size = content.len().min(1024);
        let sample = &content[..sample_size];
        
        let mut ascii_count = 0;
        let mut zero_count = 0;
        
        for &byte in sample {
            if byte >= 32 && byte <= 126 || byte == b'\n' || byte == b'\r' || byte == b'\t' {
                ascii_count += 1;
            }
            if byte == 0 {
                zero_count += 1;
            }
        }
        
        let ascii_ratio = ascii_count as f32 / sample_size as f32;
        let zero_ratio = zero_count as f32 / sample_size as f32;
        
        if ascii_ratio > 0.8 {
            FileType::Text
        } else if zero_ratio > 0.3 {
            FileType::Compressed
        } else {
            FileType::Binary
        }
    }
    
    /// Convert to u32 for shader
    pub fn as_u32(&self) -> u32 {
        match self {
            FileType::Unknown => 0,
            FileType::Text => 1,
            FileType::Binary => 2,
            FileType::Compressed => 3,
            FileType::Image => 4,
            FileType::Directory => 5,
        }
    }
    
    /// Get color hint for this file type
    pub fn color_hint(&self) -> (f32, f32, f32) {
        match self {
            FileType::Text => (0.2, 0.8, 0.3),      // Greenish
            FileType::Binary => (0.9, 0.3, 0.3),    // Reddish
            FileType::Compressed => (0.3, 0.5, 0.9),  // Bluish
            FileType::Image => (0.9, 0.7, 0.2),     // Yellowish
            FileType::Directory => (0.9, 0.9, 0.2),   // Yellow
            FileType::Unknown => (0.5, 0.5, 0.5),    // Gray
        }
    }
}

// ============================================
// CONFIGURATION
// ============================================

/// Configuration for file tensor folding
#[derive(Debug, Clone)]
pub struct FileTensorConfig {
    /// Texture width (must be power of 2 for Hilbert curve)
    pub width: u32,
    /// Texture height (must be power of 2 for Hilbert curve)
    pub height: u32,
    /// Order of Hilbert curve (N = 2^order)
    pub hilbert_order: u32,
    /// Color encoding mode
    pub color_mode: FileColorMode,
    /// Brightness adjustment (0.0 - 2.0, 1.0 = normal)
    pub brightness: f32,
    /// Contrast adjustment (0.0 - 2.0, 1.0 = normal)
    pub contrast: f32,
}

impl Default for FileTensorConfig {
    fn default() -> Self {
        Self {
            width: 512,
            height: 512,
            hilbert_order: 9,  // 2^9 = 512
            color_mode: FileColorMode::MultiChannel,
            brightness: 1.0,
            contrast: 1.0,
        }
    }
}

/// Color encoding modes for file visualization
#[derive(Debug, Clone, Copy, PartialEq)]
pub enum FileColorMode {
    /// Heatmap: blue → cyan → green → yellow → red
    Heatmap,
    /// Entropy-based: low entropy=blue, high entropy=red
    Entropy,
    /// Structure-based: highlights patterns and repetitions
    Structure,
    /// Multi-channel: combines file type, entropy, and structure
    MultiChannel,
}

impl FileColorMode {
    pub fn as_u32(&self) -> u32 {
        match self {
            FileColorMode::Heatmap => 0,
            FileColorMode::Entropy => 1,
            FileColorMode::Structure => 2,
            FileColorMode::MultiChannel => 3,
        }
    }
}

/// File metadata parameters for visualization
#[derive(Debug, Clone)]
pub struct FileParams {
    /// Calculated entropy of file
    pub entropy: f32,
    /// Ratio of ASCII bytes
    pub ascii_ratio: f32,
    /// Ratio of zero bytes
    pub zero_ratio: f32,
    /// Pattern repetition score
    pub pattern_score: f32,
}

impl Default for FileParams {
    fn default() -> Self {
        Self {
            entropy: 0.0,
            ascii_ratio: 0.0,
            zero_ratio: 0.0,
            pattern_score: 0.0,
        }
    }
}

/// File metadata
#[derive(Debug, Clone)]
pub struct FileMetadata {
    /// File path
    pub path: PathBuf,
    /// File size in bytes
    pub size: u64,
    /// File type
    pub file_type: FileType,
    /// Last modified time
    pub last_modified: SystemTime,
    /// File parameters for visualization
    pub params: FileParams,
}

impl FileMetadata {
    /// Create file metadata from path
    pub fn from_path(path: &Path) -> Result<Self, String> {
        let metadata = fs::metadata(path)
            .map_err(|e| format!("Failed to read metadata for {}: {}", path.display(), e))?;
        
        let size = metadata.len();
        let last_modified = metadata.modified()
            .unwrap_or(SystemTime::UNIX_EPOCH);
        
        let file_type = if path.is_dir() {
            FileType::Directory
        } else {
            let content = if size > 0 && size < 1024 * 1024 {
                // Read first 1KB for type detection
                fs::read(path).unwrap_or_default()
            } else {
                Vec::new()
            };
            FileType::detect(path, &content)
        };
        
        let params = if path.is_file() && size > 0 && size < 10 * 1024 * 1024 {
            // Calculate params for files < 10MB
            let content = fs::read(path)
                .map_err(|e| format!("Failed to read file {}: {}", path.display(), e))?;
            FileParams::calculate(&content)
        } else {
            FileParams::default()
        };
        
        Ok(Self {
            path: path.to_path_buf(),
            size,
            file_type,
            last_modified,
            params,
        })
    }
}

impl FileParams {
    /// Calculate file parameters from content
    pub fn calculate(content: &[u8]) -> Self {
        if content.is_empty() {
            return Self::default();
        }
        
        // Sample first 4096 bytes for analysis
        let sample_size = content.len().min(4096);
        let sample = &content[..sample_size];
        
        let mut ascii_count = 0u32;
        let mut zero_count = 0u32;
        let mut freq = [0u32; 256];
        
        for &byte in sample {
            freq[byte as usize] += 1;
            
            if byte >= 32 && byte <= 126 || byte == b'\n' || byte == b'\r' || byte == b'\t' {
                ascii_count += 1;
            }
            if byte == 0 {
                zero_count += 1;
            }
        }
        
        let ascii_ratio = ascii_count as f32 / sample_size as f32;
        let zero_ratio = zero_count as f32 / sample_size as f32;
        
        // Calculate Shannon entropy
        let mut entropy = 0.0f32;
        for &count in &freq {
            if count > 0 {
                let p = count as f32 / sample_size as f32;
                entropy -= p * p.log2();
            }
        }
        
        // Detect pattern repetition (simple 4-byte pattern check)
        let mut pattern_score = 0.0f32;
        if sample_size >= 16 {
            let pattern = u32::from_le_bytes([sample[0], sample[1], sample[2], sample[3]]);
            let mut repeats = 0u32;
            
            for i in (0..sample_size - 4).step_by(4) {
                if u32::from_le_bytes([sample[i], sample[i+1], sample[i+2], sample[i+3]]) == pattern {
                    repeats += 1;
                }
            }
            
            pattern_score = (repeats as f32) / (sample_size as f32 / 4.0);
        }
        
        Self {
            entropy,
            ascii_ratio,
            zero_ratio,
            pattern_score,
        }
    }
}

// ============================================
// FILE TENSOR FOLDER
// ============================================

/// Main struct for file tensor folding
pub struct FileTensorFolder {
    // GPU Resources
    input_buffer: Buffer,
    output_buffer: Buffer,
    output_texture: Texture,
    output_texture_view: TextureView,
    
    // Compute Pipeline
    compute_pipeline: ComputePipeline,
    bind_group_layout: BindGroupLayout,
    bind_group: BindGroup,
    
    // Uniform buffers
    config_buffer: Buffer,
    file_params_buffer: Buffer,
    
    // Configuration
    config: FileTensorConfig,
    
    // File metadata
    metadata: FileMetadata,
    
    // State
    last_dispatch: std::time::Instant,
    dispatch_count: u64,
}

impl FileTensorFolder {
    /// Create a new file tensor folder
    pub fn new(device: &Device, config: FileTensorConfig, metadata: FileMetadata) -> Result<Self, String> {
        // Validate configuration
        if !config.width.is_power_of_two() || !config.height.is_power_of_two() {
            return Err("Width and height must be powers of 2 for Hilbert curve".to_string());
        }
        
        let texture_size = (config.width * config.height) as usize;
        
        // Create input buffer (storage buffer for raw file bytes)
        // We use u32 to pack 4 bytes per element for efficiency
        let input_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("File Tensor Input Buffer"),
            size: (texture_size * mem::size_of::<u32>()) as u64,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });
        
        // Create output buffer (for compute shader output)
        let output_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("File Tensor Output Buffer"),
            size: (texture_size * mem::size_of::<[f32; 4]>()) as u64,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_SRC | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });
        
        // Create output texture (for rendering)
        let output_texture = device.create_texture(&wgpu::TextureDescriptor {
            label: Some("File Tensor Output Texture"),
            size: wgpu::Extent3d {
                width: config.width,
                height: config.height,
                depth_or_array_layers: 1,
            },
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba32Float,
            usage: wgpu::TextureUsages::TEXTURE_BINDING | wgpu::TextureUsages::COPY_DST | wgpu::TextureUsages::STORAGE_BINDING,
            view_formats: &[],
        });
        
        let output_texture_view = output_texture.create_view(&wgpu::TextureViewDescriptor::default());
        
        // Load compute shader
        let shader_module = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("File Fold Compute Shader"),
            source: wgpu::ShaderSource::Wgsl(include_str!("../shaders/file_fold.wgsl").into()),
        });
        
        // Create bind group layout
        let bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("File Tensor Bind Group Layout"),
            entries: &[
                // Input file buffer
                wgpu::BindGroupLayoutEntry {
                    binding: 0,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: true },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // Output texture buffer
                wgpu::BindGroupLayoutEntry {
                    binding: 1,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // Fold config uniform
                wgpu::BindGroupLayoutEntry {
                    binding: 2,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Uniform,
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // File params uniform
                wgpu::BindGroupLayoutEntry {
                    binding: 3,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Uniform,
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
            ],
        });
        
        // Create uniform buffers
        let config_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("File Fold Config Buffer"),
            size: mem::size_of::<FileFoldConfigUniform>() as u64,
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });
        
        let file_params_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("File Params Buffer"),
            size: mem::size_of::<FileParamsUniform>() as u64,
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });
        
        // Create compute pipeline
        let compute_pipeline = device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("File Tensor Compute Pipeline"),
            layout: Some(&device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
                label: Some("File Tensor Pipeline Layout"),
                bind_group_layouts: &[&bind_group_layout],
                push_constant_ranges: &[],
            })),
            module: &shader_module,
            entry_point: "main",
        });
        
        // Create bind group
        let bind_group = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("File Tensor Bind Group"),
            layout: &bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: input_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: output_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 2,
                    resource: config_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 3,
                    resource: file_params_buffer.as_entire_binding(),
                },
            ],
        });
        
        Ok(Self {
            input_buffer,
            output_buffer,
            output_texture,
            output_texture_view,
            compute_pipeline,
            bind_group_layout,
            bind_group,
            config_buffer,
            file_params_buffer,
            config,
            metadata,
            last_dispatch: std::time::Instant::now(),
            dispatch_count: 0,
        })
    }
    
    /// Upload file bytes to GPU and dispatch compute shader
    /// 
    /// This is the core "dumb pipe" operation:
    /// 1. Copy raw bytes to GPU buffer
    /// 2. Dispatch compute shader (O(1) operation)
    /// 3. GPU folds file into texture in parallel
    pub fn fold_file(&mut self, device: &Device, queue: &Queue, file_bytes: &[u8]) -> Result<(), String> {
        // Pack bytes into u32 for efficiency (4 bytes per u32)
        let packed_data: Vec<u32> = file_bytes
            .chunks(4)
            .map(|chunk| {
                let mut bytes = [0u8; 4];
                bytes[..chunk.len()].copy_from_slice(chunk);
                u32::from_le_bytes(bytes)
            })
            .collect();
        
        // Upload to GPU (single memory copy)
        queue.write_buffer(&self.input_buffer, 0, bytemuck::cast_slice(&packed_data));
        
        // Update uniform buffers
        self.update_uniforms(queue);
        
        // Dispatch compute shader
        // Workgroup size is 16x16, so we need ceil(width/16) x ceil(height/16) workgroups
        let workgroups_x = (self.config.width + 15) / 16;
        let workgroups_y = (self.config.height + 15) / 16;
        
        // Create command encoder
        let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
            label: Some("File Tensor Encoder"),
        });
        
        {
            let mut compute_pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                label: Some("File Tensor Compute Pass"),
                timestamp_writes: None,
            });
            
            compute_pass.set_pipeline(&self.compute_pipeline);
            compute_pass.set_bind_group(0, &self.bind_group, &[]);
            compute_pass.dispatch_workgroups(workgroups_x, workgroups_y, 1);
        }
        
        // Copy output buffer to texture for rendering
        encoder.copy_buffer_to_texture(
            wgpu::ImageCopyBuffer {
                buffer: &self.output_buffer,
                layout: wgpu::ImageDataLayout {
                    offset: 0,
                    bytes_per_row: Some(self.config.width * 16), // 4 channels * 4 bytes per float
                    rows_per_image: None,
                },
            },
            wgpu::ImageCopyTexture {
                texture: &self.output_texture,
                mip_level: 0,
                origin: wgpu::Origin3d::ZERO,
                aspect: wgpu::TextureAspect::All,
            },
            wgpu::Extent3d {
                width: self.config.width,
                height: self.config.height,
                depth_or_array_layers: 1,
            },
        );
        
        queue.submit(Some(encoder.finish()));
        
        self.last_dispatch = std::time::Instant::now();
        self.dispatch_count += 1;
        
        Ok(())
    }
    
    /// Update configuration
    pub fn set_config(&mut self, config: FileTensorConfig) {
        self.config = config;
    }
    
    /// Get output texture view for rendering
    pub fn texture_view(&self) -> &TextureView {
        &self.output_texture_view
    }
    
    /// Get output texture
    pub fn texture(&self) -> &Texture {
        &self.output_texture
    }
    
    /// Get texture dimensions
    pub fn size(&self) -> (u32, u32) {
        (self.config.width, self.config.height)
    }
    
    /// Get file metadata
    pub fn metadata(&self) -> &FileMetadata {
        &self.metadata
    }
    
    /// Get dispatch statistics
    pub fn dispatch_stats(&self) -> DispatchStats {
        DispatchStats {
            total_dispatches: self.dispatch_count,
            time_since_last_dispatch: self.last_dispatch.elapsed(),
            average_dispatch_time: std::time::Duration::from_millis(0), // TODO: Track actual timing
        }
    }
    
    /// Update uniform buffers with current configuration
    fn update_uniforms(&self, queue: &Queue) {
        let config_uniform = FileFoldConfigUniform {
            texture_width: self.config.width,
            texture_height: self.config.height,
            hilbert_order: self.config.hilbert_order,
            file_size: self.metadata.size as u32,
            file_type: self.metadata.file_type.as_u32(),
            color_mode: self.config.color_mode.as_u32(),
            brightness: self.config.brightness,
            contrast: self.config.contrast,
        };
        
        let params_uniform = FileParamsUniform {
            entropy: self.metadata.params.entropy,
            ascii_ratio: self.metadata.params.ascii_ratio,
            zero_ratio: self.metadata.params.zero_ratio,
            pattern_score: self.metadata.params.pattern_score,
        };
        
        queue.write_buffer(&self.config_buffer, 0, bytemuck::bytes_of(&config_uniform));
        queue.write_buffer(&self.file_params_buffer, 0, bytemuck::bytes_of(&params_uniform));
    }
}

// ============================================
// UNIFORM STRUCTS (matching WGSL)
// ============================================

#[repr(C)]
#[derive(Debug, Clone, Copy, bytemuck::Pod, bytemuck::Zeroable)]
struct FileFoldConfigUniform {
    texture_width: u32,
    texture_height: u32,
    hilbert_order: u32,
    file_size: u32,
    file_type: u32,
    color_mode: u32,
    brightness: f32,
    contrast: f32,
}

#[repr(C)]
#[derive(Debug, Clone, Copy, bytemuck::Pod, bytemuck::Zeroable)]
struct FileParamsUniform {
    entropy: f32,
    ascii_ratio: f32,
    zero_ratio: f32,
    pattern_score: f32,
}

// ============================================
// STATISTICS
// ============================================

#[derive(Debug, Clone)]
pub struct DispatchStats {
    pub total_dispatches: u64,
    pub time_since_last_dispatch: std::time::Duration,
    pub average_dispatch_time: std::time::Duration,
}

// ============================================
// HELPER FUNCTIONS
// ============================================

/// Read file bytes
pub fn read_file_bytes(path: &Path) -> Result<Vec<u8>, String> {
    fs::read(path)
        .map_err(|e| format!("Failed to read file {}: {}", path.display(), e))
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_file_type_detection() {
        // Text file
        let text_content = b"Hello, World!\nThis is a text file.\n";
        assert_eq!(FileType::detect(Path::new("test.txt"), text_content), FileType::Text);
        
        // Binary file
        let binary_content = vec![0x7f, b'E', b'L', b'F', 0x02, 0x01, 0x01, 0x00];
        assert_eq!(FileType::detect(Path::new("test.bin"), &binary_content), FileType::Binary);
        
        // Compressed file (lots of zeros)
        let compressed_content = vec![0u8; 1024];
        assert_eq!(FileType::detect(Path::new("test.gz"), &compressed_content), FileType::Compressed);
    }
    
    #[test]
    fn test_file_params_calculation() {
        let content = b"AAAA\nBBBB\nCCCC\nDDDD\n";
        let params = FileParams::calculate(content);
        
        assert!(params.ascii_ratio > 0.8); // Mostly ASCII
        assert!(params.zero_ratio < 0.1);   // Few zeros
        assert!(params.entropy > 0.0);     // Some entropy
    }
    
    #[test]
    fn test_default_config() {
        let config = FileTensorConfig::default();
        assert_eq!(config.width, 512);
        assert_eq!(config.height, 512);
        assert_eq!(config.hilbert_order, 9);
        assert!(config.width.is_power_of_two());
        assert!(config.height.is_power_of_two());
    }
    
    #[test]
    fn test_file_color_mode_conversion() {
        assert_eq!(FileColorMode::Heatmap.as_u32(), 0);
        assert_eq!(FileColorMode::Entropy.as_u32(), 1);
        assert_eq!(FileColorMode::Structure.as_u32(), 2);
        assert_eq!(FileColorMode::MultiChannel.as_u32(), 3);
    }
    
    #[test]
    fn test_file_type_as_u32() {
        assert_eq!(FileType::Unknown.as_u32(), 0);
        assert_eq!(FileType::Text.as_u32(), 1);
        assert_eq!(FileType::Binary.as_u32(), 2);
        assert_eq!(FileType::Compressed.as_u32(), 3);
        assert_eq!(FileType::Image.as_u32(), 4);
        assert_eq!(FileType::Directory.as_u32(), 5);
    }
}
