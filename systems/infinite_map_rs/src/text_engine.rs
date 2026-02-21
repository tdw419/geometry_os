use wgpu::util::DeviceExt;
use std::sync::Arc;
use bytemuck::{Pod, Zeroable};
use crate::font_atlas::generate_fallback_atlas;
use crate::hex_tensor_editor::{HexTensorEditor, EditorMode, HexNavDirection};
use crate::visual_ast::{VisualAST, SyntaxHealth};
use serde::{Deserialize, Serialize};

#[repr(C)]
#[derive(Copy, Clone, Debug, Pod, Zeroable)]
pub struct TextStats {
    pub cursor_pos: u32,
    pub length: u32,
    pub capacity: u32,
    pub dirty: u32,
    // Phase 35.1: Selection state
    pub selection_start: u32,
    pub selection_end: u32,
    pub selection_active: u32,
}

// ============================================
// Phase 37: Real Font Loading
// ============================================

/// Glyph metrics for variable-width font rendering
#[repr(C)]
#[derive(Copy, Clone, Debug, Pod, Zeroable, Serialize, Deserialize)]
pub struct GlyphMetrics {
    pub char_code: u32,      // Unicode code point
    pub uv_min_x: f32,       // Atlas UV minimum X
    pub uv_min_y: f32,       // Atlas UV minimum Y
    pub uv_max_x: f32,       // Atlas UV maximum X
    pub uv_max_y: f32,       // Atlas UV maximum Y
    pub width: f32,          // Glyph width in pixels
    pub height: f32,         // Glyph height in pixels
    pub bearing_x: f32,      // Horizontal bearing from origin
    pub bearing_y: f32,      // Vertical bearing from baseline
    pub advance: f32,        // Advance to next glyph
}

impl Default for GlyphMetrics {
    fn default() -> Self {
        Self {
            char_code: 0,
            uv_min_x: 0.0,
            uv_min_y: 0.0,
            uv_max_x: 0.0,
            uv_max_y: 0.0,
            width: 0.0,
            height: 0.0,
            bearing_x: 0.0,
            bearing_y: 0.0,
            advance: 0.0,
        }
    }
}

/// Font metadata for loaded fonts
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct FontMetadata {
    pub version: u32,
    pub font_name: String,
    pub font_size: u32,
    pub atlas_size: (u32, u32),
    pub glyph_count: usize,
    pub ascent: f32,         // Distance from baseline to top
    pub descent: f32,        // Distance from baseline to bottom
    pub line_gap: f32,       // Extra space between lines
}

impl Default for FontMetadata {
    fn default() -> Self {
        Self {
            version: 1,
            font_name: String::from("Fallback"),
            font_size: 32,
            atlas_size: (1024, 1024),
            glyph_count: 96,
            ascent: 28.0,
            descent: -8.0,
            line_gap: 4.0,
        }
    }
}

/// Complete font data for serialization
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct FontData {
    pub metadata: FontMetadata,
    pub glyphs: Vec<GlyphMetrics>,
}

/// Load font metrics from JSON file
pub fn load_font_metrics(path: &std::path::Path) -> Result<FontData, Box<dyn std::error::Error>> {
    let json = std::fs::read_to_string(path)?;
    let data: FontData = serde_json::from_str(&json)?;
    Ok(data)
}

/// Save font metrics to JSON file
pub fn save_font_metrics(data: &FontData, path: &std::path::Path) -> Result<(), Box<dyn std::error::Error>> {
    let json = serde_json::to_string_pretty(data)?;
    std::fs::write(path, json)?;
    Ok(())
}

/// Generate fixed-width metrics for fallback bitmap font
pub fn generate_fallback_metrics() -> FontData {
    let atlas_cols = 16u32;
    let atlas_rows = 6u32;
    let cell_size = 64.0;
    let glyph_size = 40.0;

    let mut glyphs = Vec::new();

    // Generate metrics for ASCII 32-127
    for char_code in 32..128 {
        let col = (char_code - 32) % atlas_cols;
        let row = (char_code - 32) / atlas_cols;

        let uv_min_x = (col as f32) / (atlas_cols as f32);
        let uv_min_y = (row as f32) / (atlas_rows as f32);
        let uv_max_x = ((col + 1) as f32) / (atlas_cols as f32);
        let uv_max_y = ((row + 1) as f32) / (atlas_rows as f32);

        glyphs.push(GlyphMetrics {
            char_code: char_code as u32,
            uv_min_x,
            uv_min_y,
            uv_max_x,
            uv_max_y,
            width: glyph_size,
            height: glyph_size,
            bearing_x: 0.0,
            bearing_y: 28.0,
            advance: glyph_size + 4.0,
        });
    }

    FontData {
        metadata: FontMetadata {
            version: 1,
            font_name: String::from("Fallback Bitmap"),
            font_size: 32,
            atlas_size: (1024, 1024),
            glyph_count: glyphs.len(),
            ascent: 28.0,
            descent: -8.0,
            line_gap: 4.0,
        },
        glyphs,
    }
}

/// Phase 35.1: Selection state for text editing
#[derive(Copy, Clone, Debug)]
pub struct Selection {
    pub start: u32,
    pub end: u32,
    pub active: bool,
}

impl Selection {
    pub fn new() -> Self {
        Self {
            start: 0,
            end: 0,
            active: false,
        }
    }

    pub fn is_empty(&self) -> bool {
        !self.active || self.start == self.end
    }

    pub fn contains(&self, pos: u32) -> bool {
        if !self.active {
            return false;
        }
        let (min, max) = if self.start <= self.end {
            (self.start, self.end)
        } else {
            (self.end, self.start)
        };
        pos >= min && pos < max
    }

    pub fn length(&self) -> u32 {
        if !self.active {
            return 0;
        }
        if self.start <= self.end {
            self.end - self.start
        } else {
            self.start - self.end
        }
    }
}

/// Phase 35.3: Edit command for undo/redo
#[derive(Debug, Clone)]
pub enum EditCommand {
    Insert { pos: u32, chars: Vec<u32> },
    Delete { pos: u32, chars: Vec<u32> },
    Replace { start: u32, end: u32, old: Vec<u32>, new: Vec<u32> },
}

impl EditCommand {
    /// Get the position associated with this command
    pub fn pos(&self) -> Option<u32> {
        match self {
            EditCommand::Insert { pos, .. } => Some(*pos),
            EditCommand::Delete { pos, .. } => Some(*pos),
            EditCommand::Replace { start, .. } => Some(*start),
        }
    }
}

/// Phase 35.3: Undo/Redo history
pub struct UndoHistory {
    pub undo_stack: Vec<EditCommand>,
    pub redo_stack: Vec<EditCommand>,
    pub max_depth: usize,
}

impl UndoHistory {
    pub fn new(max_depth: usize) -> Self {
        Self {
            undo_stack: Vec::with_capacity(max_depth),
            redo_stack: Vec::with_capacity(max_depth),
            max_depth,
        }
    }

    pub fn can_undo(&self) -> bool {
        !self.undo_stack.is_empty()
    }

    pub fn can_redo(&self) -> bool {
        !self.redo_stack.is_empty()
    }

    pub fn push_command(&mut self, cmd: EditCommand) {
        // Clear redo stack on new command
        self.redo_stack.clear();

        // Maintain max depth
        if self.undo_stack.len() >= self.max_depth {
            self.undo_stack.remove(0);
        }
        self.undo_stack.push(cmd);
    }

    pub fn pop_undo(&mut self) -> Option<EditCommand> {
        self.undo_stack.pop()
    }

    pub fn pop_redo(&mut self) -> Option<EditCommand> {
        self.redo_stack.pop()
    }

    pub fn clear(&mut self) {
        self.undo_stack.clear();
        self.redo_stack.clear();
    }
}

