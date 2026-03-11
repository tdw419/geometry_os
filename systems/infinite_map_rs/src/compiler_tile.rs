//! Phase 42: Micro-Compiler Tile - In-Pixel WGSL → SPIR-V Compilation
//!
//! "The map programs the map." - The compiler tile is itself a WGSL shader
//! that compiles WGSL → SPIR-V. Eventually, it can compile itself.
//!
//! # Architecture
//! - Dual-Channel Substrate: BA (source WGSL) + RG (SPIR-V bytecode)
//! - LUT-Based Tokenization: 256×256 texture for byte-pair → token mapping
//! - Multi-Pass GPU Compilation: Tokenize → Emit with atomic error tracking

use std::path::Path;
use std::sync::Arc;
use wgpu::util::DeviceExt;

/// Tile compilation status codes matching shader Header struct
#[repr(u32)]
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum TileStatus {
    Clean = 0,
    Dirty = 1,
    Compiling = 2,
    Error = 3,
}

impl From<u32> for TileStatus {
    fn from(value: u32) -> Self {
        match value {
            0 => TileStatus::Clean,
            1 => TileStatus::Dirty,
            2 => TileStatus::Compiling,
            3 => TileStatus::Error,
            _ => TileStatus::Error,
        }
    }
}

/// Header structure matching the GPU-side Header struct
/// Located in Row 0 of the tile (first 6 pixels)
#[repr(C)]
#[derive(Debug, Clone, Copy, bytemuck::Pod, bytemuck::Zeroable)]
pub struct CompilerHeader {
    pub source_len: u32,
    pub spirv_len: u32,
    pub status: u32,
    pub hash_hi: u32,
    pub hash_lo: u32,
    pub error_pos: u32,
}

impl Default for CompilerHeader {
    fn default() -> Self {
        Self {
            source_len: 0,
            spirv_len: 0,
            status: TileStatus::Clean as u32,
            hash_hi: 0,
            hash_lo: 0,
            error_pos: 0,
        }
    }
}

/// Compilation error with position information
#[derive(Debug)]
pub enum CompileError {
    /// Syntax error at the given byte offset
    Syntax(u32),
    /// GPU dispatch failed
    DispatchFailed(String),
    /// SPIR-V extraction failed
    ExtractionFailed(String),
    /// Invalid SPIR-V produced
    InvalidSpirv(String),
}

impl std::fmt::Display for CompileError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            CompileError::Syntax(pos) => write!(f, "Syntax error at byte offset {}", pos),
            CompileError::DispatchFailed(msg) => write!(f, "Dispatch failed: {}", msg),
            CompileError::ExtractionFailed(msg) => write!(f, "SPIR-V extraction failed: {}", msg),
            CompileError::InvalidSpirv(msg) => write!(f, "Invalid SPIR-V: {}", msg),
        }
    }
}

impl std::error::Error for CompileError {}

/// The Compiler Tile Dispatcher orchestrates multi-pass GPU compilation
pub struct CompilerTileDispatcher {
    device: Arc<wgpu::Device>,
    queue: Arc<wgpu::Queue>,
    
    // Compute pipelines for each pass
    tokenize_pipeline: Option<wgpu::ComputePipeline>,
    emit_pipeline: Option<wgpu::ComputePipeline>,
    
    // LUT textures
    token_lut: Option<wgpu::Texture>,
    template_lut: Option<wgpu::Texture>,
    
    // Bind group layout
    bind_group_layout: Option<wgpu::BindGroupLayout>,
    
    // Header buffer for CPU readback
    header_staging_buffer: Option<wgpu::Buffer>,
}

impl CompilerTileDispatcher {
    /// Create a new compiler tile dispatcher
    pub fn new(device: Arc<wgpu::Device>, queue: Arc<wgpu::Queue>) -> Self {
        log::info!("🔧 Phase 42: Initializing CompilerTileDispatcher");
        
        Self {
            device,
            queue,
            tokenize_pipeline: None,
            emit_pipeline: None,
            token_lut: None,
            template_lut: None,
            bind_group_layout: None,
            header_staging_buffer: None,
        }
    }
    
