//! Memory Tensor - GPU Compute Shader Architecture
//!
//! This module implements the "Tensor-Compute" architecture for memory visualization.
//! Instead of CPU iteration (O(N)), we use GPU compute shaders (O(1) dispatch).
//!
//! Architecture:
//! - Raw memory bytes → GPU StorageBuffer (linear tensor)
//! - Compute Shader → Geometric Fold (Hilbert curve mapping)
//! - Output → GPU Texture (2D visualization)
//!
//! Key Benefits:
//! - Zero CPU overhead: Rust acts as a dumb pipe
//! - Real-time: 60 FPS memory visualization
//! - Glass Box Purity: Physical folding, not symbolic interpretation
//!
//! V2 Spatial Brick Format (Phase 33):
//! - Header size: 132 bytes (updated from 128 bytes)
//! - Supports semantic bit flags for content classification
//! - Hilbert curve folded textures for locality preservation

use wgpu::{self, Device, Queue, Buffer, Texture, TextureView, ComputePipeline, BindGroup, BindGroupLayout};
use bytemuck::{Pod, Zeroable};
use std::mem;
use std::fs::File;
use std::io::{Read, Write};
use std::path::Path;
use base64::prelude::*;
use flate2::read::ZlibDecoder;
use flate2::write::ZlibEncoder;
use flate2::Compression;
use std::collections::HashMap;

// Phase 42: Hybrid DNA Support

// ============================================
// V2 SPATIAL BRICK FORMAT (Phase 33)
// ============================================

/// V2 Spatial Brick file header (132 bytes total)
///
/// This header matches the Python specification in tensor_fold.py.
/// Critical: Header size is 132 bytes, not 128 bytes.
#[repr(C, packed)]
#[derive(Debug, Clone, Copy)]
pub struct V2BrickHeader {
    /// Magic number: "V2BR" (4 bytes)
    pub magic: [u8; 4],
    /// Format version (4 bytes)
    pub version: u32,
    /// Texture width - power of 2 (4 bytes)
    pub texture_width: u32,
    /// Texture height - power of 2 (4 bytes)
    pub texture_height: u32,
    /// Hilbert curve order (4 bytes)
    pub hilbert_order: u32,
    /// Original memory size (8 bytes)
    pub original_size: u64,
    /// Compressed data size (8 bytes)
    pub compressed_size: u64,
    /// Entropy value (4 bytes)
    pub entropy: f32,
    /// SHA-256 hash (truncated to 48 bytes)
    pub hash: [u8; 48],
    /// Semantic bit flags (4 bytes)
    pub flags: u32,
    /// Reserved for future use (40 bytes)
    pub reserved: [u8; 40],
}

unsafe impl Zeroable for V2BrickHeader {}
unsafe impl Pod for V2BrickHeader {}

impl V2BrickHeader {
    /// Expected magic number for V2 brick files
    pub const MAGIC: [u8; 4] = *b"V2BR";
    
    /// Current format version
    pub const VERSION: u32 = 1;
    
    /// Total header size in bytes (CRITICAL: 132 bytes, not 128)
    pub const HEADER_SIZE: usize = 132;
    
    /// Create a new V2 brick header
    pub fn new(texture_width: u32, texture_height: u32, hilbert_order: u32,
               original_size: u64, compressed_size: u64, entropy: f32,
               hash: [u8; 48], flags: u32) -> Self {
        Self {
            magic: Self::MAGIC,
            version: Self::VERSION,
            texture_width,
            texture_height,
            hilbert_order,
            original_size,
            compressed_size,
            entropy,
            hash,
            flags,
            reserved: [0u8; 40],
        }
    }
    
    /// Validate the header
    pub fn validate(&self) -> Result<(), String> {
        if self.magic != Self::MAGIC {
            return Err(format!("Invalid magic number: expected {:?}, got {:?}", 
                              Self::MAGIC, self.magic));
        }
        
        let v = self.version;
        if v != Self::VERSION {
            return Err(format!("Unsupported version: expected {}, got {}", 
                              Self::VERSION, v));
        }
        
        let w = self.texture_width;
        if !w.is_power_of_two() {
            return Err(format!("Texture width must be power of 2: got {}", 
                              w));
        }
        
        let h = self.texture_height;
        if !h.is_power_of_two() {
            return Err(format!("Texture height must be power of 2: got {}", 
                              h));
        }
        
        Ok(())
    }
}

/// Semantic bit flags for V2 brick files
#[derive(Debug, Clone, Copy)]
pub struct V2BrickFlags(u32);

impl V2BrickFlags {
    /// Bit 0: Has companion metadata file
    pub const HAS_METADATA: u32 = 1 << 0;
    /// Bit 1: Contains compressed data
    pub const IS_COMPRESSED: u32 = 1 << 1;
    /// Bit 2: Contains executable code
    pub const IS_EXECUTABLE: u32 = 1 << 2;
    /// Bit 3: Contains encrypted data (high entropy)
    pub const IS_ENCRYPTED: u32 = 1 << 3;
    
