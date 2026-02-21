// src/memory_inspector.rs
// Memory Inspector
// Interactive memory inspection in the 3D world
//
// This module provides interactive memory inspection capabilities, allowing users
// to click on memory textures, view hex dumps, and explore memory regions.

use std::collections::HashMap;
use std::cell::RefCell;
use crate::memory_texture::{MemoryRegion, MemoryTextureMapper};
use crate::hilbert_memory::HilbertMemoryMapper;

/// Inspection mode for memory visualization
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum InspectionMode {
    /// Show allocation patterns (allocated vs free)
    Allocation,
    /// Show data content (heatmap based on byte values)
    Content,
    /// Show access frequency (requires instrumentation)
    Access,
}

impl Default for InspectionMode {
    fn default() -> Self {
        InspectionMode::Allocation
    }
}

/// Memory inspector state
pub struct MemoryInspector {
    heap_artifact_id: Option<String>,
    stack_artifact_id: Option<String>,
    code_artifact_id: Option<String>,
    data_artifact_id: Option<String>,

    selected_address: Option<usize>,
    selected_region: Option<String>,
    inspection_mode: InspectionMode,

    hilbert_mapper: HilbertMemoryMapper,
    memory_mapper: Option<MemoryTextureMapper>,

    // UI state
    show_hex_dump: bool,
    hex_dump_address: Option<usize>,
    hex_dump_size: usize,
    hex_dump_data: Option<Vec<u8>>,

    // Selection state
    selection_start: Option<(f32, f32)>,
    selection_end: Option<(f32, f32)>,

    // Region cache
    region_cache: RefCell<HashMap<String, MemoryRegion>>,
}

impl MemoryInspector {
    /// Create a new memory inspector
    pub fn new() -> Self {
        Self {
            heap_artifact_id: None,
            stack_artifact_id: None,
            code_artifact_id: None,
            data_artifact_id: None,

            selected_address: None,
            selected_region: None,
            inspection_mode: InspectionMode::default(),

            hilbert_mapper: HilbertMemoryMapper::new(8), // 256x256 texture
            memory_mapper: None,

            show_hex_dump: false,
            hex_dump_address: None,
            hex_dump_size: 256, // Show 256 bytes by default
            hex_dump_data: None,

            selection_start: None,
            selection_end: None,

            region_cache: RefCell::new(HashMap::new()),
        }
    }

    /// Initialize with memory texture mapper
    ///
    /// # Arguments
    /// * `memory_mapper` - Memory texture mapper to use
    pub fn initialize(&mut self, memory_mapper: MemoryTextureMapper) {
        self.memory_mapper = Some(memory_mapper);
    }

    /// Create 3D artifacts for memory regions
    ///
    /// # Arguments
    /// * `world` - World to create artifacts in (placeholder)
    pub fn create_memory_artifacts(&mut self, world: &mut ()) {
        // This would integrate with the artifact system
        // For now, we'll create placeholder IDs

        if let Some(ref mapper) = self.memory_mapper {
            if mapper.get_heap_texture_view().is_some() {
                self.heap_artifact_id = Some("heap_memory_artifact".to_string());
            }

            if mapper.get_stack_texture_view().is_some() {
                self.stack_artifact_id = Some("stack_memory_artifact".to_string());
            }

            if mapper.get_code_texture_view().is_some() {
                self.code_artifact_id = Some("code_memory_artifact".to_string());
            }

            if mapper.get_data_texture_view().is_some() {
                self.data_artifact_id = Some("data_memory_artifact".to_string());
            }
        }
    }