    /// Initialize the compiler pipelines and LUT textures
    pub fn initialize(&mut self) -> Result<(), CompileError> {
        log::info!("🔧 Phase 42: Building compiler pipelines...");

        // Create bind group layout for compiler shaders
        let bind_group_layout = self.device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Compiler Tile Bind Group Layout"),
            entries: &[
                // Tile texture (read_write)
                wgpu::BindGroupLayoutEntry {
                    binding: 0,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::StorageTexture {
                        access: wgpu::StorageTextureAccess::ReadWrite,
                        format: wgpu::TextureFormat::Rgba8Unorm,
                        view_dimension: wgpu::TextureViewDimension::D2,
                    },
                    count: None,
                },
                // Token LUT texture (RGBA8Unorm for textureLoad returning vec4<f32>)
                wgpu::BindGroupLayoutEntry {
                    binding: 1,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Texture {
                        multisampled: false,
                        view_dimension: wgpu::TextureViewDimension::D2,
                        sample_type: wgpu::TextureSampleType::Float { filterable: false },
                    },
                    count: None,
                },
                // Template LUT texture
                wgpu::BindGroupLayoutEntry {
                    binding: 2,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Texture {
                        multisampled: false,
                        view_dimension: wgpu::TextureViewDimension::D2,
                        sample_type: wgpu::TextureSampleType::Float { filterable: false },
                    },
                    count: None,
                },
                // Header buffer
                wgpu::BindGroupLayoutEntry {
                    binding: 3,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
            ],
        });