pub struct TextEngine {
    pub pipeline: wgpu::RenderPipeline,
    pub compute_pipeline: wgpu::ComputePipeline,
    pub text_buffer: wgpu::Buffer,
    pub stats_buffer: wgpu::Buffer,
    pub uniform_buffer: wgpu::Buffer,
    pub bind_group: wgpu::BindGroup,
    pub compute_bind_group: wgpu::BindGroup,
    pub font_texture: wgpu::Texture,
    pub font_view: wgpu::TextureView,
    pub font_sampler: wgpu::Sampler,
    pub local_stats: TextStats,
    // Phase 34: CPU-side shadow buffer for save/load
    pub cpu_buffer: Vec<u32>,
    // Phase 35.1: Text selection state
    pub selection: Selection,
    // Phase 35.3: Undo/Redo history
    pub undo_history: UndoHistory,
    // Phase 37: Glyph metrics for variable-width fonts
    pub glyph_metrics_buffer: wgpu::Buffer,
    pub font_metadata: FontMetadata,
    // Phase 39: Pipeline layout for hot-swapping
    pub render_pipeline_layout: wgpu::PipelineLayout,
    // Phase Mode B.1: File Persistence
    pub current_file: Option<std::path::PathBuf>,
    // Phase 40: Hex Tensor Editor for binary substrate editing
    pub hex_editor: Option<HexTensorEditor>,
    // Phase 41: Visual AST for code gardener ecosystem
    pub visual_ast: Option<VisualAST>,
}