    /// Create new flags from raw value
    pub fn from_raw(flags: u32) -> Self {
        Self(flags)
    }
    
    /// Check if metadata flag is set
    pub fn has_metadata(&self) -> bool {
        self.0 & Self::HAS_METADATA != 0
    }
    
    /// Check if compressed flag is set
    pub fn is_compressed(&self) -> bool {
        self.0 & Self::IS_COMPRESSED != 0
    }
    
    /// Check if executable flag is set
    pub fn is_executable(&self) -> bool {
        self.0 & Self::IS_EXECUTABLE != 0
    }
    
    /// Check if encrypted flag is set
    pub fn is_encrypted(&self) -> bool {
        self.0 & Self::IS_ENCRYPTED != 0
    }
}

/// V2 Spatial Brick file
///
/// Represents a complete V2 brick file with header and texture data.
pub struct V2Brick {
    /// Brick header
    pub header: V2BrickHeader,
    /// Texture data (RGBA8 format)
    pub texture_data: Vec<u8>,
    /// Extracted Source Code (Hybrid DNA)
    pub source_code: Option<String>,
}

impl V2Brick {
    /// Load a V2 brick file from disk
    ///
    /// # Arguments
    /// * `path` - Path to the .brick file
    ///
    /// # Returns
    /// * `Ok(V2Brick)` - Successfully loaded brick
    /// * `Err(String)` - Error message
    pub fn load<P: AsRef<Path>>(path: P) -> Result<Self, String> {
        let path = path.as_ref();
        let mut file = File::open(path)
            .map_err(|e| format!("Failed to open brick file {}: {}", path.display(), e))?;

        // Read header (132 bytes) or detect PNG
        let mut header_bytes = [0u8; V2BrickHeader::HEADER_SIZE];
        if let Err(_) = file.read_exact(&mut header_bytes) {
            // Failed to read full header, might be a small file or just PNG
            // Reset and try PNG
        }

        // Check for PNG Magic: \x89PNG
        if header_bytes[0] == 0x89 && header_bytes[1] == 0x50 && header_bytes[2] == 0x4E && header_bytes[3] == 0x47 {
            return Self::load_from_png(path);
        }

        // Check for V2BR Magic
        if header_bytes[0] != V2BrickHeader::MAGIC[0] || 
           header_bytes[1] != V2BrickHeader::MAGIC[1] || 
           header_bytes[2] != V2BrickHeader::MAGIC[2] || 
           header_bytes[3] != V2BrickHeader::MAGIC[3] {
            
            // If strictly neither, try PNG anyway logic (fallback) or error
            // For now, assume if it doesn't match V2BR it might be PNG being read as header
             return Self::load_from_png(path).map_err(|e| format!("Neither V2BR nor valid PNG: {}", e));
        }

        // Proceed with V2Brick binary load
        // Parse header manually (using little-endian)
        let magic = [header_bytes[0], header_bytes[1], header_bytes[2], header_bytes[3]];
        let version = u32::from_le_bytes([header_bytes[4], header_bytes[5], header_bytes[6], header_bytes[7]]);
        let texture_width = u32::from_le_bytes([header_bytes[8], header_bytes[9], header_bytes[10], header_bytes[11]]);
        let texture_height = u32::from_le_bytes([header_bytes[12], header_bytes[13], header_bytes[14], header_bytes[15]]);
        let hilbert_order = u32::from_le_bytes([header_bytes[16], header_bytes[17], header_bytes[18], header_bytes[19]]);
        let original_size = u64::from_le_bytes([
            header_bytes[20], header_bytes[21], header_bytes[22], header_bytes[23],
            header_bytes[24], header_bytes[25], header_bytes[26], header_bytes[27],
        ]);
        let compressed_size = u64::from_le_bytes([
            header_bytes[28], header_bytes[29], header_bytes[30], header_bytes[31],
            header_bytes[32], header_bytes[33], header_bytes[34], header_bytes[35],
        ]);
        let entropy = f32::from_le_bytes([header_bytes[36], header_bytes[37], header_bytes[38], header_bytes[39]]);
        let mut hash = [0u8; 48];
        hash.copy_from_slice(&header_bytes[40..88]);
        let flags = u32::from_le_bytes([header_bytes[88], header_bytes[89], header_bytes[90], header_bytes[91]]);
        let mut reserved = [0u8; 40];
        reserved.copy_from_slice(&header_bytes[92..132]);

        let header = V2BrickHeader {
            magic,
            version,
            texture_width,
            texture_height,
            hilbert_order,
            original_size,
            compressed_size,
            entropy,
            hash,
            flags,
            reserved,
        };

        // Validate header
        header.validate()?;

        // Calculate expected texture data size
        let expected_size = (header.texture_width * header.texture_height * 4) as usize;

        // Read texture data
        let mut texture_data = vec![0u8; expected_size];
        file.read_exact(&mut texture_data)
            .map_err(|e| format!("Failed to read texture data from {}: {}", path.display(), e))?;

        Ok(Self {
            header,
            texture_data,
            source_code: None, // Binary bricks don't carry source code in this implementation yet
        })
    }
    
