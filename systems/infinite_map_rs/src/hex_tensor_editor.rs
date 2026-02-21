use wgpu::util::DeviceExt;
use std::path::{Path, PathBuf};
use std::collections::HashMap;
use serde::{Serialize, Deserialize};
use bytemuck::{Pod, Zeroable};
use std::sync::{Arc, Mutex};

// Phase 40.3: Neural Link - Import Evolution Manager for AI consultation
use crate::evolution_manager::EvolutionManager;

#[repr(C)]
#[derive(Copy, Clone, Debug, Pod, Zeroable)]
pub struct HexEditorUniforms {
    pub cursor_byte_pos: u32,
    pub cursor_nibble: u32, // 0 = high, 1 = low
    pub rows_visible: u32,
    pub bytes_per_row: u32,
    pub scroll_offset: u32,
    pub padding: [u32; 3],
}

#[derive(Debug, Clone, Copy, PartialEq)]
pub enum EditorMode {
    Document, // Standard Unicode Text
    Tensor,   // Binary Hex Editor
    SearchInput, // Entering hex pattern to search
}

#[derive(Debug, Clone, Copy, PartialEq)]
pub enum HexNavDirection {
    Up,
    Down,
    Left,
    Right,
    Home,
    End,
}

// Phase 40.1: Undo/Redo for hex editing
#[derive(Debug, Clone)]
pub struct HexEditCommand {
    pub offset: usize,
    pub old_value: u8,
    pub new_value: u8,
}

#[derive(Debug, Clone)]
pub struct HexEditHistory {
    undo_stack: Vec<HexEditCommand>,
    redo_stack: Vec<HexEditCommand>,
    max_depth: usize,
}

impl HexEditHistory {
    pub fn new(max_depth: usize) -> Self {
        Self {
            undo_stack: Vec::with_capacity(max_depth),
            redo_stack: Vec::with_capacity(max_depth),
            max_depth,
        }
    }

    pub fn push_edit(&mut self, cmd: HexEditCommand) {
        // Clear redo stack on new edit
        self.redo_stack.clear();
        
        // Maintain max depth
        if self.undo_stack.len() >= self.max_depth {
            self.undo_stack.remove(0);
        }
        self.undo_stack.push(cmd);
    }

    pub fn can_undo(&self) -> bool {
        !self.undo_stack.is_empty()
    }

    pub fn can_redo(&self) -> bool {
        !self.redo_stack.is_empty()
    }

    pub fn pop_undo(&mut self) -> Option<HexEditCommand> {
        if let Some(cmd) = self.undo_stack.pop() {
            self.redo_stack.push(cmd.clone());
            Some(cmd)
        } else {
            None
        }
    }

    pub fn pop_redo(&mut self) -> Option<HexEditCommand> {
        if let Some(cmd) = self.redo_stack.pop() {
            self.undo_stack.push(cmd.clone());
            Some(cmd)
        } else {
            None
        }
    }

    pub fn clear(&mut self) {
        self.undo_stack.clear();
        self.redo_stack.clear();
    }
}

#[derive(Debug, Clone)]
pub struct SubstrateInfo {
    pub size: usize,
    pub entropy: f32,
}

pub struct HexTensorEditor {
    pub substrate_buffer: wgpu::Buffer, // Holds raw binary data
    pub annotation_buffer: wgpu::Buffer, // Phase 40.3: Holds metadata/colors per byte
    pub uniform_buffer: wgpu::Buffer,
    pub bind_group: wgpu::BindGroup,
    pub pipeline: wgpu::ComputePipeline,

    // CPU State
    pub mode: EditorMode,
    pub current_path: Option<PathBuf>,
    pub cursor_byte_pos: u32,
    pub cursor_nibble: u32,
    pub scroll_offset: u32,
    pub bytes_per_row: u32,
    pub data_cache: Vec<u8>,
    pub meta_cache: Vec<u32>, // Parallel to data_cache, holds annotation flags
    pub dirty: bool,
    pub substrate_info: SubstrateInfo,
    // Phase 40.1: Edit history for undo/redo
    pub edit_history: HexEditHistory,