impl TextEngine {
    pub fn new(device: &wgpu::Device, queue: &wgpu::Queue, config: &wgpu::SurfaceConfiguration) -> Self {
        log::info!("Initializing Crystallized Text Engine...");

        // Load shaders
        let draw_shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("MSDF Font Shader"),
            source: wgpu::ShaderSource::Wgsl(include_str!("shaders/msdf_font.wgsl").into()),
        });

        let compute_shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Text Buffer Compute Shader"),
            source: wgpu::ShaderSource::Wgsl(include_str!("shaders/text_buffer.wgsl").into()),
        });

        // Initialize buffers
        let text_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Global Text Buffer"),
            size: 1024 * 1024, // 1MB text buffer
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        let stats_buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("Text Stats Buffer"),
            contents: bytemuck::cast_slice(&[0u32; 16]), // cursor, length, capacity, dirty, selection_start, selection_end, selection_active, padding
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST | wgpu::BufferUsages::UNIFORM,
        });

        // Phase 37: Generate and upload glyph metrics
        let font_metrics = generate_fallback_metrics();
        log::info!("✅ Phase 37: Generated {} glyph metrics", font_metrics.glyphs.len());

        let glyph_metrics_buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("Glyph Metrics Buffer"),
            contents: bytemuck::cast_slice(&font_metrics.glyphs),
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
        });

        // Create layouts
        let bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Text Engine Bind Group Layout"),
            entries: &[
                wgpu::BindGroupLayoutEntry {
                    binding: 0,
                    visibility: wgpu::ShaderStages::VERTEX | wgpu::ShaderStages::FRAGMENT | wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Uniform,
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                wgpu::BindGroupLayoutEntry {
                    binding: 1,
                    visibility: wgpu::ShaderStages::FRAGMENT | wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                wgpu::BindGroupLayoutEntry {
                    binding: 2,
                    visibility: wgpu::ShaderStages::FRAGMENT | wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                wgpu::BindGroupLayoutEntry {
                    binding: 3,
                    visibility: wgpu::ShaderStages::FRAGMENT,
                    ty: wgpu::BindingType::Texture {
                        sample_type: wgpu::TextureSampleType::Float { filterable: true },
                        view_dimension: wgpu::TextureViewDimension::D2,
                        multisampled: false,
                    },
                    count: None,
                },
                wgpu::BindGroupLayoutEntry {
                    binding: 4,
                    visibility: wgpu::ShaderStages::FRAGMENT,
                    ty: wgpu::BindingType::Sampler(wgpu::SamplerBindingType::Filtering),
                    count: None,
                },
                // Phase 37.2: Glyph metrics buffer (read-only storage)
                wgpu::BindGroupLayoutEntry {
                    binding: 5,
                    visibility: wgpu::ShaderStages::FRAGMENT,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: true },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
            ],
        });

        let pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Text Pipeline Layout"),
            bind_group_layouts: &[&bind_group_layout],
            push_constant_ranges: &[],
        });

        let pipeline = device.create_render_pipeline(&wgpu::RenderPipelineDescriptor {
            label: Some("MSDF Text Render Pipeline"),
            layout: Some(&pipeline_layout),
            vertex: wgpu::VertexState {
                module: &draw_shader,
                entry_point: "vs_main",
                buffers: &[],
            },
            fragment: Some(wgpu::FragmentState {
                module: &draw_shader,
                entry_point: "fs_main",
                targets: &[Some(wgpu::ColorTargetState {
                    format: config.format,
                    blend: Some(wgpu::BlendState::ALPHA_BLENDING),
                    write_mask: wgpu::ColorWrites::ALL,
                })],
            }),
            primitive: wgpu::PrimitiveState::default(),
            depth_stencil: None,
            multisample: wgpu::MultisampleState::default(),
            multiview: None,
        });

        let compute_pipeline = device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("Text Buffer Compute Pipeline"),
            layout: Some(&pipeline_layout),
            module: &compute_shader,
            entry_point: "update_text",
        });

        let uniform_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Text Engine Uniforms"),
            size: 64, // Standard uniform size
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // Initialize CPU buffer
        let cpu_buffer = vec![0u32; (1024 * 1024 / 4) as usize];

        // Phase 33: Generate and populate font atlas
        log::info!("Phase 33: Generating font atlas...");
        let font_atlas = generate_fallback_atlas();
        
        let font_texture = device.create_texture(&wgpu::TextureDescriptor {
            label: Some("MSDF Font Atlas"),
            size: wgpu::Extent3d {
                width: font_atlas.width,
                height: font_atlas.height,
                depth_or_array_layers: 1,
            },
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8UnormSrgb,
            usage: wgpu::TextureUsages::TEXTURE_BINDING | wgpu::TextureUsages::COPY_DST,
            view_formats: &[],
        });
        
        queue.write_texture(
            wgpu::ImageCopyTexture {
                texture: &font_texture,
                mip_level: 0,
                origin: wgpu::Origin3d::ZERO,
                aspect: wgpu::TextureAspect::All,
            },
            &font_atlas.data,
            wgpu::ImageDataLayout {
                offset: 0,
                bytes_per_row: Some(font_atlas.width * 4),
                rows_per_image: Some(font_atlas.height),
            },
            wgpu::Extent3d {
                width: font_atlas.width,
                height: font_atlas.height,
                depth_or_array_layers: 1,
            },
        );
        
        log::info!("✅ Phase 33: Font atlas uploaded - {} glyphs", font_atlas.glyphs.len());
        
        let font_view = font_texture.create_view(&wgpu::TextureViewDescriptor::default());
        let font_sampler = device.create_sampler(&wgpu::SamplerDescriptor {
            address_mode_u: wgpu::AddressMode::ClampToEdge,
            address_mode_v: wgpu::AddressMode::ClampToEdge,
            mag_filter: wgpu::FilterMode::Linear,
            min_filter: wgpu::FilterMode::Linear,
            mipmap_filter: wgpu::FilterMode::Nearest,
            ..Default::default()
        });

        // Create bind groups
        let bind_group = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Text Engine Render Bind Group"),
            layout: &bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: uniform_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: text_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 2,
                    resource: stats_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 3,
                    resource: wgpu::BindingResource::TextureView(&font_view),
                },
                wgpu::BindGroupEntry {
                    binding: 4,
                    resource: wgpu::BindingResource::Sampler(&font_sampler),
                },
                // Phase 37.2: Glyph metrics buffer binding
                wgpu::BindGroupEntry {
                    binding: 5,
                    resource: glyph_metrics_buffer.as_entire_binding(),
                },
            ],
        });

        let compute_bind_group = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Text Engine Compute Bind Group"),
            layout: &bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: uniform_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: text_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 2,
                    resource: stats_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 3,
                    resource: wgpu::BindingResource::TextureView(&font_view),
                },
                wgpu::BindGroupEntry {
                    binding: 4,
                    resource: wgpu::BindingResource::Sampler(&font_sampler),
                },
                wgpu::BindGroupEntry {
                    binding: 5,
                    resource: glyph_metrics_buffer.as_entire_binding(),
                },
            ],
        });

        // Phase 40: Initialize Hex Tensor Editor
        let hex_editor = Some(HexTensorEditor::new(device));
        log::info!("⚡ Phase 40: Hex Tensor Editor initialized");

        Self {
            pipeline,
            compute_pipeline,
            text_buffer,
            stats_buffer,
            uniform_buffer,
            bind_group,
            compute_bind_group,
            font_texture,
            font_view,
            font_sampler,
            local_stats: TextStats {
                cursor_pos: 0,
                length: 0,
                capacity: 1024 * 1024 / 4, // 1MB buffer of u32
                dirty: 0,
                selection_start: 0,
                selection_end: 0,
                selection_active: 0,
            },
            cpu_buffer: vec![0u32; (1024 * 1024 / 4) as usize],
            selection: Selection::new(),
            undo_history: UndoHistory::new(50), // 50 undo levels
            glyph_metrics_buffer,
            font_metadata: font_metrics.metadata,
            render_pipeline_layout: pipeline_layout,
            current_file: None,
            hex_editor: Some(crate::hex_tensor_editor::HexTensorEditor::new(device)),
            visual_ast: None,
        }
    }

    /// Phase 39: Hot-swap the fragment shader with new WGSL source
    pub fn recompile_pipeline(&mut self, device: &wgpu::Device, format: wgpu::TextureFormat, source: &str) -> Result<(), String> {
        log::info!("⚡ Phase 39: Recompiling TextEngine pipeline...");

        let shader_module = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Hot-Swapped Text Shader"),
            source: wgpu::ShaderSource::Wgsl(source.into()),
        });

        let new_pipeline = device.create_render_pipeline(&wgpu::RenderPipelineDescriptor {
            label: Some("Crystallized Hot-Swap Pipeline"),
            layout: Some(&self.render_pipeline_layout),
            vertex: wgpu::VertexState {
                module: &shader_module,
                entry_point: "vs_main",
                buffers: &[],
            },
            fragment: Some(wgpu::FragmentState {
                module: &shader_module,
                entry_point: "fs_main",
                targets: &[Some(wgpu::ColorTargetState {
                    format,
                    blend: Some(wgpu::BlendState::ALPHA_BLENDING),
                    write_mask: wgpu::ColorWrites::ALL,
                })],
            }),
            primitive: wgpu::PrimitiveState::default(),
            depth_stencil: None,
            multisample: wgpu::MultisampleState::default(),
            multiview: None,
        });

        self.pipeline = new_pipeline;
        log::info!("✅ Phase 39: Shader hot-swapped successfully!");
        Ok(())
    }

    // Phase Mode B.1: File Persistence
    pub fn load_from_path(&mut self, queue: &wgpu::Queue, path: &std::path::Path) -> Result<(), Box<dyn std::error::Error>> {
        let content = std::fs::read_to_string(path)?;
        let chars: Vec<u32> = content.chars().map(|c| c as u32).collect();

        if chars.len() > self.cpu_buffer.len() {
             return Err(format!("File too large: {} chars (max {})", chars.len(), self.cpu_buffer.len()).into());
        }

        // Update CPU buffer (fill remaining with 0)
        self.cpu_buffer[..chars.len()].copy_from_slice(&chars);
        for i in chars.len()..self.cpu_buffer.len() {
            self.cpu_buffer[i] = 0;
        }

        self.local_stats.length = chars.len() as u32;
        self.local_stats.cursor_pos = chars.len() as u32; 
        self.local_stats.dirty = 1;
        self.current_file = Some(path.to_path_buf());

        // Update GPU buffers
        // 1. Text Content
        queue.write_buffer(&self.text_buffer, 0, bytemuck::cast_slice(&self.cpu_buffer));

        // 2. Stats
        self.local_stats.dirty = 1; // Redundant but explicit
        queue.write_buffer(&self.stats_buffer, 0, bytemuck::cast_slice(&[self.local_stats]));

        log::info!("📂 Loaded file: {:?}", path);
        Ok(())
    }

    pub fn save_to_path(&self, path: &std::path::Path) -> Result<(), Box<dyn std::error::Error>> {
        // Phase 40: Handle Hex Mode Save
        if let Some(hex_editor) = &self.hex_editor {
            if hex_editor.mode == crate::hex_tensor_editor::EditorMode::Tensor {
                 hex_editor.save_substrate(Some(path))?;
                 return Ok(());
            }
        }

        let length = self.local_stats.length as usize;
        let data = &self.cpu_buffer[..length];
        
        let s: String = data.iter().filter_map(|&c| std::char::from_u32(c)).collect();
        std::fs::write(path, s)?;
        
        log::info!("💾 Saved file: {:?}", path);
        Ok(())
    }

    // Phase 40.3: Neural Link Passthrough
    pub fn get_hex_neural_prompt(&mut self) -> Option<String> {
        if let Some(hex_editor) = &mut self.hex_editor {
            return hex_editor.neural_consult();
        }
        None
    }

    pub fn apply_hex_neural_annotation(&mut self, queue: &wgpu::Queue, offset: usize, annotation: crate::hex_tensor_editor::NeuralAnnotation) {
        if let Some(hex_editor) = &mut self.hex_editor {
            hex_editor.cache_neural_annotation(offset, annotation);
            hex_editor.dirty = true;
            hex_editor.sync_gpu(queue); // Immediate sync to show gold highlights
            log::info!("🧠 Applied neural annotation at 0x{:04X}", offset);
        }
    }

    pub fn update(&mut self, queue: &wgpu::Queue, character: u8) {
        // Phase 40: Handle hex input when in tensor mode
        if self.is_hex_mode() {
            // Check for Search Mode special keys
            if let Some(ref mut hex_editor) = self.hex_editor {
                if hex_editor.mode == EditorMode::SearchInput {
                    if character == b'\n' { // Enter to execute search
                         hex_editor.execute_search();
                         return;
                    }
                    if character == 27 { // Escape to cancel search
                         hex_editor.toggle_search_mode();
                         return;
                    }
                }
            }

            if let Some(ch) = std::char::from_u32(character as u32) {
                // Handle hex characters (0-9, A-F)
                if ch.is_ascii_hexdigit() {
                    self.handle_hex_input(queue, ch.to_ascii_uppercase());
                    return;
                }
                // Handle navigation in hex mode
                match character {
                    128 => self.navigate_hex(queue, HexNavDirection::Up),
                    129 => self.navigate_hex(queue, HexNavDirection::Down),
                    130 => self.navigate_hex(queue, HexNavDirection::Left),
                    131 => self.navigate_hex(queue, HexNavDirection::Right),
                    132 => self.navigate_hex(queue, HexNavDirection::Home),
                    133 => self.navigate_hex(queue, HexNavDirection::End),
                    _ => {}
                }
                return;
            }
        }

        // Phase 32: Cursor Navigation and Line-Wrapping Logic
        let grid_width: u32 = 80;
        let grid_height: u32 = 40;
        let max_cells = grid_width * grid_height;

        match character {
            // Newline
            b'\n' => {
                let current_row = self.local_stats.cursor_pos / grid_width;
                if current_row < grid_height - 1 {
                    self.local_stats.cursor_pos = (current_row + 1) * grid_width;
                }
            }
            // Backspace
            8 => {
                if self.local_stats.cursor_pos > 0 {
                    self.local_stats.cursor_pos -= 1;
                    // Write a null character to "erase"
                    let offset = (self.local_stats.cursor_pos * 4) as u64;
                    queue.write_buffer(&self.text_buffer, offset, bytemuck::cast_slice(&[0u32]));
                    // Phase 34: Keep CPU buffer in sync
                    if (self.local_stats.cursor_pos as usize) < self.cpu_buffer.len() {
                        self.cpu_buffer[self.local_stats.cursor_pos as usize] = 0;
                    }
                }
            }
            // Navigation Keys
            128 => { // Up
                if self.local_stats.cursor_pos >= grid_width {
                    self.local_stats.cursor_pos -= grid_width;
                }
            }
            129 => { // Down
                if self.local_stats.cursor_pos + grid_width < max_cells {
                    self.local_stats.cursor_pos += grid_width;
                }
            }
            130 => { // Left
                if self.local_stats.cursor_pos > 0 {
                    self.local_stats.cursor_pos -= 1;
                }
            }
            131 => { // Right
                if self.local_stats.cursor_pos < max_cells - 1 {
                    self.local_stats.cursor_pos += 1;
                }
            }
            132 => { // Home
                self.local_stats.cursor_pos = (self.local_stats.cursor_pos / grid_width) * grid_width;
            }
            133 => { // End
                self.local_stats.cursor_pos = (self.local_stats.cursor_pos / grid_width) * grid_width + (grid_width - 1);
            }
            134 => { // Delete
                let offset = (self.local_stats.cursor_pos * 4) as u64;
                queue.write_buffer(&self.text_buffer, offset, bytemuck::cast_slice(&[0u32]));
                // Phase 34: Keep CPU buffer in sync
                if (self.local_stats.cursor_pos as usize) < self.cpu_buffer.len() {
                    self.cpu_buffer[self.local_stats.cursor_pos as usize] = 0;
                }
            }
            // Regular Characters
            _ => {
                let char_u32 = character as u32;
                let offset = (self.local_stats.cursor_pos * 4) as u64;
                queue.write_buffer(&self.text_buffer, offset, bytemuck::cast_slice(&[char_u32]));

                // Phase 34: Keep CPU buffer in sync
                if (self.local_stats.cursor_pos as usize) < self.cpu_buffer.len() {
                    self.cpu_buffer[self.local_stats.cursor_pos as usize] = char_u32;
                }

                // Advance cursor with automatic wrapping
                self.local_stats.cursor_pos += 1;
                if self.local_stats.cursor_pos >= max_cells {
                    self.local_stats.cursor_pos = 0; // Wrap to start for now
                }
            }
        }

        // Sync stats to GPU
        self.local_stats.dirty = 1;
        queue.write_buffer(&self.stats_buffer, 0, bytemuck::cast_slice(&[self.local_stats]));
        
        log::debug!("💎 Crystallized Text Engine: Op=0x{:02x}, Cursor={}", 
            character, self.local_stats.cursor_pos);
    }

    pub fn render<'a>(
        &'a self,
        rpass: &mut wgpu::RenderPass<'a>,
    ) {
        rpass.set_pipeline(&self.pipeline);
        rpass.set_bind_group(0, &self.bind_group, &[]);
        rpass.draw(0..4, 0..1);
    }

    // ============================================
    // Phase 35.1: Text Selection System
    // ============================================

    /// Sync selection state to GPU stats buffer
    fn sync_selection_to_gpu(&mut self, queue: &wgpu::Queue) {
        self.local_stats.selection_start = self.selection.start;
        self.local_stats.selection_end = self.selection.end;
        self.local_stats.selection_active = if self.selection.active { 1 } else { 0 };
        queue.write_buffer(&self.stats_buffer, 0, bytemuck::cast_slice(&[self.local_stats]));
    }

    /// Start a new selection at the current cursor position
    pub fn start_selection(&mut self, queue: &wgpu::Queue) {
        self.selection.start = self.local_stats.cursor_pos;
        self.selection.end = self.local_stats.cursor_pos;
        self.selection.active = true;
        self.sync_selection_to_gpu(queue);
        log::debug!("🎯 Selection started at {}", self.selection.start);
    }

    /// Extend the selection to a new position (for drag or shift+arrows)
    pub fn extend_selection(&mut self, queue: &wgpu::Queue, new_pos: u32) {
        if self.selection.active {
            self.selection.end = new_pos.clamp(0, self.local_stats.capacity - 1);
            self.sync_selection_to_gpu(queue);
            log::debug!("🎯 Selection extended to {} (length: {})",
                self.selection.end, self.selection.length());
        }
    }

    /// Set selection directly (for click selection)
    pub fn set_selection(&mut self, queue: &wgpu::Queue, start: u32, end: u32) {
        self.selection.start = start.min(self.local_stats.capacity - 1);
        self.selection.end = end.min(self.local_stats.capacity - 1);
        self.selection.active = start != end;
        self.sync_selection_to_gpu(queue);
        log::debug!("🎯 Selection set: {} -> {} (active: {})",
            self.selection.start, self.selection.end, self.selection.active);
    }

    /// Clear the current selection
    pub fn clear_selection(&mut self, queue: &wgpu::Queue) {
        self.selection.active = false;
        self.selection.start = 0;
        self.selection.end = 0;
        self.sync_selection_to_gpu(queue);
        log::debug!("🎯 Selection cleared");
    }

    /// Select all text in the buffer
    pub fn select_all(&mut self, queue: &wgpu::Queue) {
        // Find the actual end of text (last non-null character)
        let mut text_end = 0;
        for (i, &ch) in self.cpu_buffer.iter().enumerate() {
            if ch != 0 {
                text_end = i + 1;
            }
        }

        self.selection.start = 0;
        self.selection.end = text_end as u32;
        self.selection.active = text_end > 0;
        self.sync_selection_to_gpu(queue);

        log::debug!("🎯 Select all: {} characters", self.selection.length());
    }

    /// Delete the selected text and return it as a string
    pub fn delete_selection(&mut self, queue: &wgpu::Queue) -> String {
        if self.selection.is_empty() {
            return String::new();
        }

        let (min, max) = if self.selection.start <= self.selection.end {
            (self.selection.start, self.selection.end)
        } else {
            (self.selection.end, self.selection.start)
        };

        let selected: String = self.cpu_buffer[min as usize..max as usize]
            .iter()
            .filter(|&&c| c != 0)
            .map(|&c| c as u8 as char)
            .collect();

        // Shift remaining text left
        let selection_len = max - min;
        for i in min as usize..self.cpu_buffer.len() - selection_len as usize {
            self.cpu_buffer[i] = self.cpu_buffer[i + selection_len as usize];
        }

        // Clear the end
        for i in (self.cpu_buffer.len() - selection_len as usize)..self.cpu_buffer.len() {
            self.cpu_buffer[i] = 0;
        }

        // Upload updated buffer to GPU
        let data: Vec<u8> = self.cpu_buffer.iter()
            .flat_map(|&c| c.to_le_bytes().to_vec())
            .collect();
        queue.write_buffer(&self.text_buffer, 0, &data);

        // Move cursor to deletion point
        self.local_stats.cursor_pos = min;

        // Clear selection and sync to GPU
        self.selection.active = false;
        self.selection.start = 0;
        self.selection.end = 0;
        self.local_stats.dirty = 1;
        queue.write_buffer(&self.stats_buffer, 0, bytemuck::cast_slice(&[self.local_stats]));

        log::debug!("🎯 Deleted selection: '{}' (moved cursor to {})", selected, min);
        selected
    }

    /// Get the selected text as a string
    pub fn get_selected_text(&self) -> String {
        if self.selection.is_empty() {
            return String::new();
        }

        let (min, max) = if self.selection.start <= self.selection.end {
            (self.selection.start, self.selection.end)
        } else {
            (self.selection.end, self.selection.start)
        };

        self.cpu_buffer[min as usize..max as usize]
            .iter()
            .filter(|&&c| c != 0)
            .map(|&c| c as u8 as char)
            .collect()
    }

    /// Replace the selected text with new content
    pub fn replace_selection(&mut self, queue: &wgpu::Queue, new_text: &str) {
        let old_text = self.delete_selection(queue);

        // Insert new text at cursor position
        for ch in new_text.bytes() {
            self.update(queue, ch);
        }

        log::debug!("🎯 Replaced selection ({} chars) with {} chars",
            old_text.len(), new_text.len());
    }

    // ============================================
    // Phase 35.3: Undo/Redo System
    // ============================================

    /// Record an insert operation for undo
    pub fn record_insert(&mut self, pos: u32, chars: &[u32]) {
        let cmd = EditCommand::Insert {
            pos,
            chars: chars.to_vec(),
        };
        self.undo_history.push_command(cmd);
        log::debug!("↩️ Recorded insert at pos {} ({} chars)", pos, chars.len());
    }

    /// Record a delete operation for undo
    pub fn record_delete(&mut self, pos: u32, chars: &[u32]) {
        let cmd = EditCommand::Delete {
            pos,
            chars: chars.to_vec(),
        };
        self.undo_history.push_command(cmd);
        log::debug!("↩️ Recorded delete at pos {} ({} chars)", pos, chars.len());
    }

    /// Record a replace operation for undo
    pub fn record_replace(&mut self, start: u32, end: u32, old: &[u32], new: &[u32]) {
        let cmd = EditCommand::Replace {
            start,
            end,
            old: old.to_vec(),
            new: new.to_vec(),
        };
        self.undo_history.push_command(cmd);
        log::debug!("↩️ Recorded replace {}->{} ({} -> {} chars)",
            start, end, old.len(), new.len());
    }

    /// Undo the last operation
    pub fn undo(&mut self, queue: &wgpu::Queue) -> bool {
        if let Some(cmd) = self.undo_history.pop_undo() {
            // Clone before matching to avoid partial move
            let cmd_clone = cmd.clone();

            match cmd {
                EditCommand::Insert { pos, chars } => {
                    // To undo insert: delete those characters
                    let start = pos as usize;
                    let end = (pos + chars.len() as u32) as usize;

                    // Shift remaining text left
                    let len = chars.len();
                    for i in start..self.cpu_buffer.len() - len {
                        self.cpu_buffer[i] = self.cpu_buffer[i + len];
                    }
                    // Clear the end
                    for i in (self.cpu_buffer.len() - len)..self.cpu_buffer.len() {
                        self.cpu_buffer[i] = 0;
                    }

                    // Upload to GPU
                    let data: Vec<u8> = self.cpu_buffer.iter()
                        .flat_map(|&c| c.to_le_bytes().to_vec())
                        .collect();
                    queue.write_buffer(&self.text_buffer, 0, &data);

                    // Move cursor back
                    self.local_stats.cursor_pos = pos;
                    self.local_stats.dirty = 1;
                    queue.write_buffer(&self.stats_buffer, 0, bytemuck::cast_slice(&[self.local_stats]));

                    // Push to redo stack
                    self.undo_history.redo_stack.push(cmd_clone);

                    log::info!("↩️ Undo insert at pos {} ({} chars)", pos, chars.len());
                }
                EditCommand::Delete { pos, chars } => {
                    // To undo delete: reinsert the characters
                    let start = pos as usize;
                    for (i, &ch) in chars.iter().enumerate() {
                        if start + i < self.cpu_buffer.len() {
                            self.cpu_buffer[start + i] = ch;
                        }
                    }

                    // Upload to GPU
                    let data: Vec<u8> = self.cpu_buffer.iter()
                        .flat_map(|&c| c.to_le_bytes().to_vec())
                        .collect();
                    queue.write_buffer(&self.text_buffer, 0, &data);

                    // Move cursor to end of restored text
                    self.local_stats.cursor_pos = pos + chars.len() as u32;
                    self.local_stats.dirty = 1;
                    queue.write_buffer(&self.stats_buffer, 0, bytemuck::cast_slice(&[self.local_stats]));

                    // Push to redo stack
                    self.undo_history.redo_stack.push(cmd_clone);

                    log::info!("↩️ Undo delete at pos {} ({} chars)", pos, chars.len());
                }
                EditCommand::Replace { start, end, old, new } => {
                    // To undo replace: restore old text
                    let start_usize = start as usize;
                    for (i, &ch) in old.iter().enumerate() {
                        if start_usize + i < self.cpu_buffer.len() {
                            self.cpu_buffer[start_usize + i] = ch;
                        }
                    }

                    // Upload to GPU
                    let data: Vec<u8> = self.cpu_buffer.iter()
                        .flat_map(|&c| c.to_le_bytes().to_vec())
                        .collect();
                    queue.write_buffer(&self.text_buffer, 0, &data);

                    // Move cursor to end of restored selection
                    self.local_stats.cursor_pos = end;
                    self.local_stats.dirty = 1;
                    queue.write_buffer(&self.stats_buffer, 0, bytemuck::cast_slice(&[self.local_stats]));

                    // Push to redo stack
                    self.undo_history.redo_stack.push(cmd_clone);

                    log::info!("↩️ Undo replace {}->{} ({} -> {} chars)",
                        start, end, new.len(), old.len());
                }
            }
            true
        } else {
            log::debug!("↩️ Nothing to undo");
            false
        }
    }

    /// Redo the last undone operation
    pub fn redo(&mut self, queue: &wgpu::Queue) -> bool {
        if let Some(cmd) = self.undo_history.pop_redo() {
            // Clone before matching to avoid partial move
            let cmd_clone = cmd.clone();

            match cmd {
                EditCommand::Insert { pos, chars } => {
                    // Redo insert: reinsert the characters
                    let start = pos as usize;
                    for (i, &ch) in chars.iter().enumerate() {
                        if start + i < self.cpu_buffer.len() {
                            self.cpu_buffer[start + i] = ch;
                        }
                    }

                    // Upload to GPU
                    let data: Vec<u8> = self.cpu_buffer.iter()
                        .flat_map(|&c| c.to_le_bytes().to_vec())
                        .collect();
                    queue.write_buffer(&self.text_buffer, 0, &data);

                    // Move cursor to end
                    self.local_stats.cursor_pos = pos + chars.len() as u32;
                    self.local_stats.dirty = 1;
                    queue.write_buffer(&self.stats_buffer, 0, bytemuck::cast_slice(&[self.local_stats]));

                    // Push back to undo stack
                    self.undo_history.undo_stack.push(cmd_clone);

                    log::info!("↪️ Redo insert at pos {} ({} chars)", pos, chars.len());
                }
                EditCommand::Delete { pos, chars } => {
                    // Redo delete: remove the characters again
                    let start = pos as usize;
                    let end = (pos + chars.len() as u32) as usize;

                    // Shift remaining text left
                    let len = chars.len();
                    for i in start..self.cpu_buffer.len() - len {
                        self.cpu_buffer[i] = self.cpu_buffer[i + len];
                    }
                    // Clear the end
                    for i in (self.cpu_buffer.len() - len)..self.cpu_buffer.len() {
                        self.cpu_buffer[i] = 0;
                    }

                    // Upload to GPU
                    let data: Vec<u8> = self.cpu_buffer.iter()
                        .flat_map(|&c| c.to_le_bytes().to_vec())
                        .collect();
                    queue.write_buffer(&self.text_buffer, 0, &data);

                    // Move cursor back
                    self.local_stats.cursor_pos = pos;
                    self.local_stats.dirty = 1;
                    queue.write_buffer(&self.stats_buffer, 0, bytemuck::cast_slice(&[self.local_stats]));

                    // Push back to undo stack
                    self.undo_history.undo_stack.push(cmd_clone);

                    log::info!("↪️ Redo delete at pos {} ({} chars)", pos, chars.len());
                }
                EditCommand::Replace { start, end, new, .. } => {
                    // Redo replace: restore new text
                    let start_usize = start as usize;
                    for (i, &ch) in new.iter().enumerate() {
                        if start_usize + i < self.cpu_buffer.len() {
                            self.cpu_buffer[start_usize + i] = ch;
                        }
                    }

                    // Upload to GPU
                    let data: Vec<u8> = self.cpu_buffer.iter()
                        .flat_map(|&c| c.to_le_bytes().to_vec())
                        .collect();
                    queue.write_buffer(&self.text_buffer, 0, &data);

                    // Move cursor to end
                    self.local_stats.cursor_pos = end;
                    self.local_stats.dirty = 1;
                    queue.write_buffer(&self.stats_buffer, 0, bytemuck::cast_slice(&[self.local_stats]));

                    // Push back to undo stack
                    self.undo_history.undo_stack.push(cmd_clone);

                    log::info!("↪️ Redo replace {}->{} ({} chars)", start, end, new.len());
                }
            }
            true
        } else {
            log::debug!("↪️ Nothing to redo");
            false
        }
    }

    // ============================================
    // Phase 34: Persistent Storage
    // ============================================

    /// Save current text buffer to a JSON file
    pub fn save_to_file(&self, path: &std::path::Path) -> Result<(), Box<dyn std::error::Error>> {
        // Use CPU buffer for save (simpler than GPU readback)
        let saved_data = SavedTextData {
            version: 1,
            timestamp: std::time::SystemTime::now()
                .duration_since(std::time::UNIX_EPOCH)?
                .as_secs(),
            cursor_pos: self.local_stats.cursor_pos,
            text_length: self.local_stats.length,
            buffer_snapshot: self.cpu_buffer.clone(),
        };

        let json = serde_json::to_string_pretty(&saved_data)?;
        std::fs::write(path, json)?;

        log::info!("💾 Phase 34: Saved text to {:?}", path);
        Ok(())
    }

    /// Load text from a JSON file back into the GPU buffer
    pub fn load_from_file(&mut self, queue: &wgpu::Queue, path: &std::path::Path) -> Result<(), Box<dyn std::error::Error>> {
        let json = std::fs::read_to_string(path)?;
        let saved_data: SavedTextData = serde_json::from_str(&json)?;

        // Restore cursor position
        self.local_stats.cursor_pos = saved_data.cursor_pos;
        self.local_stats.length = saved_data.text_length;

        // Restore CPU buffer
        if !saved_data.buffer_snapshot.is_empty() {
            // Copy to CPU buffer
            let len = self.cpu_buffer.len().min(saved_data.buffer_snapshot.len());
            self.cpu_buffer[..len].copy_from_slice(&saved_data.buffer_snapshot[..len]);

            // Upload to GPU buffer
            let data: Vec<u8> = saved_data.buffer_snapshot.iter()
                .flat_map(|&c| c.to_le_bytes().to_vec())
                .collect();
            queue.write_buffer(&self.text_buffer, 0, &data[..(len * 4).min(data.len())]);
        }

        // Sync stats to GPU
        self.local_stats.dirty = 1;
        queue.write_buffer(&self.stats_buffer, 0, bytemuck::cast_slice(&[self.local_stats]));

        log::info!("📂 Phase 34: Loaded text from {:?} (cursor={})", path, self.local_stats.cursor_pos);
        Ok(())
    }

    /// Phase 38: Extract text from cpu_buffer as executable string
    pub fn get_text_as_string(&self) -> String {
        let mut result = String::new();
        let mut current_line = String::new();
        
        // Grid dimensions
        const GRID_WIDTH: usize = 80;
        
        // Iterate through cpu_buffer
        for (i, &char_code) in self.cpu_buffer.iter().enumerate() {
            if char_code == 0 {
                current_line.push(' ');
            } else {
                current_line.push(char_code as u8 as char);
            }
            
            // End of line (80 chars)
            if (i + 1) % GRID_WIDTH == 0 {
                // Trim trailing whitespace but preserve structure
                let trimmed = current_line.trim_end();
                if !trimmed.is_empty() || !result.is_empty() {
                    result.push_str(trimmed);
                    result.push('\n');
                }
                current_line.clear();
            }
        }
        
        result
    }

    /// Phase 38: Get only the selected text
    pub fn get_selection_as_string(&self) -> String {
        if self.selection.is_empty() {
            return self.get_text_as_string();
        }
        
        let (min, max) = if self.selection.start <= self.selection.end {
            (self.selection.start as usize, self.selection.end as usize)
        } else {
            (self.selection.end as usize, self.selection.start as usize)
        };
        
        self.cpu_buffer[min..max]
            .iter()
            .filter(|&&c| c != 0)
            .map(|&c| c as u8 as char)
            .collect()
    }

    /// Clear the text buffer
    pub fn clear(&mut self, queue: &wgpu::Queue) {
        // Fill CPU buffer with zeros
        self.cpu_buffer.fill(0);

        // Fill GPU buffer with zeros
        let zeros = vec![0u32; (1024 * 1024 / 4) as usize];
        queue.write_buffer(&self.text_buffer, 0, bytemuck::cast_slice(&zeros));

        // Reset cursor and stats
        self.local_stats.cursor_pos = 0;
        self.local_stats.length = 0;
        self.local_stats.dirty = 1;
        queue.write_buffer(&self.stats_buffer, 0, bytemuck::cast_slice(&[self.local_stats]));

        log::info!("🗑️ Phase 34: Cleared text buffer");
    }

    // ============================================
    // Phase 38.4: Output Tile for Execution Results
    // ============================================

    /// Display execution output on the map at a specified position
    /// This creates an "output tile" that shows execution results
    pub fn display_output(&mut self, queue: &wgpu::Queue, output: &str, line_offset: u32) {
        const GRID_WIDTH: usize = 80;
        const MAX_OUTPUT_LINES: u32 = 5; // Show up to 5 lines of output

        let lines: Vec<&str> = output.lines().take(MAX_OUTPUT_LINES as usize).collect();

        for (i, line) in lines.iter().enumerate() {
            let target_line = line_offset + i as u32;
            let start_pos = (target_line * GRID_WIDTH as u32) as usize;

            // Write each character of the output line
            for (j, ch) in line.chars().enumerate() {
                if start_pos + j < self.cpu_buffer.len() {
                    let char_u32 = ch as u32;
                    self.cpu_buffer[start_pos + j] = char_u32;

                    // Upload to GPU
                    let offset = ((start_pos + j) * 4) as u64;
                    queue.write_buffer(&self.text_buffer, offset, bytemuck::cast_slice(&[char_u32]));
                }
            }

            // Update length to include the new output
            let line_end = start_pos + line.len();
            if line_end > self.local_stats.length as usize {
                self.local_stats.length = line_end as u32;
            }
        }

        // Mark as dirty and sync stats
        self.local_stats.dirty = 1;
        queue.write_buffer(&self.stats_buffer, 0, bytemuck::cast_slice(&[self.local_stats]));

        log::info!("📤 Phase 38.4: Displayed output at line {}", line_offset);
    }

    /// Clear output at a specific line range
    pub fn clear_output(&mut self, queue: &wgpu::Queue, line_offset: u32, line_count: u32) {
        const GRID_WIDTH: usize = 80;

        for line in 0..line_count {
            let start_pos = ((line_offset + line) * GRID_WIDTH as u32) as usize;
            let end_pos = start_pos + GRID_WIDTH;

            if end_pos <= self.cpu_buffer.len() {
                // Clear CPU buffer
                for i in start_pos..end_pos {
                    self.cpu_buffer[i] = 0;
                }

                // Clear GPU buffer
                let offset = (start_pos * 4) as u64;
                let zeros = vec![0u32; GRID_WIDTH];
                queue.write_buffer(&self.text_buffer, offset, bytemuck::cast_slice(&zeros));
            }
        }

        // Mark as dirty
        self.local_stats.dirty = 1;
        queue.write_buffer(&self.stats_buffer, 0, bytemuck::cast_slice(&[self.local_stats]));

        log::info!("🧹 Phase 38.4: Cleared output at line {}", line_offset);
    }

    // ============================================
    // Phase 40: Hex Tensor Editor Integration
    // In-Vivo Substrate Surgery on the Infinite Map
    // ============================================

    /// Phase 40: Prepare GPU state (Dispatch Compute)
    pub fn prepare_gpu(&mut self, queue: &wgpu::Queue, encoder: &mut wgpu::CommandEncoder) {
        if let Some(hex) = &mut self.hex_editor {
            if hex.mode == crate::hex_tensor_editor::EditorMode::Tensor {
                hex.sync_gpu(queue);
                hex.dispatch(encoder);
            }
        }
    }

    /// Enter hex editing mode and load a binary substrate file
    pub fn enter_hex_mode(&mut self, device: &wgpu::Device, queue: &wgpu::Queue, path: &std::path::Path) -> Result<(), Box<dyn std::error::Error>> {
        if let Some(ref mut hex_editor) = self.hex_editor {
            hex_editor.load_substrate(queue, path)?;
            
            // Link hex editor to text buffer
            let dummy_color = device.create_buffer(&wgpu::BufferDescriptor {
                label: Some("Dummy Color"), size: 1024, usage: wgpu::BufferUsages::STORAGE, mapped_at_creation: false
            });
            hex_editor.rebuild_bind_group(device, &self.text_buffer, &dummy_color);
            
            log::info!("🧬 Phase 40: Entered hex mode with {:?}", path);
            Ok(())
        } else {
            Err("Hex editor not initialized".into())
        }
    }

    /// Exit hex mode and return to document mode
    pub fn exit_hex_mode(&mut self, queue: &wgpu::Queue) {
        if let Some(ref mut hex_editor) = self.hex_editor {
            hex_editor.set_mode(EditorMode::Document, queue);
            // Clear the text buffer to remove hex display
            self.clear(queue);
            log::info!("📝 Phase 40: Exited hex mode, returned to document mode");
        }
    }

    /// Check if currently in hex editing mode
    pub fn is_hex_mode(&self) -> bool {
        self.hex_editor.as_ref()
            .map(|h| h.mode == EditorMode::Tensor || h.mode == EditorMode::SearchInput)
            .unwrap_or(false)
    }

    /// Get substrate information if in hex mode
    pub fn get_substrate_info(&self) -> Option<&crate::hex_tensor_editor::SubstrateInfo> {
        self.hex_editor.as_ref().map(|h| &h.substrate_info)
    }

    /// Handle hex input (0-9, A-F) when in tensor mode
    pub fn handle_hex_input(&mut self, queue: &wgpu::Queue, ch: char) -> bool {
        if !self.is_hex_mode() {
            return false;
        }

        if let Some(ref mut hex_editor) = self.hex_editor {
            if hex_editor.mode == EditorMode::SearchInput {
                return hex_editor.handle_search_input(ch);
            }
            hex_editor.update_hex_at_cursor(queue, ch)
        } else {
            false
        }
    }

    /// Navigate in hex grid (special navigation for hex editor)
    pub fn navigate_hex(&mut self, queue: &wgpu::Queue, direction: HexNavDirection) {
        if let Some(ref mut hex_editor) = self.hex_editor {
            hex_editor.navigate_hex(queue, direction);
        }
    }

    /// Save substrate back to file (only valid in hex mode)
    pub fn save_substrate(&self, path: Option<&std::path::Path>) -> Result<(), Box<dyn std::error::Error>> {
        if let Some(ref hex_editor) = self.hex_editor {
            hex_editor.save_substrate(path)
        } else {
            Err("Hex editor not initialized".into())
        }
    }

    /// Undo last hex edit (Phase 40.1)
    pub fn undo_hex_edit(&mut self, queue: &wgpu::Queue) -> bool {
        if let Some(ref mut hex_editor) = self.hex_editor {
            hex_editor.undo(queue)
        } else {
            false
        }
    }

    /// Redo last hex edit (Phase 40.1)
    pub fn redo_hex_edit(&mut self, queue: &wgpu::Queue) -> bool {
        if let Some(ref mut hex_editor) = self.hex_editor {
            hex_editor.redo(queue)
        } else {
            false
        }
    }

    /// Check if hex editor can undo
    pub fn can_undo_hex(&self) -> bool {
        self.hex_editor.as_ref().map(|h| h.can_undo()).unwrap_or(false)
    }

    /// Check if hex editor can redo
    pub fn can_redo_hex(&self) -> bool {
        self.hex_editor.as_ref().map(|h| h.can_redo()).unwrap_or(false)
    }

    /// Get a hex dump preview for display
    pub fn get_hex_dump(&self, start: usize, count: usize) -> Vec<String> {
        if let Some(ref hex_editor) = self.hex_editor {
            hex_editor.get_hex_dump(start, count)
        } else {
            Vec::new()
        }
    }

    /// Phase 40.2: Toggle Hex Search Mode
    pub fn toggle_hex_search_mode(&mut self) {
        if let Some(ref mut hex_editor) = self.hex_editor {
            hex_editor.toggle_search_mode();
        }
    }

    /// Phase 40.2: Find Next Match
    pub fn hex_find_next(&mut self) {
        if let Some(ref mut hex_editor) = self.hex_editor {
            hex_editor.find_next();
        }
    }

    /// Phase 40.2: Find Previous Match
    pub fn hex_find_prev(&mut self) {
         if let Some(ref mut hex_editor) = self.hex_editor {
            hex_editor.find_prev();
        }
    }

    /// Phase 40.3: Trigger Neural Consult
    pub fn trigger_neural_consult(&mut self) {
         if let Some(ref mut hex_editor) = self.hex_editor {
            // Note: In a real async environment, we'd spawn this.
            // For now, HexTensorEditor checks for an available runtime or queues the request.
            hex_editor.neural_consult();
        }
    }
}

