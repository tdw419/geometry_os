/// GlyphStratum - AI-native visual programming language core
///
/// Defines the opcode set, stratum system, and metadata structures
/// for Geometry OS's AI-native programming language.
use serde::{Deserialize, Serialize};
use std::collections::HashMap;

/// Semantic strata for program organization
#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize)]
pub enum Stratum {
    /// Stratum 0: Raw pixel/glyph operations
    Substrate = 0,
    /// Stratum 1: Memory allocation, layout, types
    Memory = 1,
    /// Stratum 2: Control flow, computation
    Logic = 2,
    /// Stratum 3: Component interfaces, contracts
    Spec = 3,
    /// Stratum 4: Goals, requirements, rationale
    Intent = 4,
}

impl Stratum {
    /// Convert from numeric value
    pub fn from_value(value: u8) -> Option<Self> {
        match value {
            0 => Some(Stratum::Substrate),
            1 => Some(Stratum::Memory),
            2 => Some(Stratum::Logic),
            3 => Some(Stratum::Spec),
            4 => Some(Stratum::Intent),
            _ => None,
        }
    }
}

/// Executable opcodes for glyph-based instructions
#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize)]
pub enum Opcode {
    // Memory operations
    Alloc = 1, // Allocate memory block
    Free = 2,  // Release memory block
    Load = 3,  // Load value from memory
    Store = 4, // Store value to memory

    // Control flow
    Loop = 5,   // Begin iteration construct
    Branch = 6, // Conditional execution
    Call = 7,   // Function/subroutine invocation
    Return = 8, // Exit current scope

    // Data and types
    Data = 9,    // Literal/constant value
    Type = 10,   // Type declaration/constraint
    Ptr = 11,    // Pointer/reference type
    Struct = 12, // Structure definition

    // Program structure
    Module = 13, // Encapsulation boundary
    Export = 14, // Export symbol
    Import = 15, // Import symbol

    // Special
    Nop = 0,    // No operation
    Halt = 255, // Program termination
}

impl Opcode {
    /// Convert from numeric value
    pub fn from_value(value: u8) -> Option<Self> {
        match value {
            0 => Some(Opcode::Nop),
            1 => Some(Opcode::Alloc),
            2 => Some(Opcode::Free),
            3 => Some(Opcode::Load),
            4 => Some(Opcode::Store),
            5 => Some(Opcode::Loop),
            6 => Some(Opcode::Branch),
            7 => Some(Opcode::Call),
            8 => Some(Opcode::Return),
            9 => Some(Opcode::Data),
            10 => Some(Opcode::Type),
            11 => Some(Opcode::Ptr),
            12 => Some(Opcode::Struct),
            13 => Some(Opcode::Module),
            14 => Some(Opcode::Export),
            15 => Some(Opcode::Import),
            255 => Some(Opcode::Halt),
            _ => None,
        }
    }

    /// Get human-readable name
    pub fn name(&self) -> &'static str {
        match self {
            Opcode::Alloc => "Alloc",
            Opcode::Free => "Free",
            Opcode::Load => "Load",
            Opcode::Store => "Store",
            Opcode::Loop => "Loop",
            Opcode::Branch => "Branch",
            Opcode::Call => "Call",
            Opcode::Return => "Return",
            Opcode::Data => "Data",
            Opcode::Type => "Type",
            Opcode::Ptr => "Ptr",
            Opcode::Struct => "Struct",
            Opcode::Module => "Module",
            Opcode::Export => "Export",
            Opcode::Import => "Import",
            Opcode::Nop => "Nop",
            Opcode::Halt => "Halt",
        }
    }

    /// Get the index in the Geometry OS font atlas for this opcode
    pub fn to_index(&self) -> u32 {
        match self {
            Opcode::Alloc => 200,
            Opcode::Free => 201,
            Opcode::Load => 202,
            Opcode::Store => 203,
            Opcode::Loop => 204,
            Opcode::Branch => 205,
            Opcode::Call => 206,
            Opcode::Return => 207,
            Opcode::Data => 208,
            Opcode::Type => 209,
            Opcode::Ptr => 210,
            Opcode::Struct => 211,
            Opcode::Module => 212,
            Opcode::Export => 213,
            Opcode::Import => 214,
            Opcode::Halt => 215,
            Opcode::Nop => 183, // Use standard bullet or dot
        }
    }

    /// Map a Unicode character or Atlas Index to its corresponding Opcode
    pub fn from_char(ch: char) -> Self {
        let code = ch as u32;
        match code {
            200 => Opcode::Alloc,
            201 => Opcode::Free,
            202 => Opcode::Load,
            203 => Opcode::Store,
            204 => Opcode::Loop,
            205 => Opcode::Branch,
            206 => Opcode::Call,
            207 => Opcode::Return,
            208 => Opcode::Data,
            209 => Opcode::Type,
            210 => Opcode::Ptr,
            211 => Opcode::Struct,
            212 => Opcode::Module,
            213 => Opcode::Export,
            214 => Opcode::Import,
            215 => Opcode::Halt,
            _ => {
                // Fallback to morphological symbols if needed
                match ch {
                    '◼' => Opcode::Alloc,
                    '◻' => Opcode::Free,
                    '←' => Opcode::Load,
                    '→' => Opcode::Store,
                    '↻' => Opcode::Loop,
                    '◉' => Opcode::Branch,
                    '○' => Opcode::Call,
                    '▣' => Opcode::Return,
                    '░' => Opcode::Data,
                    '▓' => Opcode::Type,
                    '◬' => Opcode::Ptr,
                    '⌬' => Opcode::Struct,
                    '█' => Opcode::Module,
                    '↗' => Opcode::Export,
                    '↘' => Opcode::Import,
                    '·' => Opcode::Nop,
                    '⌧' => Opcode::Halt,
                    _ => Opcode::Nop,
                }
            }
        }
    }

    /// Get the preferred character (Atlas Index) for this Opcode
    pub fn to_char(&self) -> char {
        std::char::from_u32(self.to_index()).unwrap_or('·')
    }
}