    /// Phase 42: Load from .rts.png (Hybrid DNA + PixelRTS Neural)
    pub fn load_from_png<P: AsRef<Path>>(path: P) -> Result<Self, String> {
        let file = File::open(path.as_ref())
            .map_err(|e| format!("Failed to open PNG: {}", e))?;

        let decoder = png::Decoder::new(file);
        let mut reader = decoder.read_info()
            .map_err(|e| format!("Failed to read PNG info: {}", e))?;

        // Read text chunks
        let mut text_chunks: HashMap<String, String> = HashMap::new();
        // TODO: Fix text_chunks access - png crate API may have changed
        // for chunk in reader.info().text_chunks() {
        //     text_chunks.insert(chunk.keyword.clone(), chunk.text.clone());
        // }

        let mut buf = vec![0; reader.output_buffer_size()];
        let info = reader.next_frame(&mut buf)
            .map_err(|e| format!("Failed to read PNG frame: {}", e))?;

        let width = info.width;
        let height = info.height;

        // Ensure RGBA8
        if info.color_type != png::ColorType::Rgba || info.bit_depth != png::BitDepth::Eight {
             // For now assume RGBA8 or fail, proper conversion would range expansion
             // If RGB, we need to convert to RGBA
             if info.color_type == png::ColorType::Rgb {
                 // Convert RGB to RGBA
                 let rgb_len = (width * height * 3) as usize;
                 let mut rgba_buf = Vec::with_capacity((width * height * 4) as usize);
                 for chunk in buf[..rgb_len].chunks(3) {
                     rgba_buf.extend_from_slice(chunk);
                     rgba_buf.push(255); // Full alpha
                 }
                 buf = rgba_buf;
             } else {
                 return Err(format!("Unsupported PNG color type: {:?}, expected RGBA8", info.color_type));
             }
        }

        let mut source_code = None;
        let mut flags = 0;
        let mut neural_metadata = None;

        // Check for PixelRTS metadata (neural models)
        if let Some(pixelrts_text) = text_chunks.get("PixelRTS") {
            log::info!("🧠 Detected PixelRTS neural container: {}", path.as_ref().display());
            if let Ok(json) = serde_json::from_str::<serde_json::Value>(pixelrts_text) {
                neural_metadata = Some(json.clone());

                // Check if it's a neural model
                if let Some(container_type) = json.get("container_type").and_then(|v| v.as_str()) {
                    if container_type == "llm_model" {
                        flags |= V2BrickFlags::IS_EXECUTABLE; // Mark as executable for inference

                        // Extract inference stub as source code
                        if let Some(stub) = json.get("inference_stub").and_then(|v| v.as_str()) {
                            source_code = Some(stub.to_string());
                            log::info!("🧬 Neural Model: Loaded inference stub");
                        }
                    }
                }
            }
        } else {
            // Fallback to Hybrid DNA Extraction (alpha channel)
            // Scan alpha channel of first row
            // Pixels are RGBA, so alpha is at index 3, 7, 11...
            let mut metadata_str = String::new();
            for x in 0..width {
                let encoded_index = (x * 4 + 3) as usize; // Alpha channel index
                if encoded_index < buf.len() {
                    let alpha = buf[encoded_index];
                    if alpha > 0 && alpha < 255 {
                        metadata_str.push(alpha as char);
                    } else {
                        break; // Null terminator or full alpha (background)
                    }
                }
            }

            if !metadata_str.is_empty() {
                 // Try Parsing JSON
                 if let Ok(json) = serde_json::from_str::<serde_json::Value>(&metadata_str) {
                     if let Some(b64) = json.get("source_code_b64").and_then(|v| v.as_str()) {
                         // Found Hybrid DNA!
                         match BASE64_STANDARD.decode(b64) {
                             Ok(compressed) => {
                                 // Decompress zlib
                                 let mut d = ZlibDecoder::new(&compressed[..]);
                                 let mut s = String::new();
                                 match d.read_to_string(&mut s) {
                                     Ok(_) => {
                                         source_code = Some(s);
                                         flags |= V2BrickFlags::IS_EXECUTABLE;
                                         log::info!("🧬 Hybrid DNA: Extracted source code from {}", path.as_ref().display());
                                     }
                                     Err(e) => log::warn!("Hybrid DNA decompression failed: {}", e),
                                 }
                             }
                             Err(e) => log::warn!("Hybrid DNA Base64 decode failed: {}", e),
                         }
                     }
                 }
            }
        }

        // Create Synthetic Header
        let header = V2BrickHeader::new(
            width, height, 0,
            buf.len() as u64, buf.len() as u64, 0.0,
            [0; 48], flags
        );

        Ok(Self {
            header,
            texture_data: buf,
            source_code,
        })
    }
    