// ============================================
// Phase 34: Persistent Storage Data Structures
// ============================================

/// Saved text data for persistence
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct SavedTextData {
    /// Format version
    pub version: u32,
    /// Unix timestamp of save
    pub timestamp: u64,
    /// Cursor position in grid
    pub cursor_pos: u32,
    /// Text length in characters
    pub text_length: u32,
    /// Snapshot of the buffer content (u32 per character)
    #[serde(skip_serializing_if = "Vec::is_empty")]
    pub buffer_snapshot: Vec<u32>,
}

/// Calculate tile filename from world coordinates
pub fn tile_filename(x: i32, y: i32) -> String {
    format!("tile_{}_{}.text.json", x, y)
}

/// Parse tile coordinates from filename
pub fn parse_tile_filename(name: &str) -> Option<(i32, i32)> {
    let name = name.strip_suffix(".text.json")?;
    let mut parts = name.split('_');
    if parts.next() != Some("tile") {
        return None;
    }
    let x: i32 = parts.next()?.parse().ok()?;
    let y: i32 = parts.next()?.parse().ok()?;
    Some((x, y))
}

// ============================================
// Phase Mode B.2: Spatial Auto-Save System
// ============================================

/// Spatial snapshot with camera position and view state
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct SpatialSnapshot {
    /// Format version
    pub version: u32,
    /// Unix timestamp of save
    pub timestamp: u64,
    /// Tile coordinates
    pub tile_x: i32,
    pub tile_y: i32,
    /// Camera position when saved
    pub camera_x: f32,
    pub camera_y: f32,
    pub camera_zoom: f32,
    /// Cursor position in grid
    pub cursor_pos: u32,
    /// Text length in characters
    pub text_length: u32,
    /// Snapshot of the buffer content (u32 per character)
    #[serde(skip_serializing_if = "Vec::is_empty")]
    pub buffer_snapshot: Vec<u32>,
    /// Current file path (if any)
    pub current_file: Option<String>,
}