        // Create pipeline layout before moving bind_group_layout
        let pipeline_layout = self.device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Compiler Pipeline Layout"),
            bind_group_layouts: &[&bind_group_layout],
            push_constant_ranges: &[],
        });

        self.bind_group_layout = Some(bind_group_layout);

        // Create header staging buffer for CPU readback
        let header_staging = self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Compiler Header Staging"),
            size: std::mem::size_of::<CompilerHeader>() as u64,
            usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });
        self.header_staging_buffer = Some(header_staging);

        // Load LUT textures
        self.token_lut = Some(self.load_lut_texture("systems/vision/token_lut.rts.png")?);
        self.template_lut = Some(self.load_lut_texture("systems/vision/template_lut.rts.png")?);
        log::info!("✅ Phase 42: LUT textures loaded");

        // Load WGSL compiler shader and create pipelines
        let shader_module = self.device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("WGSL Compiler Shader"),
            source: wgpu::ShaderSource::Wgsl(
                include_str!("shaders/wgsl_compiler.wgsl").into()
            ),
        });

        // Create tokenize pass pipeline
        self.tokenize_pipeline = Some(self.device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("Tokenize Pass Pipeline"),
            layout: Some(&pipeline_layout),
            module: &shader_module,
            entry_point: "pass_tokenize",
        }));

        // Create emit pass pipeline
        self.emit_pipeline = Some(self.device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("Emit Pass Pipeline"),
            layout: Some(&pipeline_layout),
            module: &shader_module,
            entry_point: "pass_emit",
        }));

        log::info!("✅ Phase 42: CompilerTileDispatcher fully initialized");
        Ok(())
    }

    /// Load a LUT texture from a PNG file
    fn load_lut_texture(&self, path: &str) -> Result<wgpu::Texture, CompileError> {
        let lut_path = Path::new(path);
        if !lut_path.exists() {
            // Try relative path from systems/vision
            let alt_path = Path::new("../vision").join(lut_path.file_name().unwrap());
            if !alt_path.exists() {
                return Err(CompileError::DispatchFailed(
                    format!("LUT file not found: {}", path)
                ));
            }
            return self.load_lut_texture_from_path(&alt_path);
        }
        self.load_lut_texture_from_path(lut_path)
    }

    /// Load LUT texture from specific path
    fn load_lut_texture_from_path(&self, path: &Path) -> Result<wgpu::Texture, CompileError> {
        let image_data = std::fs::read(path)
            .map_err(|e| CompileError::DispatchFailed(
                format!("Failed to read LUT file: {}", e)
            ))?;

        let image = image::load_from_memory(&image_data)
            .map_err(|e| CompileError::DispatchFailed(
                format!("Failed to parse LUT PNG: {}", e)
            ))?;

        let rgba = image.to_rgba8();
        let (width, height) = rgba.dimensions();

        // Create texture
        let texture = self.device.create_texture(&wgpu::TextureDescriptor {
            label: Some(&format!("LUT: {}", path.display())),
            size: wgpu::Extent3d {
                width,
                height,
                depth_or_array_layers: 1,
            },
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8Unorm,
            usage: wgpu::TextureUsages::TEXTURE_BINDING | wgpu::TextureUsages::COPY_DST,
            view_formats: &[],
        });

        // Upload texture data
        self.queue.write_texture(
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

        Ok(texture)
    }
    
    /// Compile a tile containing WGSL source in BA channel
    /// Returns the compiled SPIR-V words on success
    pub async fn compile_tile(&self, tile_texture: &wgpu::Texture) -> Result<Vec<u32>, CompileError> {
        log::info!("🔄 Phase 43: Starting multi-pass compilation...");

        let tokenize_pipeline = self.tokenize_pipeline.as_ref()
            .ok_or_else(|| CompileError::DispatchFailed("Tokenize pipeline not initialized".to_string()))?;
        let emit_pipeline = self.emit_pipeline.as_ref()
            .ok_or_else(|| CompileError::DispatchFailed("Emit pipeline not initialized".to_string()))?;
        let token_lut = self.token_lut.as_ref()
            .ok_or_else(|| CompileError::DispatchFailed("Token LUT not loaded".to_string()))?;
        let template_lut = self.template_lut.as_ref()
            .ok_or_else(|| CompileError::DispatchFailed("Template LUT not loaded".to_string()))?;
        let bind_group_layout = self.bind_group_layout.as_ref()
            .ok_or_else(|| CompileError::DispatchFailed("Bind group layout not created".to_string()))?;

        // Create header buffer for this compilation
        let header_buffer = self.device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("Compiler Header Buffer"),
            contents: bytemuck::cast_slice(&[CompilerHeader {
                source_len: 256 * 256 * 2, // Max bytes in BA channel
                spirv_len: 0,
                status: TileStatus::Dirty as u32,
                hash_hi: 0,
                hash_lo: 0,
                error_pos: 0,
            }]),
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_SRC | wgpu::BufferUsages::COPY_DST,
        });

        // Create bind group for all passes
        let bind_group = self.device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Compiler Bind Group"),
            layout: bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: wgpu::BindingResource::TextureView(
                        &tile_texture.create_view(&wgpu::TextureViewDescriptor::default())
                    ),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: wgpu::BindingResource::TextureView(
                        &token_lut.create_view(&wgpu::TextureViewDescriptor::default())
                    ),
                },
                wgpu::BindGroupEntry {
                    binding: 2,
                    resource: wgpu::BindingResource::TextureView(
                        &template_lut.create_view(&wgpu::TextureViewDescriptor::default())
                    ),
                },
                wgpu::BindGroupEntry {
                    binding: 3,
                    resource: wgpu::BindingResource::Buffer(wgpu::BufferBinding {
                        buffer: &header_buffer,
                        offset: 0,
                        size: None,
                    }),
                },
            ],
        });

        // Create command encoder
        let mut encoder = self.device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
            label: Some("Compiler Encoder"),
        });

        // === PASS 1: TOKENIZE ===
        {
            let mut pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                label: Some("Tokenize Pass"),
                timestamp_writes: None,
            });
            pass.set_pipeline(tokenize_pipeline);
            pass.set_bind_group(0, &bind_group, &[]);
            pass.dispatch_workgroups(4, 1, 1); // 4 * 64 = 256 threads
        }

        // === PASS 2: EMIT ===
        {
            let mut pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                label: Some("Emit Pass"),
                timestamp_writes: None,
            });
            pass.set_pipeline(emit_pipeline);
            pass.set_bind_group(0, &bind_group, &[]);
            pass.dispatch_workgroups(4, 1, 1); // 4 * 64 = 256 threads
        }

        // Submit commands
        self.queue.submit(Some(encoder.finish()));

        // Read back header to check status and extract SPIR-V
        self.extract_spirv_with_header(tile_texture, &header_buffer).await
    }

    /// Extract SPIR-V from tile texture with header readback
    async fn extract_spirv_with_header(
        &self,
        tile_texture: &wgpu::Texture,
        header_buffer: &wgpu::Buffer,
    ) -> Result<Vec<u32>, CompileError> {
        // Copy header to staging buffer
        let header_staging = self.header_staging_buffer.as_ref()
            .ok_or_else(|| CompileError::ExtractionFailed("No staging buffer".to_string()))?;

        let mut encoder = self.device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
            label: Some("Header Copy Encoder"),
        });

        encoder.copy_buffer_to_buffer(
            header_buffer,
            0,
            header_staging,
            0,
            std::mem::size_of::<CompilerHeader>() as u64,
        );

        self.queue.submit(Some(encoder.finish()));

        // Map and read header
        let (tx, rx) = tokio::sync::oneshot::channel();
        header_staging.slice(..).map_async(wgpu::MapMode::Read, move |v| {
            tx.send(v).ok();
        });
        self.device.poll(wgpu::Maintain::Wait);
        rx.await.map_err(|e| CompileError::ExtractionFailed(format!("Header map failed: {}", e)))?
            .map_err(|e| CompileError::ExtractionFailed(format!("Header map error: {}", e)))?;

        let header_slice = header_staging.slice(..).get_mapped_range();
        let header: CompilerHeader = *bytemuck::from_bytes::<CompilerHeader>(&header_slice);
        drop(header_slice);
        header_staging.unmap();

        // Check for compilation error
        if header.status == TileStatus::Error as u32 {
            return Err(CompileError::Syntax(header.error_pos));
        }

        log::info!("✅ Phase 43: Compilation header valid (SPIR-V words: {})", header.spirv_len);

        // Extract SPIR-V from RG channel
        self.extract_spirv_internal(tile_texture, header.spirv_len).await
    }

    /// Internal helper to pull RG pixels into SPIR-V words
    async fn extract_spirv_internal(&self, texture: &wgpu::Texture, word_count: u32) -> Result<Vec<u32>, CompileError> {
        let (width, height) = (texture.width(), texture.height());
        let pixel_count = word_count * 2; // 2 pixels per word
        
        // Skip header row
        let rows_needed = (pixel_count + width - 1) / width + 1;
        let read_height = rows_needed.min(height);

        let u32_size = std::mem::size_of::<u32>() as u32;
        let bytes_per_row = width * 4;
        let padded_bytes_per_row = (bytes_per_row + 255) & !255;
        
        let staging_buffer = self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("SPIR-V Extraction Staging"),
            size: (padded_bytes_per_row * read_height) as u64,
            usage: wgpu::BufferUsages::COPY_DST | wgpu::BufferUsages::MAP_READ,
            mapped_at_creation: false,
        });

        let mut encoder = self.device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
            label: Some("SPIR-V Copy Encoder"),
        });

        encoder.copy_texture_to_buffer(
            wgpu::ImageCopyTexture {
                texture,
                mip_level: 0,
                origin: wgpu::Origin3d::ZERO,
                aspect: wgpu::TextureAspect::All,
            },
            wgpu::ImageCopyBuffer {
                buffer: &staging_buffer,
                layout: wgpu::ImageDataLayout {
                    offset: 0,
                    bytes_per_row: Some(padded_bytes_per_row),
                    rows_per_image: Some(read_height),
                },
            },
            wgpu::Extent3d {
                width,
                height: read_height,
                depth_or_array_layers: 1,
            },
        );

        self.queue.submit(Some(encoder.finish()));

        // Map and read
        let (tx, rx) = tokio::sync::oneshot::channel();
        staging_buffer.slice(..).map_async(wgpu::MapMode::Read, move |v| {
            tx.send(v).ok();
        });
        self.device.poll(wgpu::Maintain::Wait);
        rx.await.map_err(|e| CompileError::ExtractionFailed(format!("Staging map failed: {}", e)))?
            .map_err(|e| CompileError::ExtractionFailed(format!("Staging map error: {}", e)))?;

        let data = staging_buffer.slice(..).get_mapped_range();
        
        let mut spirv = Vec::with_capacity(word_count as usize);

        for i in 0..word_count {
            let pixel_a_idx = i * 2;
            let pixel_b_idx = i * 2 + 1;
            
            // Skip header row (row 0)
            let row_a = 1 + pixel_a_idx / width;
            let col_a = pixel_a_idx % width;
            let row_b = 1 + pixel_b_idx / width;
            let col_b = pixel_b_idx % width;

            let offset_a = (row_a * padded_bytes_per_row + col_a * 4) as usize;
            let offset_b = (row_b * padded_bytes_per_row + col_b * 4) as usize;

            if offset_b + 3 >= data.len() { break; }

            // Extract RG bytes from pixel A and B
            // SPIR-V word is 4 bytes [R_a, G_a, R_b, G_b]
            let word = u32::from_le_bytes([
                data[offset_a],
                data[offset_a + 1],
                data[offset_b],
                data[offset_b + 1],
            ]);
            spirv.push(word);
        }

        drop(data);
        staging_buffer.unmap();

        log::info!("✅ Phase 43: SPIR-V extraction complete ({} words)", spirv.len());
        Ok(spirv)
    }
    
    /// Read the header from a compiled tile
    pub fn read_header(&self, _tile_texture: &wgpu::Texture) -> Result<CompilerHeader, CompileError> {
        // Stub: return default header
        Ok(CompilerHeader::default())
    }
    
    /// Extract SPIR-V bytecode from the RG channel of a tile
    pub fn extract_spirv(&self, _tile_texture: &wgpu::Texture) -> Result<Vec<u32>, CompileError> {
        // Stub: return empty SPIR-V
        Err(CompileError::ExtractionFailed("Not implemented".to_string()))
    }
    
    /// Mark a tile as dirty (needs recompilation)
    pub fn mark_dirty(&self, header_buffer: &wgpu::Buffer) {
        let dirty_status = [TileStatus::Dirty as u32];
        self.queue.write_buffer(
            header_buffer,
            std::mem::size_of::<u32>() as u64 * 2, // Offset to status field
            bytemuck::cast_slice(&dirty_status),
        );
    }
    
    /// Check if a tile needs recompilation
    pub fn needs_compile(&self, header: &CompilerHeader) -> bool {
        header.status == TileStatus::Dirty as u32
    }
    
    /// Check if a tile has a compilation error
    pub fn has_error(&self, header: &CompilerHeader) -> Option<u32> {
        if header.status == TileStatus::Error as u32 {
            Some(header.error_pos)
        } else {
            None
        }
    }
}