    /// Handle user clicking on memory texture
    ///
    /// # Arguments
    /// * `uv` - UV coordinates of the click (in [0, 1])
    /// * `region` - Name of the memory region
    pub fn on_memory_click(&mut self, uv: (f32, f32), region: &str) {
        self.selected_region = Some(region.to_string());

        if let Some(ref mapper) = self.memory_mapper {
            // Get region info
            if let Some(region_info) = self.get_region_info(region) {
                // Convert UV to address
                let addr = self.hilbert_mapper.uv_to_address(
                    uv.0,
                    uv.1,
                    region_info.start_addr,
                    4096, // page size
                );

                self.selected_address = Some(addr);
                self.hex_dump_address = Some(addr);
                self.show_hex_dump = true;

                // Read memory for hex dump
                if let Ok(data) = mapper.read_memory(addr, self.hex_dump_size) {
                    self.hex_dump_data = Some(data);
                }
            }
        }
    }

    /// Handle user dragging on memory texture (for selection)
    ///
    /// # Arguments
    /// * `uv` - UV coordinates of the drag point (in [0, 1])
    pub fn on_memory_drag(&mut self, uv: (f32, f32)) {
        if self.selection_start.is_none() {
            self.selection_start = Some(uv);
        }
        self.selection_end = Some(uv);
    }

    /// End selection
    pub fn end_selection(&mut self) {
        if let (Some(start), Some(end)) = (self.selection_start, self.selection_end) {
            // Calculate selected address range
            if let Some(ref mapper) = self.memory_mapper {
                if let Some(region_name) = &self.selected_region {
                    if let Some(region_info) = self.get_region_info(region_name) {
                        let start_addr = self.hilbert_mapper.uv_to_address(
                            start.0,
                            start.1,
                            region_info.start_addr,
                            4096,
                        );
                        let end_addr = self.hilbert_mapper.uv_to_address(
                            end.0,
                            end.1,
                            region_info.start_addr,
                            4096,
                        );

                        // Update hex dump to show selected range
                        let range_size = (end_addr - start_addr).min(self.hex_dump_size);
                        self.hex_dump_address = Some(start_addr);
                        self.hex_dump_size = range_size;

                        if let Ok(data) = mapper.read_memory(start_addr, range_size) {
                            self.hex_dump_data = Some(data);
                        }
                    }
                }
            }
        }

        self.selection_start = None;
        self.selection_end = None;
    }

    /// Get memory region info by name
    ///
    /// # Arguments
    /// * `name` - Name of the memory region
    ///
    /// # Returns
    /// Option containing memory region info, or None if not found
    fn get_region_info(&self, name: &str) -> Option<MemoryRegion> {
        // Check cache first
        if let Some(region) = self.region_cache.borrow().get(name) {
            return Some(region.clone());
        }

        // Query memory mapper
        if let Some(ref mapper) = self.memory_mapper {
            // This is a simplified implementation
            // In practice, you'd query the mapper for all regions
            match name {
                "heap" => {
                    if let Some(ref region) = mapper.heap_region {
                        let region = region.clone();
                        self.region_cache.borrow_mut().insert(name.to_string(), region.clone());
                        return Some(region);
                    }
                }
                _ => {}
            }
        }

        None
    }

    /// Get hex dump for selected address
    ///
    /// # Returns
    /// Option containing formatted hex dump string, or None if no selection
    pub fn get_hex_dump(&self) -> Option<String> {
        if !self.show_hex_dump || self.hex_dump_address.is_none() {
            return None;
        }

        let addr = self.hex_dump_address?;
        let data = self.hex_dump_data.as_ref()?;

        Some(format_hex_dump(data, addr))
    }

    /// Get hex dump data
    ///
    /// # Returns
    /// Option containing raw hex dump data, or None if no selection
    pub fn get_hex_dump_data(&self) -> Option<&[u8]> {
        self.hex_dump_data.as_deref()
    }

    /// Set inspection mode
    ///
    /// # Arguments
    /// * `mode` - Inspection mode to set
    pub fn set_inspection_mode(&mut self, mode: InspectionMode) {
        self.inspection_mode = mode;
    }

    /// Get current inspection mode
    ///
    /// # Returns
    /// Current inspection mode
    pub fn get_inspection_mode(&self) -> InspectionMode {
        self.inspection_mode
    }

    /// Toggle hex dump visibility
    pub fn toggle_hex_dump(&mut self) {
        self.show_hex_dump = !self.show_hex_dump;
    }