/// Calculate spatial snapshot filename from world coordinates
pub fn spatial_snapshot_filename(x: i32, y: i32) -> String {
    format!("spatial_{}_{}.snapshot.json", x, y)
}

impl TextEngine {
    /// Create a spatial snapshot including camera position
    pub fn create_spatial_snapshot(&self, tile_x: i32, tile_y: i32, camera_x: f32, camera_y: f32, camera_zoom: f32) -> SpatialSnapshot {
        SpatialSnapshot {
            version: 2,
            timestamp: std::time::SystemTime::now()
                .duration_since(std::time::UNIX_EPOCH)
                .unwrap_or_default()
                .as_secs(),
            tile_x,
            tile_y,
            camera_x,
            camera_y,
            camera_zoom,
            cursor_pos: self.local_stats.cursor_pos,
            text_length: self.local_stats.length,
            buffer_snapshot: self.cpu_buffer.clone(),
            current_file: self.current_file.as_ref().map(|p| p.to_string_lossy().to_string()),
        }
    }

    /// Save spatial snapshot to disk
    pub fn save_spatial_snapshot(&self, snapshot: &SpatialSnapshot) -> Result<(), Box<dyn std::error::Error>> {
        let save_dir = std::path::PathBuf::from(".spatial_memory");
        std::fs::create_dir_all(&save_dir)?;

        let filename = spatial_snapshot_filename(snapshot.tile_x, snapshot.tile_y);
        let filepath = save_dir.join(&filename);

        let json = serde_json::to_string_pretty(snapshot)?;
        std::fs::write(&filepath, json)?;

        log::info!("💾 Spatial snapshot saved: {:?}", filepath);
        Ok(())
    }