    /// Phase 44: Save to .rts.png format (Self-Hosting Write-Back)
    ///
    /// This enables the hex editor to save modifications back to the substrate,
    /// closing the loop for self-hosted development.
    pub fn save_to_png<P: AsRef<Path>>(&self, path: P) -> Result<(), String> {
        let path = path.as_ref();
        let width = self.header.texture_width as usize;
        let height = self.header.texture_height as usize;
        
        // Ensure dimensions are valid
        if width == 0 || height == 0 {
            return Err("Invalid texture dimensions".to_string());
        }
        
        // Expected texture data size
        let expected_size = width * height * 4;
        if self.texture_data.len() != expected_size {
            return Err(format!(
                "Texture data size mismatch: expected {} bytes, got {}",
                expected_size,
                self.texture_data.len()
            ));
        }
        
        // Create PNG encoder
        let file = std::fs::File::create(path)
            .map_err(|e| format!("Failed to create PNG file: {}", e))?;
        
        let mut encoder = png::Encoder::new(file, width as u32, height as u32);
        encoder.set_color(png::ColorType::Rgba);
        encoder.set_depth(png::BitDepth::Eight);
        
        // Add metadata as text chunk if we have source code (Hybrid DNA)
        if let Some(source) = &self.source_code {
            use flate2::write::ZlibEncoder;
            use flate2::Compression;
            use std::io::Write;
            
            // Compress source code
            let mut encoder_zlib = ZlibEncoder::new(Vec::new(), Compression::default());
            encoder_zlib.write_all(source.as_bytes())
                .map_err(|e| format!("Compression failed: {}", e))?;
            let compressed = encoder_zlib.finish()
                .map_err(|e| format!("Compression finish failed: {}", e))?;
            
            // Base64 encode
            let b64 = BASE64_STANDARD.encode(&compressed);
            
            // Create metadata JSON
            let metadata = serde_json::json!({
                "format": "Hybrid-DNA-v1",
                "source_code_b64": b64,
                "language": "rust",
                "saved_at": std::time::SystemTime::now()
                    .duration_since(std::time::UNIX_EPOCH)
                    .map(|d| d.as_secs())
                    .unwrap_or(0),
            });
            
            encoder.add_text_chunk(
                "PixelRTS".to_string(),
                metadata.to_string()
            ).map_err(|e| format!("Failed to add metadata chunk: {}", e))?;
        }
        
        // Write the image data
        let mut writer = encoder.write_header()
            .map_err(|e| format!("Failed to write PNG header: {}", e))?;
        
        writer.write_image_data(&self.texture_data)
            .map_err(|e| format!("Failed to write PNG data: {}", e))?;
        
        log::info!("💾 Saved substrate to {:?} ({}x{} RGBA)", path, width, height);
        
        Ok(())
    }
    
    /// Get the flags as a V2BrickFlags struct
    pub fn flags(&self) -> V2BrickFlags {
        V2BrickFlags::from_raw(self.header.flags)
    }
    
    /// Get texture dimensions
    pub fn dimensions(&self) -> (u32, u32) {
        (self.header.texture_width, self.header.texture_height)
    }
    
    /// Get the hash as a hex string
    pub fn hash_hex(&self) -> String {
        self.header.hash.iter()
            .take_while(|&&b| b != 0)
            .map(|&b| format!("{:02x}", b))
            .collect()
    }
}

// ============================================
// CONFIGURATION
// ============================================

/// Configuration for memory tensor folding
#[derive(Debug, Clone)]
pub struct MemoryTensorConfig {
    /// Texture width (must be power of 2 for Hilbert curve)
    pub width: u32,
    /// Texture height (must be power of 2 for Hilbert curve)
    pub height: u32,
    /// Order of Hilbert curve (N = 2^order)
    pub hilbert_order: u32,
    /// Base memory address to start mapping from
    pub base_address: u32,
    /// Color encoding mode
    pub color_mode: ColorMode,
    /// Brightness adjustment (0.0 - 2.0, 1.0 = normal)
    pub brightness: f32,
    /// Contrast adjustment (0.0 - 2.0, 1.0 = normal)
    pub contrast: f32,
}

impl Default for MemoryTensorConfig {
    fn default() -> Self {
        Self {
            width: 2048,
            height: 2048,
            hilbert_order: 11,  // 2^11 = 2048
            base_address: 0,
            color_mode: ColorMode::MultiChannel,
            brightness: 1.0,
            contrast: 1.0,
        }
    }
}

/// Color encoding modes
#[derive(Debug, Clone, Copy, PartialEq)]
pub enum ColorMode {
    /// Heatmap: blue → cyan → green → yellow → red
    Heatmap,
    /// Attention flow visualization
    AttentionFlow,
    /// Memory pattern: positive=warm, negative=cool
    MemoryPattern,
    /// Multi-channel: combines all neural state components
    MultiChannel,
}

impl ColorMode {
    pub fn as_u32(&self) -> u32 {
        match self {
            ColorMode::Heatmap => 0,
            ColorMode::AttentionFlow => 1,
            ColorMode::MemoryPattern => 2,
            ColorMode::MultiChannel => 3,
        }
    }
}