/// Glyph metadata structure
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct GlyphMetadata {
    /// Dependencies: glyph indices this glyph depends on
    pub dependencies: Vec<u32>,

    /// Invariants: constraints on glyph behavior (JSON extensible format)
    pub invariants: serde_json::Value,

    /// Provenance: session ID, timestamp, creator info
    pub provenance: ProvenanceInfo,

    /// Rationale: human-readable explanation of purpose
    pub rationale: String,
}

/// Provenance tracking information
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ProvenanceInfo {
    /// Creating/modifying session identifier
    pub session_id: String,

    /// Timestamp of creation/modification
    pub timestamp: String,

    /// Agent or human that created/modified
    pub creator: String,

    /// Version or change number
    pub version: u32,
}

/// Enhanced GlyphInfo with GlyphStratum fields
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct EnhancedGlyphInfo {
    /// Base glyph information (position, size, etc.)
    pub base: super::font_atlas::GlyphInfo,

    /// Stratum information
    pub stratum: Stratum,

    /// Executable opcode
    pub opcode: Opcode,

    /// Rich metadata
    pub metadata: GlyphMetadata,
}

impl EnhancedGlyphInfo {
    /// Create from basic GlyphInfo with defaults
    pub fn from_basic(base: super::font_atlas::GlyphInfo) -> Self {
        Self {
            base,
            stratum: Stratum::Substrate,
            opcode: Opcode::Nop,
            metadata: GlyphMetadata {
                dependencies: Vec::new(),
                invariants: serde_json::json!({}),
                provenance: ProvenanceInfo {
                    session_id: "system".to_string(),
                    timestamp: chrono::Utc::now().to_rfc3339(),
                    creator: "genesis".to_string(),
                    version: 1,
                },
                rationale: "System-generated glyph".to_string(),
            },
        }
    }

    /// Get executable opcode
    pub fn opcode(&self) -> Opcode {
        self.opcode
    }

    /// Get semantic stratum
    pub fn stratum(&self) -> Stratum {
        self.stratum
    }

    /// Get dependencies
    pub fn dependencies(&self) -> &Vec<u32> {
        &self.metadata.dependencies
    }

    /// Get invariants
    pub fn invariants(&self) -> &serde_json::Value {
        &self.metadata.invariants
    }

    /// Get provenance
    pub fn provenance(&self) -> &ProvenanceInfo {
        &self.metadata.provenance
    }

    /// Get rationale
    pub fn rationale(&self) -> &String {
        &self.metadata.rationale
    }
}

/// Registry for tracking glyphs and their relationships
#[derive(Debug, Default)]
pub struct GlyphRegistry {
    /// Map of glyph index to enhanced glyph info
    pub glyphs: HashMap<u32, EnhancedGlyphInfo>,

    /// Next available glyph index
    pub next_index: u32,
}

impl GlyphRegistry {
    /// Create new registry
    pub fn new() -> Self {
        Self::default()
    }