    /// Load spatial snapshot and restore state
    pub fn load_spatial_snapshot(&mut self, queue: &wgpu::Queue, tile_x: i32, tile_y: i32) -> Result<SpatialSnapshot, Box<dyn std::error::Error>> {
        let save_dir = std::path::PathBuf::from(".spatial_memory");
        let filename = spatial_snapshot_filename(tile_x, tile_y);
        let filepath = save_dir.join(&filename);

        let json = std::fs::read_to_string(&filepath)?;
        let snapshot: SpatialSnapshot = serde_json::from_str(&json)?;

        // Restore buffer content
        if snapshot.buffer_snapshot.len() <= self.cpu_buffer.len() {
            self.cpu_buffer[..snapshot.buffer_snapshot.len()].copy_from_slice(&snapshot.buffer_snapshot);
            for i in snapshot.buffer_snapshot.len()..self.cpu_buffer.len() {
                self.cpu_buffer[i] = 0;
            }
        }

        // Restore cursor and stats
        self.local_stats.cursor_pos = snapshot.cursor_pos;
        self.local_stats.length = snapshot.text_length;
        self.local_stats.dirty = 1;

        // Restore current file
        self.current_file = snapshot.current_file.as_ref().map(|s| std::path::PathBuf::from(s.as_str()));

        // Upload to GPU
        queue.write_buffer(&self.text_buffer, 0, bytemuck::cast_slice(&self.cpu_buffer));
        queue.write_buffer(&self.stats_buffer, 0, bytemuck::cast_slice(&[self.local_stats]));

        log::info!("📂 Spatial snapshot loaded: tile ({}, {})", tile_x, tile_y);
        Ok(snapshot)
    }