/// Neural state parameters for visualization
#[derive(Debug, Clone)]
pub struct NeuralParams {
    /// Confidence in current state
    pub confidence: f32,
    /// Focus depth (how deep in thought)
    pub focus_depth: f32,
    /// User attention level
    pub user_attention: f32,
    /// Alignment with user intent
    pub alignment: f32,
    /// Mind reading confidence
    pub mind_reading: f32,
    /// Misalignment detected (warning signal)
    pub misalignment: f32,
}

impl Default for NeuralParams {
    fn default() -> Self {
        Self {
            confidence: 0.85,
            focus_depth: 0.5,
            user_attention: 0.5,
            alignment: 0.5,
            mind_reading: 0.5,
            misalignment: 0.0,
        }
    }
}

// ============================================
// MEMORY TENSOR FOLDER
// ============================================

/// Main struct for memory tensor folding
pub struct MemoryTensorFolder {
    // GPU Resources
    input_buffer: Buffer,
    output_buffer: Buffer,
    output_texture: Texture,
    output_texture_view: TextureView,
    
    // Compute Pipeline
    compute_pipeline: ComputePipeline,
    bind_group_layout: BindGroupLayout,
    bind_group: BindGroup,
    
    // Configuration
    config: MemoryTensorConfig,
    neural_params: NeuralParams,
    
    // State
    last_dispatch: std::time::Instant,
    dispatch_count: u64,
}