    /// Register a new glyph
    pub fn register(&mut self, mut glyph: EnhancedGlyphInfo) -> u32 {
        let index = self.next_index;
        glyph.base.unicode = index as u32; // Use index as unicode for lookup
        self.glyphs.insert(index, glyph);
        self.next_index += 1;
        index
    }

    /// Get glyph by index
    pub fn get(&self, index: &u32) -> Option<&EnhancedGlyphInfo> {
        self.glyphs.get(index)
    }

    /// Get mutable glyph by index
    pub fn get_mut(&mut self, index: &u32) -> Option<&mut EnhancedGlyphInfo> {
        self.glyphs.get_mut(index)
    }

    /// Query glyphs by stratum
    pub fn by_stratum(&self, stratum: Stratum) -> Vec<(u32, &EnhancedGlyphInfo)> {
        self.glyphs
            .iter()
            .filter(|(_, glyph)| glyph.stratum() == stratum)
            .map(|(index, glyph)| (*index, glyph))
            .collect()
    }

    /// Query glyphs by opcode
    pub fn by_opcode(&self, opcode: Opcode) -> Vec<(u32, &EnhancedGlyphInfo)> {
        self.glyphs
            .iter()
            .filter(|(_, glyph)| glyph.opcode() == opcode)
            .map(|(index, glyph)| (*index, glyph))
            .collect()
    }

    /// Get all glyphs that depend on a given glyph
    pub fn dependents(&self, glyph_index: u32) -> Vec<u32> {
        self.glyphs
            .iter()
            .filter(|(_, glyph)| glyph.dependencies().contains(&glyph_index))
            .map(|(index, _)| *index)
            .collect()
    }
}

/// GlyphStratumEngine - Manages a grid of visual instructions with metadata
#[derive(Debug, Default)]
pub struct GlyphStratumEngine {
    /// Glyph registry for metadata storage
    pub registry: GlyphRegistry,
    /// Grid dimensions (columns, rows)
    pub dimensions: (u32, u32),
    /// Map of (x, y) coordinates to glyph registry index
    pub grid: HashMap<(u32, u32), u32>,
}

impl GlyphStratumEngine {
    /// Create a new engine with specified dimensions
    pub fn new(cols: u32, rows: u32) -> Self {
        Self {
            registry: GlyphRegistry::new(),
            dimensions: (cols, rows),
            grid: HashMap::new(),
        }
    }

    /// Place a glyph at specified coordinates
    pub fn place_glyph(
        &mut self,
        x: u32,
        y: u32,
        ch: char,
        stratum: Stratum,
        metadata: Option<GlyphMetadata>,
    ) -> Result<u32, String> {
        if x >= self.dimensions.0 || y >= self.dimensions.1 {
            return Err(format!("Coordinates out of bounds: ({}, {})", x, y));
        }

        // Stratum enforcement: ensure bottom-up construction
        if stratum as u8 > 0 {
            let lower_stratum_exists = self.grid.values()
                .filter_map(|&idx| self.registry.get(&idx))
                .any(|g| (g.stratum() as u8) < stratum as u8);
            
            if !lower_stratum_exists && stratum != Stratum::Substrate {
                log::warn!("⚠️ Stratum violation: Placing {:?} without lower strata", stratum);
                // We allow it for now but warn, or we could return Err
            }
        }

        let opcode = Opcode::from_char(ch);
        
        // Create base glyph info (minimal fields for identification)
        let base = super::font_atlas::GlyphInfo {
            unicode: ch as u32,
            x: 0, y: 0, width: 0, height: 0,
            advance: 1.0, bearing_x: 0.0, bearing_y: 0.0,
            opcode: opcode as u8,
            stratum: stratum as u8,
            dependencies: Vec::new(),
            invariants: "{}".to_string(),
            provenance: "".to_string(),
            rationale: "".to_string(),
        };

        let mut enhanced = EnhancedGlyphInfo::from_basic(base);
        enhanced.opcode = opcode;
        enhanced.stratum = stratum;
        
        if let Some(meta) = metadata {
            enhanced.metadata = meta;
        }

        let index = self.registry.register(enhanced);
        self.grid.insert((x, y), index);
        
        Ok(index)
    }

    /// Get glyph at coordinates
    pub fn get_glyph(&self, x: u32, y: u32) -> Option<&EnhancedGlyphInfo> {
        self.grid.get(&(x, y)).and_then(|&idx| self.registry.get(&idx))
    }