    // Phase 40.2: Pattern Search
    pub search_query: Vec<u8>,
    pub search_results: Vec<usize>,
    pub current_search_match_index: usize,

    // Phase 40.3: Neural Link - The "Forebrain" connection
    pub evolution_manager: Option<Arc<Mutex<EvolutionManager>>>,
    pub neural_analysis_cache: HashMap<usize, NeuralAnnotation>,
}

/// Neural annotation from Z.ai analysis
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct NeuralAnnotation {
    pub offset: usize,
    pub length: usize,
    pub interpretation: String,
    pub confidence: f32,
    pub suggested_patch: Option<Vec<u8>>,
    pub timestamp: u64,
}

impl HexTensorEditor {
    pub fn new(device: &wgpu::Device) -> Self {
        log::info!("Initializing Hex Tensor Editor...");
        
        let substrate_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Hex Tensor Substrate"),
            size: 4 * 1024 * 1024, 
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });
        
        // Phase 40.3: Annotation Buffer
        let annotation_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Hex Annotation Map"),
            size: 4 * 1024 * 1024 * 4, // u32 per byte
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let uniform_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Hex Editor Uniforms"),
            size: std::mem::size_of::<HexEditorUniforms>() as u64,
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Hex Expansion Shader"),
            source: wgpu::ShaderSource::Wgsl(include_str!("shaders/hex_expansion.wgsl").into()),
        });

        let bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Hex Tensor Bind Layout"),
            entries: &[
                wgpu::BindGroupLayoutEntry { binding: 0, visibility: wgpu::ShaderStages::COMPUTE, ty: wgpu::BindingType::Buffer { ty: wgpu::BufferBindingType::Uniform, has_dynamic_offset: false, min_binding_size: None }, count: None },
                wgpu::BindGroupLayoutEntry { binding: 1, visibility: wgpu::ShaderStages::COMPUTE, ty: wgpu::BindingType::Buffer { ty: wgpu::BufferBindingType::Storage { read_only: true }, has_dynamic_offset: false, min_binding_size: None }, count: None },
                wgpu::BindGroupLayoutEntry { binding: 2, visibility: wgpu::ShaderStages::COMPUTE, ty: wgpu::BindingType::Buffer { ty: wgpu::BufferBindingType::Storage { read_only: false }, has_dynamic_offset: false, min_binding_size: None }, count: None },
                wgpu::BindGroupLayoutEntry { binding: 3, visibility: wgpu::ShaderStages::COMPUTE, ty: wgpu::BindingType::Buffer { ty: wgpu::BufferBindingType::Storage { read_only: false }, has_dynamic_offset: false, min_binding_size: None }, count: None },
                wgpu::BindGroupLayoutEntry { binding: 4, visibility: wgpu::ShaderStages::COMPUTE, ty: wgpu::BindingType::Buffer { ty: wgpu::BufferBindingType::Storage { read_only: true }, has_dynamic_offset: false, min_binding_size: None }, count: None }, // Annotation Map
            ],
        });

        let pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Hex Editor Pipeline Layout"),
            bind_group_layouts: &[&bind_group_layout],
            push_constant_ranges: &[],
        });

        let pipeline = device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("Hex Expansion Pipeline"),
            layout: Some(&pipeline_layout),
            module: &shader,
            entry_point: "expand_hex",
        });

        let dummy_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Dummy"),
            size: 1024,
            usage: wgpu::BufferUsages::STORAGE,
            mapped_at_creation: false,
        });

        let bind_group = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Placeholder Hex BindGroup"),
            layout: &bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry { binding: 0, resource: uniform_buffer.as_entire_binding() },
                wgpu::BindGroupEntry { binding: 1, resource: substrate_buffer.as_entire_binding() },
                wgpu::BindGroupEntry { binding: 2, resource: dummy_buffer.as_entire_binding() },
                wgpu::BindGroupEntry { binding: 3, resource: dummy_buffer.as_entire_binding() },
                wgpu::BindGroupEntry { binding: 4, resource: annotation_buffer.as_entire_binding() },
            ],
        });

        Self {
            substrate_buffer,
            annotation_buffer,
            uniform_buffer,
            bind_group,
            pipeline,
            mode: EditorMode::Document,
            current_path: None,
            cursor_byte_pos: 0,
            cursor_nibble: 0,
            scroll_offset: 0,
            bytes_per_row: 16,
            data_cache: Vec::new(),
            meta_cache: Vec::new(),
            dirty: false,
            substrate_info: SubstrateInfo { size: 0, entropy: 0.0 },
            edit_history: HexEditHistory::new(1000), // 1000 edit history depth
            search_query: Vec::new(),
            search_results: Vec::new(),
            current_search_match_index: 0,
            evolution_manager: None,
            neural_analysis_cache: HashMap::new(),
        }
    }

    pub fn load_substrate(&mut self, queue: &wgpu::Queue, path: &Path) -> Result<(), Box<dyn std::error::Error>> {
        let data = std::fs::read(path)?;
        self.data_cache = data;
        // Pad to 4 bytes
        while self.data_cache.len() % 4 != 0 {
            self.data_cache.push(0);
        }
        
        // Initialize meta cache
        self.meta_cache = vec![0u32; self.data_cache.len()];
        
        queue.write_buffer(&self.substrate_buffer, 0, bytemuck::cast_slice(&self.data_cache));
        self.current_path = Some(path.to_path_buf());
        self.cursor_byte_pos = 0;
        self.cursor_nibble = 0;
        self.mode = EditorMode::Tensor;
        self.dirty = true;
        self.substrate_info.size = self.data_cache.len();
        
        log::info!("⚡ Hex Tensor Editor: Loaded {} bytes from {:?}", self.data_cache.len(), path);
        Ok(())
    }

    pub fn set_mode(&mut self, mode: EditorMode, queue: &wgpu::Queue) {
        self.mode = mode;
        // Optionally clear buffers or reset state
    }

    pub fn update_hex_at_cursor(&mut self, queue: &wgpu::Queue, ch: char) -> bool {
        let nibble = if ch >= '0' && ch <= '9' {
            ch as u8 - b'0'
        } else if ch >= 'A' && ch <= 'F' {
            ch as u8 - b'A' + 10
        } else if ch >= 'a' && ch <= 'f' {
            ch as u8 - b'a' + 10
        } else {
            return false;
        };

        if self.cursor_byte_pos as usize >= self.data_cache.len() {
            return false;
        }

        let current_byte = self.data_cache[self.cursor_byte_pos as usize];
        let new_byte = if self.cursor_nibble == 0 {
            // Set high nibble
            (nibble << 4) | (current_byte & 0x0F)
        } else {
            // Set low nibble
            (current_byte & 0xF0) | nibble
        };

        self.data_cache[self.cursor_byte_pos as usize] = new_byte;
        
        // Phase 40.1: Record edit in history (only when full byte is complete)
        if self.cursor_nibble == 1 {
            self.edit_history.push_edit(HexEditCommand {
                offset: self.cursor_byte_pos as usize,
                old_value: current_byte,
                new_value: new_byte,
            });
        }
        
        // Auto-advance
        if self.cursor_nibble == 0 {
            self.cursor_nibble = 1;
        } else {
            self.cursor_nibble = 0;
            if self.cursor_byte_pos < self.data_cache.len() as u32 - 1 {
                self.cursor_byte_pos += 1;
            }
        }
        
        self.dirty = true;
        true
    }

    pub fn navigate_hex(&mut self, queue: &wgpu::Queue, direction: HexNavDirection) {
        let max_pos = self.data_cache.len() as i32 - 1;
        let mut pos = self.cursor_byte_pos as i32;
        
        match direction {
            HexNavDirection::Up => pos -= self.bytes_per_row as i32,
            HexNavDirection::Down => pos += self.bytes_per_row as i32,
            HexNavDirection::Left => pos -= 1,
            HexNavDirection::Right => pos += 1,
            HexNavDirection::Home => pos = 0,
            HexNavDirection::End => pos = max_pos,
        }
        
        self.cursor_byte_pos = pos.clamp(0, max_pos) as u32;
        self.dirty = true;
    }

    /// Save substrate to file
    ///
    /// If the target path ends with `.rts.png`, saves in PNG format with metadata.
    /// Otherwise, saves as raw binary.
    ///
    /// Phase 44: Self-Hosting Write-Back - enables editing the substrate itself
    pub fn save_substrate(&self, path: Option<&Path>) -> Result<(), Box<dyn std::error::Error>> {
        let target = path.or(self.current_path.as_deref());
        if let Some(p) = target {
            let path_str = p.to_string_lossy();
            
            // Check if this is a .rts.png file (self-hosting substrate format)
            if path_str.ends_with(".rts.png") || path_str.ends_with(".png") {
                // Save as PNG format using V2Brick
                use crate::memory_tensor::V2Brick;
                
                // Calculate dimensions for the PNG (square, power of 2)
                let data_len = self.data_cache.len();
                let pixels_needed = (data_len + 3) / 4; // 4 bytes per RGBA pixel
                let grid_size = ((pixels_needed as f64).sqrt().ceil() as u32)
                    .next_power_of_two()
                    .max(64); // Minimum 64x64
                
                // Create texture data (RGBA)
                let total_pixels = (grid_size * grid_size) as usize;
                let mut texture_data = vec![0u8; total_pixels * 4];
                
                // Copy data into texture (simple linear mapping for now)
                // In the full Hilbert curve implementation, we'd map 1D -> 2D via Hilbert curve
                for (i, byte) in self.data_cache.iter().enumerate() {
                    if i < total_pixels {
                        // Store in blue channel (matching pixelrts_converter.py encoding)
                        texture_data[i * 4 + 2] = *byte;
                        // Set alpha to full (not metadata)
                        texture_data[i * 4 + 3] = 255;
                    }
                }
                
                // Create V2Brick with the data
                let brick = V2Brick {
                    header: crate::memory_tensor::V2BrickHeader::new(
                        grid_size,
                        grid_size,
                        0,
                        data_len as u64,
                        data_len as u64,
                        0.0,
                        [0; 48],
                        0,
                    ),
                    texture_data,
                    source_code: None, // Could embed source code here as Hybrid DNA
                };
                
                // Save as PNG
                brick.save_to_png(p)?;
                log::info!("💾 Saved substrate to {:?} (PNG format, {}x{})", p, grid_size, grid_size);
            } else {
                // Save as raw binary
                std::fs::write(p, &self.data_cache)?;
                log::info!("💾 Saved substrate to {:?} (raw binary)", p);
            }
            Ok(())
        } else {
            Err("No path specified for save".into())
        }
    }

    // Phase 40.1: Undo/Redo methods
    pub fn undo(&mut self, queue: &wgpu::Queue) -> bool {
        if let Some(cmd) = self.edit_history.pop_undo() {
            // Restore old value
            self.data_cache[cmd.offset] = cmd.old_value;
            // Move cursor to edited location
            self.cursor_byte_pos = cmd.offset as u32;
            self.cursor_nibble = 0;
            self.dirty = true;
            log::info!("↩️ Undo: restored byte at 0x{:04X} to 0x{:02X}", cmd.offset, cmd.old_value);
            true
        } else {
            false
        }
    }

    pub fn redo(&mut self, queue: &wgpu::Queue) -> bool {
        if let Some(cmd) = self.edit_history.pop_redo() {
            // Re-apply new value
            self.data_cache[cmd.offset] = cmd.new_value;
            // Move cursor to edited location
            self.cursor_byte_pos = cmd.offset as u32;
            self.cursor_nibble = 1; // After completing a byte
            self.dirty = true;
            log::info!("↪️ Redo: reapplied byte at 0x{:04X} to 0x{:02X}", cmd.offset, cmd.new_value);
            true
        } else {
            false
        }
    }

    pub fn can_undo(&self) -> bool {
        self.edit_history.can_undo()
    }

    pub fn can_redo(&self) -> bool {
        self.edit_history.can_redo()
    }

    pub fn get_hex_dump(&self, start: usize, count: usize) -> Vec<String> {
        // Return string representation for UI/Debug
        Vec::new() // Not strictly needed for GPU render, implies CPU-side UI visualization
    }

    pub fn sync_gpu(&mut self, queue: &wgpu::Queue) {
        if self.dirty {
            // Optimization: Only upload if data actually changed, not just cursor. 
            // Since we don't track what changed, assume data changed if dirty.
            // But if only cursor moved, we should iterate.
            // For now, full upload is safe but slow.
            queue.write_buffer(&self.substrate_buffer, 0, bytemuck::cast_slice(&self.data_cache));
            
            // Phase 40.3: Update Meta Cache from Neural Link
            if !self.neural_analysis_cache.is_empty() {
                // Clear meta
                for x in self.meta_cache.iter_mut() { *x = 0; }
                
                // Populate from annotations
                for (_, annotation) in &self.neural_analysis_cache {
                    let end = (annotation.offset + annotation.length).min(self.meta_cache.len());
                    for i in annotation.offset..end {
                        // Tag 1: Neural Insight (Gold color in shader)
                        self.meta_cache[i] = 1; 
                    }
                    // Tag suggested patch vs valid code?
                    if annotation.suggested_patch.is_some() {
                         for i in annotation.offset..end {
                            self.meta_cache[i] = 2; // Patch Pending (Red/Warning)
                        }
                    }
                }
                queue.write_buffer(&self.annotation_buffer, 0, bytemuck::cast_slice(&self.meta_cache));
            }

            let uniforms = HexEditorUniforms {
                cursor_byte_pos: self.cursor_byte_pos,
                cursor_nibble: self.cursor_nibble,
                rows_visible: 40,
                bytes_per_row: self.bytes_per_row,
                scroll_offset: self.scroll_offset,
                padding: [0; 3],
            };
            queue.write_buffer(&self.uniform_buffer, 0, bytemuck::cast_slice(&[uniforms]));
            
            self.dirty = false;
        }
    }

    pub fn rebuild_bind_group(&mut self, device: &wgpu::Device, text_buffer: &wgpu::Buffer, dummy_color_buffer: &wgpu::Buffer) {
        let layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Hex Tensor Bind Layout"),
            entries: &[
                wgpu::BindGroupLayoutEntry { binding: 0, visibility: wgpu::ShaderStages::COMPUTE, ty: wgpu::BindingType::Buffer { ty: wgpu::BufferBindingType::Uniform, has_dynamic_offset: false, min_binding_size: None }, count: None },
                wgpu::BindGroupLayoutEntry { binding: 1, visibility: wgpu::ShaderStages::COMPUTE, ty: wgpu::BindingType::Buffer { ty: wgpu::BufferBindingType::Storage { read_only: true }, has_dynamic_offset: false, min_binding_size: None }, count: None },
                wgpu::BindGroupLayoutEntry { binding: 2, visibility: wgpu::ShaderStages::COMPUTE, ty: wgpu::BindingType::Buffer { ty: wgpu::BufferBindingType::Storage { read_only: false }, has_dynamic_offset: false, min_binding_size: None }, count: None },
                wgpu::BindGroupLayoutEntry { binding: 3, visibility: wgpu::ShaderStages::COMPUTE, ty: wgpu::BindingType::Buffer { ty: wgpu::BufferBindingType::Storage { read_only: false }, has_dynamic_offset: false, min_binding_size: None }, count: None },
                wgpu::BindGroupLayoutEntry { binding: 4, visibility: wgpu::ShaderStages::COMPUTE, ty: wgpu::BindingType::Buffer { ty: wgpu::BufferBindingType::Storage { read_only: true }, has_dynamic_offset: false, min_binding_size: None }, count: None },
            ],
        });

        self.bind_group = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Active Hex BindGroup"),
            layout: &layout,
            entries: &[
                wgpu::BindGroupEntry { binding: 0, resource: self.uniform_buffer.as_entire_binding() },
                wgpu::BindGroupEntry { binding: 1, resource: self.substrate_buffer.as_entire_binding() },
                wgpu::BindGroupEntry { binding: 2, resource: text_buffer.as_entire_binding() },
                wgpu::BindGroupEntry { binding: 3, resource: dummy_color_buffer.as_entire_binding() },
                wgpu::BindGroupEntry { binding: 4, resource: self.annotation_buffer.as_entire_binding() },
            ],
        });
    }

    pub fn dispatch(&self, encoder: &mut wgpu::CommandEncoder) {
        // if self.mode != EditorMode::Tensor { return; } // Checked by caller
        
        let mut cpass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
            label: Some("Hex Expansion Pass"),
            timestamp_writes: None,
        });
        
        cpass.set_pipeline(&self.pipeline);
        cpass.set_bind_group(0, &self.bind_group, &[]);
        cpass.dispatch_workgroups(40, 1, 1); 
    }

    // Phase 40.2: Search Implementation
    pub fn toggle_search_mode(&mut self) {
        if self.mode == EditorMode::Tensor {
            self.mode = EditorMode::SearchInput;
            self.search_query.clear();
            self.search_results.clear();
            self.cursor_nibble = 0; // Reset nibble for query typing
            log::info!("🔍 Search Mode: Type hex pattern, Enter to find, Esc to cancel");
        } else if self.mode == EditorMode::SearchInput {
            self.mode = EditorMode::Tensor;
            log::info!("🔍 Search Cancelled");
        }
    }

    pub fn handle_search_input(&mut self, ch: char) -> bool {
        if self.mode != EditorMode::SearchInput {
            return false;
        }

        let nibble = if ch >= '0' && ch <= '9' {
            ch as u8 - b'0'
        } else if ch >= 'A' && ch <= 'F' {
            ch as u8 - b'A' + 10
        } else if ch >= 'a' && ch <= 'f' {
            ch as u8 - b'a' + 10
        } else {
            return false;
        };

        // If query is empty or last byte is full, start new byte
        if self.search_query.is_empty() {
             self.search_query.push(nibble << 4); // High nibble
        } else {
            let last_idx = self.search_query.len() - 1;
            // Check if we are filling the low nibble of the last byte
            // This is tricky because we don't track nibble state for search query in the struct,
            // we assumed full bytes for search. But typing is nibble-by-nibble.
            // Let's assume we maintain a "partial byte" logic.
            // Simplification: just store nibbles temporarily?
            // Better: use the same logic as editor, but we need to know if we are on high or low nibble.
            // Let's assume input always comes in pairs? No, that's bad UX.
            // Let's treat the last byte as "pending" if we have a separate flag or checking parity?
            // Actually, we can just push nibbles into a separate "nibble buffer" or just assume high/low based on count.
            // Implementation detail: Let's assume even length = start new byte (high nibble), odd length = fill last byte (low nibble).
            // But wait, Vec<u8> stores bytes.
            // We need a helper state: `search_nibble_pending`.
            // Since we didn't add it to struct, let's use a workaround:
            // We'll interpret the search_query vector as being "in progress".
            // If we assume the user types correctly, we can just push.
            // Note: `handle_search_input` is called per char.
            
            // Hack for now: We won't support editing the search query backspace yet. 
            // Just appending.
            // We'll use a heuristic: if we just started, we are at nibble 0.
            // We need to track `cursor_nibble` equivalent for search.
            // Let's use `self.cursor_nibble` for search query construction too since it's unused in SearchInput mode!
            
            if self.cursor_nibble == 0 {
                self.search_query.push(nibble << 4);
                self.cursor_nibble = 1;
            } else {
                let last = self.search_query.len() - 1;
                self.search_query[last] |= nibble;
                self.cursor_nibble = 0;
            }
        }
        
        log::info!("🔍 Query: {:02X?}", self.search_query);
        true
    }

    pub fn execute_search(&mut self) -> bool {
        if self.search_query.is_empty() {
            return false;
        }

        self.search_results.clear();
        
        // Simple naive search
        // Optimization for large files: Boyer-Moore or KMP, but for 11MB naive is probably fine for <100ms
        let needle = &self.search_query;
        let haystack = &self.data_cache;
        
        for i in 0..=haystack.len().saturating_sub(needle.len()) {
            if &haystack[i..i+needle.len()] == needle.as_slice() {
                self.search_results.push(i);
            }
        }

        log::info!("🔍 Found {} matches", self.search_results.len());
        
        if !self.search_results.is_empty() {
            self.current_search_match_index = 0;
            self.jump_to_match(0);
            self.mode = EditorMode::Tensor; // Exit search mode on success
            return true;
        }
        
        false
    }
    
    pub fn find_next(&mut self) {
        if self.search_results.is_empty() { return; }
        
        self.current_search_match_index = (self.current_search_match_index + 1) % self.search_results.len();
        self.jump_to_match(self.current_search_match_index);
    }
    
    pub fn find_prev(&mut self) {
        if self.search_results.is_empty() { return; }
        
        if self.current_search_match_index == 0 {
            self.current_search_match_index = self.search_results.len() - 1;
        } else {
            self.current_search_match_index -= 1;
        }
        self.jump_to_match(self.current_search_match_index);
    }
    
    fn jump_to_match(&mut self, index: usize) {
        if index < self.search_results.len() {
            self.cursor_byte_pos = self.search_results[index] as u32;
            self.cursor_nibble = 0;
            self.dirty = true;
            log::info!("🔍 Jumped to match {}/{} at 0x{:04X}", index + 1, self.search_results.len(), self.cursor_byte_pos);
        }
    }

    // ============================================================
    // Phase 40.3: Neural Link - "The Forebrain" Integration
    // ============================================================

    /// Connect the Evolution Manager for AI consultation
    pub fn connect_neural_link(&mut self, manager: Arc<Mutex<EvolutionManager>>) {
        self.evolution_manager = Some(manager);
        log::info!("🧠 HexTensorEditor: Neural link established");
    }

    /// Check if neural link is active
    pub fn has_neural_link(&self) -> bool {
        self.evolution_manager.is_some()
    }

    /// Get context bytes around cursor for AI analysis
    pub fn get_context_bytes(&self, window_size: usize) -> Vec<u8> {
        let cursor = self.cursor_byte_pos as usize;
        let start = cursor.saturating_sub(window_size / 2);
        let end = (cursor + window_size / 2).min(self.data_cache.len());
        self.data_cache[start..end].to_vec()
    }

    /// Get hex dump of context for prompt construction
    pub fn get_context_hex_dump(&self, window_size: usize) -> String {
        let bytes = self.get_context_bytes(window_size);
        let cursor = self.cursor_byte_pos as usize;
        let window_start = cursor.saturating_sub(window_size / 2);

        let mut output = String::new();
        let bytes_per_row = 16;

        for (i, chunk) in bytes.chunks(bytes_per_row).enumerate() {
            let offset = window_start + i * bytes_per_row;
            output.push_str(&format!("{:08x}: ", offset));

            // Hex values
            for (j, byte) in chunk.iter().enumerate() {
                if offset + j == cursor {
                    output.push_str(&format!("\x1b[7m{:02x}\x1b[0m ", byte)); // Highlight cursor
                } else {
                    output.push_str(&format!("{:02x} ", byte));
                }
            }

            // Padding for incomplete rows
            for j in chunk.len()..bytes_per_row {
                output.push_str("   ");
            }

            output.push_str(" |");

            // ASCII representation
            for byte in chunk {
                if byte.is_ascii_graphic() || *byte == b' ' {
                    output.push(*byte as char);
                } else {
                    output.push('.');
                }
            }

            output.push_str("|\n");
        }

        output
    }

    /// Neural Consult: Ask Z.ai to interpret current bytes
    pub fn neural_consult(&mut self) -> Option<String> {
        if let Some(manager_arc) = &self.evolution_manager {
            let context = self.get_context_hex_dump(256);

            log::info!("🧠 Neural Consult: Requesting analysis for 256 bytes at 0x{:04X}", self.cursor_byte_pos);

            // Build analysis prompt
            let prompt = format!(
                "You are analyzing binary data in a hex editor. The cursor is at offset 0x{:04X}.\n\
                 Context (hex dump with cursor highlighted):\n\
                 {}\n\
                 File: {:?}\n\
                 Size: {} bytes\n\n\
                 Please provide:\n\
                 1. What type of data this appears to be (machine code, structured data, text, etc.)\n\
                 2. If machine code, disassemble the instruction at cursor\n\
                 3. Any patterns or structures you recognize\n\
                 4. Potential safety concerns or interesting observations\n\
                 5. Keep analysis concise (under 200 words)",
                self.cursor_byte_pos,
                context,
                self.current_path,
                self.data_cache.len()
            );

            // Note: In a full implementation, this would send to Z.ai via EvolutionManager
            // For now, we cache the context for later retrieval
            log::debug!("🧠 Neural Consult prompt prepared: {} bytes", prompt.len());

            Some(prompt)
        } else {
            log::warn!("🧠 Neural Consult: No neural link established");
            None
        }
    }

    /// Cache a neural annotation from Z.ai analysis
    pub fn cache_neural_annotation(&mut self, offset: usize, annotation: NeuralAnnotation) {
        self.neural_analysis_cache.insert(offset, annotation);
        log::info!("🧠 Cached neural annotation for offset 0x{:04X}", offset);
    }

    /// Get cached neural annotation for an offset
    pub fn get_neural_annotation(&self, offset: usize) -> Option<&NeuralAnnotation> {
        // Look for exact match or nearest annotation
        if let Some(ann) = self.neural_analysis_cache.get(&offset) {
            return Some(ann);
        }

        // Find nearest annotation within 16 bytes
        let mut nearest: Option<(&usize, &NeuralAnnotation)> = None;
        for (key, ann) in &self.neural_analysis_cache {
            if offset >= *key && offset < key + ann.length {
                return Some(ann);
            }
            let dist = (*key as isize - offset as isize).abs();
            if dist <= 16 {
                if nearest.is_none() || dist < (*nearest.unwrap().0 as isize - offset as isize).abs() {
                    nearest = Some((key, ann));
                }
            }
        }

        nearest.map(|(_, ann)| ann)
    }

    /// Get all neural annotations in a range
    pub fn get_annotations_in_range(&self, start: usize, end: usize) -> Vec<&NeuralAnnotation> {
        self.neural_analysis_cache
            .values()
            .filter(|ann| {
                (ann.offset >= start && ann.offset < end)
                    || (ann.offset < end && ann.offset + ann.length > start)
            })
            .collect()
    }

    /// Clear neural annotation cache
    pub fn clear_neural_cache(&mut self) {
        self.neural_analysis_cache.clear();
        log::info!("🧠 Cleared neural annotation cache");
    }

    /// Get neural cache size
    pub fn neural_cache_size(&self) -> usize {
        self.neural_analysis_cache.len()
    }

    // ============================================================
    // Phase 40.4: ACE Auto-Patcher Interface
    // ============================================================

    /// Apply a suggested patch from neural analysis
    pub fn apply_neural_patch(&mut self, queue: &wgpu::Queue, offset: usize, patch: &[u8]) -> Result<(), String> {
        if offset + patch.len() > self.data_cache.len() {
            return Err(format!("Patch exceeds file bounds: 0x{:04X} + {} > {}", offset, patch.len(), self.data_cache.len()));
        }

        for (i, byte) in patch.iter().enumerate() {
            let old_value = self.data_cache[offset + i];
            self.data_cache[offset + i] = *byte;

            // Record in edit history
            self.edit_history.push_edit(HexEditCommand {
                offset: offset + i,
                old_value,
                new_value: *byte,
            });
        }

        self.dirty = true;
        log::info!("🔧 Applied neural patch at 0x{:04X}: {} bytes modified", offset, patch.len());
        Ok(())
    }

    /// Validate current bytes against neural suggestion
    pub fn validate_with_neural(&self, expected: &[u8]) -> bool {
        let cursor = self.cursor_byte_pos as usize;
        if cursor + expected.len() > self.data_cache.len() {
            return false;
        }

        &self.data_cache[cursor..cursor + expected.len()] == expected
    }
}