    /// Check if spatial snapshot exists for given coordinates
    pub fn has_spatial_snapshot(tile_x: i32, tile_y: i32) -> bool {
        let save_dir = std::path::PathBuf::from(".spatial_memory");
        let filename = spatial_snapshot_filename(tile_x, tile_y);
        save_dir.join(&filename).exists()
    }

    // ============================================
    // Phase 41.3: Visual AST Integration
    // ============================================

    /// Initialize VisualAST from project directory
    pub fn init_visual_ast(&mut self, project_root: &std::path::Path, origin: (f32, f32)) -> Result<(), String> {
        match VisualAST::from_directory(project_root, origin) {
            Ok(ast) => {
                self.visual_ast = Some(ast);
                log::info!("✅ VisualAST initialized at ({}, {})", origin.0, origin.1);
                Ok(())
            }
            Err(e) => {
                log::error!("❌ Failed to initialize VisualAST: {:?}", e);
                Err(format!("{:?}", e))
            }
        }
    }

    /// Query syntax health at spatial coordinates
    pub fn get_syntax_health(&self, x: f32, y: f32) -> SyntaxHealth {
        if let Some(ref ast) = self.visual_ast {
            ast.get_syntax_health(x, y)
        } else {
            SyntaxHealth::default()
        }
    }