    /// Set hex dump visibility
    ///
    /// # Arguments
    /// * `show` - Whether to show hex dump
    pub fn set_show_hex_dump(&mut self, show: bool) {
        self.show_hex_dump = show;
    }

    /// Get hex dump visibility
    ///
    /// # Returns
    /// true if hex dump is visible, false otherwise
    pub fn get_show_hex_dump(&self) -> bool {
        self.show_hex_dump
    }

    /// Get selected memory address
    ///
    /// # Returns
    /// Option containing selected address, or None if no selection
    pub fn get_selected_address(&self) -> Option<usize> {
        self.selected_address
    }

    /// Get selected region name
    ///
    /// # Returns
    /// Option containing selected region name, or None if no selection
    pub fn get_selected_region(&self) -> Option<&String> {
        self.selected_region.as_ref()
    }

    /// Get hex dump address
    ///
    /// # Returns
    /// Option containing hex dump address, or None if no hex dump
    pub fn get_hex_dump_address(&self) -> Option<usize> {
        self.hex_dump_address
    }

    /// Get hex dump size
    ///
    /// # Returns
    /// Current hex dump size in bytes
    pub fn get_hex_dump_size(&self) -> usize {
        self.hex_dump_size
    }

    /// Set hex dump size
    ///
    /// # Arguments
    /// * `size` - Hex dump size in bytes
    pub fn set_hex_dump_size(&mut self, size: usize) {
        self.hex_dump_size = size;
    }

    /// Get selection range
    ///
    /// # Returns
    /// Option containing (start_uv, end_uv), or None if no selection
    pub fn get_selection(&self) -> Option<((f32, f32), (f32, f32))> {
        if let (Some(start), Some(end)) = (self.selection_start, self.selection_end) {
            Some((start, end))
        } else {
            None
        }
    }

    /// Clear selection
    pub fn clear_selection(&mut self) {
        self.selection_start = None;
        self.selection_end = None;
        self.selected_address = None;
        self.selected_region = None;
        self.hex_dump_address = None;
        self.hex_dump_data = None;
    }

    /// Get artifact IDs
    ///
    /// # Returns
    /// Tuple of (heap_id, stack_id, code_id, data_id)
    pub fn get_artifact_ids(&self) -> (
        Option<&String>,
        Option<&String>,
        Option<&String>,
        Option<&String>,
    ) {
        (
            self.heap_artifact_id.as_ref(),
            self.stack_artifact_id.as_ref(),
            self.code_artifact_id.as_ref(),
            self.data_artifact_id.as_ref(),
        )
    }

    /// Get heap artifact ID
    ///
    /// # Returns
    /// Option containing heap artifact ID, or None if not created
    pub fn get_heap_artifact_id(&self) -> Option<&String> {
        self.heap_artifact_id.as_ref()
    }

    /// Get stack artifact ID
    ///
    /// # Returns
    /// Option containing stack artifact ID, or None if not created
    pub fn get_stack_artifact_id(&self) -> Option<&String> {
        self.stack_artifact_id.as_ref()
    }

    /// Get code artifact ID
    ///
    /// # Returns
    /// Option containing code artifact ID, or None if not created
    pub fn get_code_artifact_id(&self) -> Option<&String> {
        self.code_artifact_id.as_ref()
    }

    /// Get data artifact ID
    ///
    /// # Returns
    /// Option containing data artifact ID, or None if not created
    pub fn get_data_artifact_id(&self) -> Option<&String> {
        self.data_artifact_id.as_ref()
    }

    /// Get memory mapper
    ///
    /// # Returns
    /// Option containing reference to memory mapper
    pub fn get_memory_mapper(&self) -> Option<&MemoryTextureMapper> {
        self.memory_mapper.as_ref()
    }

    /// Get Hilbert mapper
    ///
    /// # Returns
    /// Reference to Hilbert mapper
    pub fn get_hilbert_mapper(&self) -> &HilbertMemoryMapper {
        &self.hilbert_mapper
    }
}