    /// Query the entire row for a program structure
    pub fn get_row_program(&self, y: u32) -> Vec<(u32, Opcode, Stratum)> {
        let mut program = Vec::new();
        for x in 0..self.dimensions.0 {
            if let Some(glyph) = self.get_glyph(x, y) {
                program.push((x, glyph.opcode(), glyph.stratum()));
            }
        }
        program
    }

    /// Generate a summary of the program for an AI agent
    pub fn generate_ai_summary(&self) -> String {
        let mut summary = String::new();
        summary.push_str("GlyphStratum Program Summary:\n");
        
        for y in 0..self.dimensions.1 {
            let row = self.get_row_program(y);
            if !row.is_empty() {
                summary.push_str(&format!("Row {}: ", y));
                for (_x, op, strat) in row {
                    summary.push_str(&format!("{}[{:?}:S{}] ", op.to_char(), op, strat as u8));
                }
                summary.push('\n');
            }
        }
        summary
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_stratum_from_value() {
        assert_eq!(Stratum::from_value(0), Some(Stratum::Substrate));
        assert_eq!(Stratum::from_value(2), Some(Stratum::Logic));
        assert_eq!(Stratum::from_value(4), Some(Stratum::Intent));
        assert_eq!(Stratum::from_value(5), None);
    }

    #[test]
    fn test_opcode_from_value() {
        assert_eq!(Opcode::from_value(1), Some(Opcode::Alloc));
        assert_eq!(Opcode::from_value(7), Some(Opcode::Call));
        assert_eq!(Opcode::from_value(255), Some(Opcode::Halt));
        assert_eq!(Opcode::from_value(99), None);
    }

    #[test]
    fn test_opcode_name() {
        assert_eq!(Opcode::Alloc.name(), "Alloc");
        assert_eq!(Opcode::Return.name(), "Return");
        assert_eq!(Opcode::Halt.name(), "Halt");
    }

    #[test]
    fn test_glyph_registry() {
        let mut registry = GlyphRegistry::new();

        // Create a basic glyph (would normally come from font_atlas)
        use super::super::font_atlas::GlyphInfo;
        let basic_glyph = GlyphInfo {
            unicode: 65, // 'A'
            x: 0,
            y: 0,
            width: 32,
            height: 32,
            advance: 0.6,
            bearing_x: 0.0,
            bearing_y: 0.0,
            opcode: 0,
            stratum: 0,
            dependencies: Vec::new(),
            invariants: "{}".to_string(),
            provenance: "".to_string(),
            rationale: "".to_string(),
        };

        let enhanced = EnhancedGlyphInfo::from_basic(basic_glyph);
        let index = registry.register(enhanced);

        assert_eq!(index, 0);
        let retrieved = registry.get(&0).unwrap();
        assert_eq!(retrieved.base.unicode, 65);
        assert_eq!(retrieved.stratum(), Stratum::Substrate);
        assert_eq!(retrieved.opcode(), Opcode::Nop);
    }

    #[test]
    fn test_glyph_stratum_engine_hello_world() {
        let mut engine = GlyphStratumEngine::new(80, 40);

        // Row 0: Module(212) Data(208) Data(208) Call(206) Return(207)
        engine.place_glyph(0, 0, std::char::from_u32(212).unwrap(), Stratum::Substrate, None).unwrap();
        engine.place_glyph(1, 0, std::char::from_u32(208).unwrap(), Stratum::Memory, None).unwrap();
        engine.place_glyph(2, 0, std::char::from_u32(208).unwrap(), Stratum::Memory, None).unwrap();
        engine.place_glyph(3, 0, std::char::from_u32(206).unwrap(), Stratum::Logic, None).unwrap();
        engine.place_glyph(4, 0, std::char::from_u32(207).unwrap(), Stratum::Logic, None).unwrap();

        let summary = engine.generate_ai_summary();
        println!("{}", summary);

        // Expected output uses characters corresponding to indices 212, 208, 208, 206, 207
        assert!(summary.contains("Row 0:"));
        assert!(summary.contains("[Module:S0]"));
        assert!(summary.contains("[Data:S1]"));
        assert!(summary.contains("[Call:S2]"));
        assert!(summary.contains("[Return:S2]"));
        
        // Verify query
        let glyph = engine.get_glyph(3, 0).unwrap();
        assert_eq!(glyph.opcode(), Opcode::Call);
        assert_eq!(glyph.stratum(), Stratum::Logic);
    }
}

// FFI module for Python bindings
pub mod ffi;