/// Helper to compute a simple hash of source bytes
/// Used for change detection in the BA channel
pub fn hash_source(source: &[u8]) -> (u32, u32) {
    use std::hash::{Hash, Hasher};
    use std::collections::hash_map::DefaultHasher;
    
    let mut hasher = DefaultHasher::new();
    source.hash(&mut hasher);
    let hash = hasher.finish();
    
    ((hash >> 32) as u32, hash as u32)
}

/// Helper to extract source bytes from BA channel of a tile
pub fn extract_source_from_ba(rgba_data: &[u8], width: u32, height: u32) -> Vec<u8> {
    let mut source = Vec::new();
    
    // Skip header row (row 0)
    for y in 1..height {
        for x in 0..width {
            let idx = ((y * width + x) * 4) as usize;
            if idx + 3 < rgba_data.len() {
                let b = rgba_data[idx + 2]; // Blue
                let a = rgba_data[idx + 3]; // Alpha
                
                if b != 0 {
                    source.push(b);
                }
                if a != 0 {
                    source.push(a);
                }
            }
        }
    }
    
    source
}

/// Helper to write SPIR-V bytes to RG channel of a tile
pub fn write_spirv_to_rg(rgba_data: &mut [u8], width: u32, spirv: &[u32]) {
    // Skip header row (row 0), start at row 1
    let start_pixel = width as usize;
    
    for (i, word) in spirv.iter().enumerate() {
        let bytes = word.to_le_bytes();
        
        // Each SPIR-V word needs 2 pixels (RG of each)
        let pixel_a = start_pixel + i * 2;
        let pixel_b = start_pixel + i * 2 + 1;
        
        if pixel_a * 4 + 1 < rgba_data.len() {
            rgba_data[pixel_a * 4] = bytes[0];     // R
            rgba_data[pixel_a * 4 + 1] = bytes[1]; // G
        }
        if pixel_b * 4 + 1 < rgba_data.len() {
            rgba_data[pixel_b * 4] = bytes[2];     // R
            rgba_data[pixel_b * 4 + 1] = bytes[3]; // G
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_tile_status_conversion() {
        assert_eq!(TileStatus::from(0), TileStatus::Clean);
        assert_eq!(TileStatus::from(1), TileStatus::Dirty);
        assert_eq!(TileStatus::from(2), TileStatus::Compiling);
        assert_eq!(TileStatus::from(3), TileStatus::Error);
        assert_eq!(TileStatus::from(99), TileStatus::Error);
    }
    
    #[test]
    fn test_hash_source() {
        let source1 = b"fn main() {}";
        let source2 = b"fn main() { let x = 1; }";
        
        let (h1_hi, h1_lo) = hash_source(source1);
        let (h2_hi, h2_lo) = hash_source(source2);
        
        // Different sources should have different hashes
        assert!(h1_hi != h2_hi || h1_lo != h2_lo);
        
        // Same source should have same hash
        let (h1_hi2, h1_lo2) = hash_source(source1);
        assert_eq!(h1_hi, h1_hi2);
        assert_eq!(h1_lo, h1_lo2);
    }
    
    #[test]
    fn test_extract_source_from_ba() {
        // Create a mock 4x4 RGBA tile
        let width = 4u32;
        let height = 4u32;
        let mut rgba = vec![0u8; (width * height * 4) as usize];
        
        // Row 0 is header (skip)
        // Row 1: Write "Hi" in BA channel
        let row1_start = (width * 1 * 4) as usize;
        rgba[row1_start + 2] = b'H'; // Blue of pixel (0,1)
        rgba[row1_start + 3] = b'i'; // Alpha of pixel (0,1)
        
        let source = extract_source_from_ba(&rgba, width, height);
        assert_eq!(source, b"Hi");
    }
}