    /// Get visual node at coordinates for click handling
    pub fn node_at(&self, x: f32, y: f32) -> Option<String> {
        self.visual_ast.as_ref()
            .and_then(|ast| ast.node_at((x, y)))
            .map(|node| node.id.clone())
    }

    /// Update health of node at coordinates
    pub fn update_node_health(&mut self, x: f32, y: f32, health: SyntaxHealth) {
        if let Some(ref mut ast) = self.visual_ast {
            ast.update_node_health((x, y), health);
        }
    }

    /// Get all nodes with poor health (for Scout agent patrol)
    pub fn get_unhealthy_nodes(&self) -> Vec<(f32, f32, SyntaxHealth)> {
        if let Some(ref ast) = self.visual_ast {
            ast.get_unhealthy_nodes()
        } else {
            Vec::new()
        }
    }

    /// Get total number of nodes in AST
    pub fn ast_node_count(&self) -> usize {
        self.visual_ast.as_ref().map(|ast| ast.nodes.len()).unwrap_or(0)
    }
}

// ============================================
// Phase 36: Unit Tests
// ============================================

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_tile_filename_roundtrip() {
        // Test tile filename creation and parsing
        let filename = tile_filename(5, -3);
        assert_eq!(filename, "tile_5_-3.text.json");

        let parsed = parse_tile_filename(&filename);
        assert_eq!(parsed, Some((5, -3)));
    }

    #[test]
    fn test_parse_tile_filename_invalid() {
        // Test invalid filenames
        assert_eq!(parse_tile_filename("not_a_tile.json"), None);
        assert_eq!(parse_tile_filename("tile_5.text.json"), None);
        assert_eq!(parse_tile_filename("tile_abc_def.text.json"), None);
    }

    #[test]
    fn test_undo_history_depth_limit() {
        // Test that undo history respects max depth
        let mut history = UndoHistory {
            undo_stack: Vec::new(),
            redo_stack: Vec::new(),
            max_depth: 3, // Small depth for testing
        };

        // Push 5 commands
        for i in 0..5 {
            let cmd = EditCommand::Insert {
                pos: i,
                chars: vec![72], // 'H'
            };
            history.push_command(cmd);
        }

        // Should only have 3 (max_depth)
        assert_eq!(history.undo_stack.len(), 3);
        // Oldest commands were dropped
        assert_eq!(history.undo_stack[0].pos().unwrap(), 2);
        assert_eq!(history.undo_stack[1].pos().unwrap(), 3);
        assert_eq!(history.undo_stack[2].pos().unwrap(), 4);
    }

    #[test]
    fn test_undo_history_trim_redo_on_new_command() {
        // Test that redo stack is trimmed when new command is pushed
        let mut history = UndoHistory {
            undo_stack: vec![
                EditCommand::Insert { pos: 0, chars: vec![72] },
            ],
            redo_stack: vec![
                EditCommand::Delete { pos: 1, chars: vec![101] },
                EditCommand::Delete { pos: 2, chars: vec![108] },
            ],
            max_depth: 50,
        };

        // Push new command - should clear redo stack
        let cmd = EditCommand::Insert { pos: 1, chars: vec![105] };
        history.push_command(cmd);

        assert_eq!(history.undo_stack.len(), 2);
        assert_eq!(history.redo_stack.len(), 0);
    }

    #[test]
    fn test_edit_command_pos() {
        // Test pos() method on EditCommand
        let insert_cmd = EditCommand::Insert { pos: 10, chars: vec![65] };
        assert_eq!(insert_cmd.pos(), Some(10));

        let delete_cmd = EditCommand::Delete { pos: 20, chars: vec![66] };
        assert_eq!(delete_cmd.pos(), Some(20));

        let replace_cmd = EditCommand::Replace {
            start: 30,
            end: 40,
            old: vec![67],
            new: vec![68],
        };
        assert_eq!(replace_cmd.pos(), Some(30));
    }

    #[test]
    fn test_saved_text_data_serialization() {
        // Test JSON serialization of saved data
        let data = SavedTextData {
            version: 1,
            timestamp: 1737491234,
            cursor_pos: 42,
            text_length: 5,
            buffer_snapshot: vec![72, 101, 108, 108, 111], // "Hello"
        };

        let json = serde_json::to_string(&data).unwrap();
        assert!(json.contains("\"version\":1"));
        assert!(json.contains("\"cursor_pos\":42"));

        let deserialized: SavedTextData = serde_json::from_str(&json).unwrap();
        assert_eq!(deserialized.cursor_pos, 42);
        assert_eq!(deserialized.buffer_snapshot, vec![72, 101, 108, 108, 111]);
    }
}