impl MemoryTensorFolder {
    /// Create a new memory tensor folder
    pub fn new(device: &Device, config: MemoryTensorConfig) -> Result<Self, String> {
        // Validate configuration
        if !config.width.is_power_of_two() || !config.height.is_power_of_two() {
            return Err("Width and height must be powers of 2 for Hilbert curve".to_string());
        }
        
        let texture_size = (config.width * config.height) as usize;
        
        // Create input buffer (storage buffer for raw memory bytes)
        // We use u32 to pack 4 bytes per element for efficiency
        let input_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Memory Tensor Input Buffer"),
            size: (texture_size * mem::size_of::<u32>()) as u64,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });
        
        // Create output buffer (for compute shader output)
        let output_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Memory Tensor Output Buffer"),
            size: (texture_size * mem::size_of::<[f32; 4]>()) as u64,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_SRC | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });
        
        // Create output texture (for rendering)
        let output_texture = device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Memory Tensor Output Texture"),
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
            label: Some("Memory Fold Compute Shader"),
            source: wgpu::ShaderSource::Wgsl(include_str!("../shaders/memory_fold.wgsl").into()),
        });
        
        // Create bind group layout
        let bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Memory Tensor Bind Group Layout"),
            entries: &[
                // Input memory buffer
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
                // Neural params uniform
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
            label: Some("Fold Config Buffer"),
            size: mem::size_of::<FoldConfigUniform>() as u64,
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });
        
        let neural_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Neural Params Buffer"),
            size: mem::size_of::<NeuralParamsUniform>() as u64,
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });
        
        // Create compute pipeline
        let compute_pipeline = device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("Memory Tensor Compute Pipeline"),
            layout: Some(&device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
                label: Some("Memory Tensor Pipeline Layout"),
                bind_group_layouts: &[&bind_group_layout],
                push_constant_ranges: &[],
            })),
            module: &shader_module,
            entry_point: "main",
        });
        
        // Create bind group
        let bind_group = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Memory Tensor Bind Group"),
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
                    resource: neural_buffer.as_entire_binding(),
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
            config,
            neural_params: NeuralParams::default(),
            last_dispatch: std::time::Instant::now(),
            dispatch_count: 0,
        })
    }
    
    /// Upload raw memory bytes to GPU and dispatch compute shader
    /// 
    /// This is the core "dumb pipe" operation:
    /// 1. Copy raw bytes to GPU buffer
    /// 2. Dispatch compute shader (O(1) operation)
    /// 3. GPU folds memory into texture in parallel
    pub fn fold_memory(&mut self, device: &Device, queue: &Queue, memory_bytes: &[u8]) -> Result<(), String> {
        // Pack bytes into u32 for efficiency (4 bytes per u32)
        let packed_data: Vec<u32> = memory_bytes
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
            label: Some("Memory Tensor Encoder"),
        });
        
        {
            let mut compute_pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                label: Some("Memory Tensor Compute Pass"),
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
    
    /// Load a V2 brick file and upload to GPU
    /// 
    /// This is the Phase 33 integration for loading pre-folded V2 bricks.
    /// The brick file contains a 132-byte header followed by texture data.
    /// 
    /// # Arguments
    /// * `queue` - WGPU queue for GPU operations
    /// * `path` - Path to the .brick file
    /// 
    /// # Returns
    /// * `Ok(())` - Successfully loaded and uploaded
    /// * `Err(String)` - Error message
    pub fn load_brick<P: AsRef<Path>>(&mut self, queue: &Queue, path: P) -> Result<(), String> {
        let brick = V2Brick::load(path)?;
        
        // Validate dimensions match config
        // Validate dimensions match config
        let w = brick.header.texture_width;
        if w != self.config.width {
            return Err(format!("Brick width {} does not match config width {}", 
                              w, self.config.width));
        }
        let h = brick.header.texture_height;
        if h != self.config.height {
            return Err(format!("Brick height {} does not match config height {}", 
                              h, self.config.height));
        }
        
        // Print brick info for debugging
        let w = brick.header.texture_width;
        let h = brick.header.texture_height;
        let order = brick.header.hilbert_order;
        let orig = brick.header.original_size;
        let entropy = brick.header.entropy;
        let flags_val = brick.header.flags;
        println!("[MemoryTensor] Loaded V2 brick:");
        println!("  Dimensions: {}x{}", w, h);
        println!("  Hilbert order: {}", order);
        println!("  Original size: {} bytes", orig);
        println!("  Entropy: {:.2} bits/byte", entropy);
        println!("  Flags: 0x{:08x}", flags_val);
        
        let flags = brick.flags();
        println!("  Has metadata: {}", flags.has_metadata());
        println!("  Is compressed: {}", flags.is_compressed());
        println!("  Is executable: {}", flags.is_executable());
        println!("  Is encrypted: {}", flags.is_encrypted());
        
        // Upload texture data directly to GPU (bypass compute shader)
        // The brick file already contains the folded texture data
        queue.write_texture(
            wgpu::ImageCopyTexture {
                texture: &self.output_texture,
                mip_level: 0,
                origin: wgpu::Origin3d::ZERO,
                aspect: wgpu::TextureAspect::All,
            },
            &brick.texture_data,
            wgpu::ImageDataLayout {
                offset: 0,
                bytes_per_row: Some(self.config.width * 4), // 4 channels * 1 byte per channel (RGBA8)
                rows_per_image: None,
            },
            wgpu::Extent3d {
                width: self.config.width,
                height: self.config.height,
                depth_or_array_layers: 1,
            },
        );
        
        self.last_dispatch = std::time::Instant::now();
        self.dispatch_count += 1;
        
        Ok(())
    }
    
    /// Create a MemoryTensorFolder from a V2 brick file
    /// 
    /// This is a convenience function that creates a folder configured
    /// to match the brick's dimensions and loads the brick data.
    /// 
    /// # Arguments
    /// * `device` - WGPU device
    /// * `path` - Path to the .brick file
    /// 
    /// # Returns
    /// * `Ok(MemoryTensorFolder)` - Successfully created and loaded
    /// * `Err(String)` - Error message
    pub fn from_brick<P: AsRef<Path>>(device: &Device, path: P) -> Result<Self, String> {
        // Load brick to get dimensions
        let brick = V2Brick::load(path.as_ref())?;
        
        // Create config from brick header
        let config = MemoryTensorConfig {
            width: brick.header.texture_width,
            height: brick.header.texture_height,
            hilbert_order: brick.header.hilbert_order,
            base_address: 0,
            color_mode: ColorMode::MultiChannel,
            brightness: 1.0,
            contrast: 1.0,
        };
        
        // Create folder
        let folder = Self::new(device, config.clone())?;
        
        // Note: We can't load the brick here because we need a queue
        // The caller should call load_brick() after creation
        println!("[MemoryTensor] Created folder from brick: {}x{}",
                 config.width, config.height);

        Ok(folder)
    }
    
    /// Update neural parameters for visualization
    pub fn set_neural_params(&mut self, params: NeuralParams) {
        self.neural_params = params;
    }
    
    /// Update configuration
    pub fn set_config(&mut self, config: MemoryTensorConfig) {
        self.config = config;
    }
    
    /// Get the output texture view for rendering
    pub fn texture_view(&self) -> &TextureView {
        &self.output_texture_view
    }
    
    /// Get the output texture
    pub fn texture(&self) -> &Texture {
        &self.output_texture
    }
    
    /// Get texture dimensions
    pub fn size(&self) -> (u32, u32) {
        (self.config.width, self.config.height)
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
    fn update_uniforms(&self, _queue: &Queue) {
        let config_uniform = FoldConfigUniform {
            texture_width: self.config.width,
            texture_height: self.config.height,
            hilbert_order: self.config.hilbert_order,
            base_address: self.config.base_address,
            color_mode: self.config.color_mode.as_u32(),
            brightness: self.config.brightness,
            contrast: self.config.contrast,
        };
        
        let neural_uniform = NeuralParamsUniform {
            confidence: self.neural_params.confidence,
            focus_depth: self.neural_params.focus_depth,
            user_attention: self.neural_params.user_attention,
            alignment: self.neural_params.alignment,
            mind_reading: self.neural_params.mind_reading,
            misalignment: self.neural_params.misalignment,
        };
        
        // These buffers need to be accessible - in a real implementation,
        // we'd store them as fields and update them here
        // For now, this is a placeholder for the uniform update logic
        let _ = (config_uniform, neural_uniform);
    }
}

// ============================================
// UNIFORM STRUCTS (matching WGSL)
// ============================================

#[repr(C)]
#[derive(Debug, Clone, Copy, bytemuck::Pod, bytemuck::Zeroable)]
struct FoldConfigUniform {
    texture_width: u32,
    texture_height: u32,
    hilbert_order: u32,
    base_address: u32,
    color_mode: u32,
    brightness: f32,
    contrast: f32,
}

#[repr(C)]
#[derive(Debug, Clone, Copy, bytemuck::Pod, bytemuck::Zeroable)]
struct NeuralParamsUniform {
    confidence: f32,
    focus_depth: f32,
    user_attention: f32,
    alignment: f32,
    mind_reading: f32,
    misalignment: f32,
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

/// Pack neural state data into memory bytes for GPU upload
/// 
/// This function prepares the tensor data structure that the compute shader
/// will interpret. It packs activation, attention, and memory values into u32s.
pub fn pack_neural_state_to_tensor(
    activations: &[f32],
    attention: &[f32],
    memory: &[f32],
) -> Vec<u8> {
    let max_len = activations.len().max(attention.len()).max(memory.len());
    let mut tensor = Vec::with_capacity(max_len * 4); // 4 bytes per element
    
    for i in 0..max_len {
        // Get values (clamp to [0, 1] and convert to bytes)
        let act = activations.get(i).copied().unwrap_or(0.0).clamp(0.0, 1.0);
        let att = attention.get(i).copied().unwrap_or(0.0).clamp(0.0, 1.0);
        let mem = memory.get(i).copied().unwrap_or(0.0).clamp(0.0, 1.0);
        
        // Pack into u32: [activation_byte, attention_byte, memory_byte, padding]
        let packed = ((act * 255.0) as u32) << 24
            | ((att * 255.0) as u32) << 16
            | ((mem * 255.0) as u32) << 8;
        
        tensor.extend_from_slice(&packed.to_le_bytes());
    }
    
    tensor
}

/// Read raw memory from /proc/self/mem
/// 
/// This is the "dumb pipe" operation - just read raw bytes.
pub fn read_raw_memory(addr: usize, size: usize) -> Result<Vec<u8>, std::io::Error> {
    use std::fs::File;
    use std::io::{Seek, Read};
    
    let mut mem_file = File::open("/proc/self/mem")?;
    mem_file.seek(std::io::SeekFrom::Start(addr as u64))?;
    
    let mut buffer = vec![0u8; size];
    mem_file.read_exact(&mut buffer)?;
    
    Ok(buffer)
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_pack_neural_state() {
        let activations = vec![0.5, 0.7, 0.3];
        let attention = vec![0.8, 0.2, 0.9];
        let memory = vec![0.4, 0.6, 0.1];
        
        let tensor = pack_neural_state_to_tensor(&activations, &attention, &memory);
        
        // Should have 3 elements * 4 bytes = 12 bytes
        assert_eq!(tensor.len(), 12);
        
        // Check first element
        let packed = u32::from_le_bytes([tensor[0], tensor[1], tensor[2], tensor[3]]);
        let activation = ((packed >> 24) & 0xFF) as f32 / 255.0;
        let attention_val = ((packed >> 16) & 0xFF) as f32 / 255.0;
        let memory_val = ((packed >> 8) & 0xFF) as f32 / 255.0;
        
        assert!((activation - 0.5).abs() < 0.01);
        assert!((attention_val - 0.8).abs() < 0.01);
        assert!((memory_val - 0.4).abs() < 0.01);
    }
    
    #[test]
    fn test_color_mode_conversion() {
        assert_eq!(ColorMode::Heatmap.as_u32(), 0);
        assert_eq!(ColorMode::AttentionFlow.as_u32(), 1);
        assert_eq!(ColorMode::MemoryPattern.as_u32(), 2);
        assert_eq!(ColorMode::MultiChannel.as_u32(), 3);
    }
    
    #[test]
    fn test_default_config() {
        let config = MemoryTensorConfig::default();
        assert_eq!(config.width, 2048);
        assert_eq!(config.height, 2048);
        assert_eq!(config.hilbert_order, 11);
        assert!(config.width.is_power_of_two());
        assert!(config.height.is_power_of_two());
    }
    
    #[test]
    fn test_neural_params_default() {
        let params = NeuralParams::default();
        assert_eq!(params.confidence, 0.85);
        assert_eq!(params.focus_depth, 0.5);
        assert_eq!(params.misalignment, 0.0);
    }
    
    // V2 Brick Format Tests (Phase 33)
    
    #[test]
    fn test_v2_brick_header_size() {
        // CRITICAL: Header size must be 132 bytes, not 128 bytes
        assert_eq!(V2BrickHeader::HEADER_SIZE, 132);
        assert_eq!(std::mem::size_of::<V2BrickHeader>(), 132);
    }
    
    #[test]
    fn test_v2_brick_header_magic() {
        assert_eq!(V2BrickHeader::MAGIC, *b"V2BR");
    }
    
    #[test]
    fn test_v2_brick_header_creation() {
        let header = V2BrickHeader::new(
            256, 256, 8,  // texture dimensions
            1024, 1024,  // sizes
            5.5,          // entropy
            [0u8; 48],    // hash
            0,            // flags
        );
        
        let magic = header.magic;
        assert_eq!(magic, V2BrickHeader::MAGIC);
        let version = header.version;
        assert_eq!(version, V2BrickHeader::VERSION);
        let width = header.texture_width;
        assert_eq!(width, 256);
        let height = header.texture_height;
        assert_eq!(height, 256);
        let order = header.hilbert_order;
        assert_eq!(order, 8);
        let orig_size = header.original_size;
        assert_eq!(orig_size, 1024);
        let comp_size = header.compressed_size;
        assert_eq!(comp_size, 1024);
        let entropy = header.entropy;
        assert_eq!(entropy, 5.5);
    }
    
    #[test]
    fn test_v2_brick_header_validation() {
        let mut header = V2BrickHeader::new(
            256, 256, 8,
            1024, 1024,
            5.5,
            [0u8; 48],
            0,
        );
        
        // Valid header should pass
        assert!(header.validate().is_ok());
        
        // Invalid magic should fail
        header.magic = *b"XXXX";
        assert!(header.validate().is_err());
        
        // Invalid version should fail
        header.magic = V2BrickHeader::MAGIC;
        header.version = 999;
        assert!(header.validate().is_err());
        
        // Non-power-of-2 dimensions should fail
        header.version = V2BrickHeader::VERSION;
        header.texture_width = 100;
        assert!(header.validate().is_err());
    }
    
    #[test]
    fn test_v2_brick_flags() {
        // Test individual flags
        let flags = V2BrickFlags::from_raw(0);
        assert!(!flags.has_metadata());
        assert!(!flags.is_compressed());
        assert!(!flags.is_executable());
        assert!(!flags.is_encrypted());
        
        // Test HAS_METADATA flag
        let flags = V2BrickFlags::from_raw(V2BrickFlags::HAS_METADATA);
        assert!(flags.has_metadata());
        assert!(!flags.is_compressed());
        
        // Test IS_COMPRESSED flag
        let flags = V2BrickFlags::from_raw(V2BrickFlags::IS_COMPRESSED);
        assert!(!flags.has_metadata());
        assert!(flags.is_compressed());
        
        // Test IS_EXECUTABLE flag
        let flags = V2BrickFlags::from_raw(V2BrickFlags::IS_EXECUTABLE);
        assert!(flags.is_executable());
        
        // Test IS_ENCRYPTED flag
        let flags = V2BrickFlags::from_raw(V2BrickFlags::IS_ENCRYPTED);
        assert!(flags.is_encrypted());
        
        // Test combined flags
        let flags = V2BrickFlags::from_raw(
            V2BrickFlags::HAS_METADATA | V2BrickFlags::IS_COMPRESSED
        );
        assert!(flags.has_metadata());
        assert!(flags.is_compressed());
        assert!(!flags.is_executable());
    }
    
    #[test]
    fn test_v2_brick_header_packing() {
        // Create a header
        let mut hash = [0u8; 48];
        hash[0] = 0x12;
        hash[1] = 0x34;
        hash[2] = 0x56;
        hash[3] = 0x78;
        hash[4] = 0x9a;
        hash[5] = 0xbc;
        hash[6] = 0xde;
        hash[7] = 0xf0;

        let header = V2BrickHeader::new(
            512, 512, 9,
            2048, 2048,
            7.2,
            hash,
            V2BrickFlags::HAS_METADATA | V2BrickFlags::IS_COMPRESSED,
        );
        
        // Convert to bytes
        let bytes = bytemuck::bytes_of(&header);
        
        // Verify size
        assert_eq!(bytes.len(), V2BrickHeader::HEADER_SIZE);
        
        // Parse back
        // Parse back
        let parsed: V2BrickHeader = bytemuck::try_from_bytes::<V2BrickHeader>(bytes).unwrap().clone();
        
        // Verify values match
        // Verify values match
        let magic = parsed.magic;
        let h_magic = header.magic;
        assert_eq!(magic, h_magic);
        
        let version = parsed.version;
        let h_version = header.version;
        assert_eq!(version, h_version);
        
        let width = parsed.texture_width;
        let h_width = header.texture_width;
        assert_eq!(width, h_width);
        
        let height = parsed.texture_height;
        let h_height = header.texture_height;
        assert_eq!(height, h_height);
        
        let order = parsed.hilbert_order;
        let h_order = header.hilbert_order;
        assert_eq!(order, h_order);
        
        let orig_size = parsed.original_size;
        let h_orig = header.original_size;
        assert_eq!(orig_size, h_orig);
        
        let comp_size = parsed.compressed_size;
        let h_comp = header.compressed_size;
        assert_eq!(comp_size, h_comp);
        
        let entropy = parsed.entropy;
        let h_entropy = header.entropy;
        assert_eq!(entropy, h_entropy);
        
        let flags = parsed.flags;
        let h_flags = header.flags;
        assert_eq!(flags, h_flags);
    }
}