/// Format memory data as hex dump
///
/// # Arguments
/// * `data` - Memory data to format
/// * `base_addr` - Base address for the hex dump
///
/// # Returns
/// Formatted hex dump string
pub fn format_hex_dump(data: &[u8], base_addr: usize) -> String {
    let mut output = String::new();

    for (i, chunk) in data.chunks(16).enumerate() {
        let addr = base_addr + i * 16;
        output.push_str(&format!("{:08x}: ", addr));

        // Hex bytes
        for (j, byte) in chunk.iter().enumerate() {
            output.push_str(&format!("{:02x} ", byte));
            if j == 7 {
                output.push(' ');
            }
        }

        // Padding
        for j in chunk.len()..16 {
            output.push_str("   ");
            if j == 7 {
                output.push(' ');
            }
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

/// Parse hex string to bytes
///
/// # Arguments
/// * `hex_str` - Hex string to parse
///
/// # Returns
/// Result containing parsed bytes, or error if invalid
pub fn parse_hex_string(hex_str: &str) -> Result<Vec<u8>, String> {
    let hex_str = hex_str.trim();
    if hex_str.len() % 2 != 0 {
        return Err("Hex string must have even length".to_string());
    }

    let mut bytes = Vec::new();
    for i in (0..hex_str.len()).step_by(2) {
        let byte_str = &hex_str[i..i + 2];
        let byte = u8::from_str_radix(byte_str, 16)
            .map_err(|e| format!("Invalid hex byte: {}", e))?;
        bytes.push(byte);
    }

    Ok(bytes)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_format_hex_dump() {
        let data = vec![0x00, 0x01, 0x02, 0x03, 0x41, 0x42, 0x43, 0x44];
        let dump = format_hex_dump(&data, 0x1000);

        assert!(dump.contains("00001000:"));
        assert!(dump.contains("00 01 02 03 41 42 43 44"));
        assert!(dump.contains("ABCD"));
    }

    #[test]
    fn test_parse_hex_string() {
        let hex_str = "00 01 02 03 41 42 43 44";
        let bytes = parse_hex_string(hex_str).unwrap();

        assert_eq!(bytes, vec![0x00, 0x01, 0x02, 0x03, 0x41, 0x42, 0x43, 0x44]);
    }

    #[test]
    fn test_parse_hex_string_invalid() {
        let hex_str = "00 01 02 03 41 42 43 4"; // Odd length
        let result = parse_hex_string(hex_str);

        assert!(result.is_err());
    }

    #[test]
    fn test_memory_inspector_creation() {
        let inspector = MemoryInspector::new();

        assert_eq!(inspector.get_inspection_mode(), InspectionMode::Allocation);
        assert!(!inspector.get_show_hex_dump());
        assert!(inspector.get_selected_address().is_none());
    }

    #[test]
    fn test_inspection_mode_toggle() {
        let mut inspector = MemoryInspector::new();

        inspector.set_inspection_mode(InspectionMode::Content);
        assert_eq!(inspector.get_inspection_mode(), InspectionMode::Content);

        inspector.set_inspection_mode(InspectionMode::Access);
        assert_eq!(inspector.get_inspection_mode(), InspectionMode::Access);
    }

    #[test]
    fn test_hex_dump_toggle() {
        let mut inspector = MemoryInspector::new();

        assert!(!inspector.get_show_hex_dump());

        inspector.toggle_hex_dump();
        assert!(inspector.get_show_hex_dump());

        inspector.toggle_hex_dump();
        assert!(!inspector.get_show_hex_dump());
    }

    #[test]
    fn test_clear_selection() {
        let mut inspector = MemoryInspector::new();

        inspector.on_memory_drag((0.5, 0.5));
        inspector.end_selection();

        assert!(inspector.get_selection().is_some());

        inspector.clear_selection();

        assert!(inspector.get_selection().is_none());
        assert!(inspector.get_selected_address().is_none());
    }
}
