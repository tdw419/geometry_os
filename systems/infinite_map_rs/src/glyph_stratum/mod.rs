//! Phase 30: Glyph Stratum Core (Geometry OS Edition)
//!
//! The Glyph Stratum is the AI-native representation of morphological computation.
//! Software is represented as visual glyphs across 5 strata:
//! INTENT → SPEC → LOGIC → MEMORY → SUBSTRATE

pub mod glyph_compiler;
pub mod glyph_parser;
pub mod glyph_to_rts;

// Re-export key types
pub use glyph_compiler::{
    compile_glyph_file, compile_glyph_source, create_glyph_texture, hilbert_d2xy, CompiledGlyph,
};
pub use glyph_parser::{parse_glyph_program, VmConfig};

use serde::{Deserialize, Serialize};
use std::collections::HashMap;

/// The 5 Strata of Geometry OS Computation
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash, Serialize, Deserialize)]
pub enum Stratum {
    Substrate = 0,
    Memory = 1,
    Logic = 2,
    Spec = 3,
    Intent = 4,
}

impl Stratum {
    pub fn from_value(v: Option<u8>) -> Self {
        match v {
            Some(0) => Self::Substrate,
            Some(1) => Self::Memory,
            Some(2) => Self::Logic,
            Some(3) => Self::Spec,
            Some(4) => Self::Intent,
            _ => Self::Substrate,
        }
    }
}

/// Opcodes for the Logic Stratum
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash, Serialize, Deserialize)]
pub enum Opcode {
    Nop = 0,
    Alloc = 1,
    Free = 2,
    Load = 3,
    Store = 4,
    Add = 5,
    Sub = 6,
    Mul = 7,
    Div = 8,
    Jump = 9,
    Branch = 10,
    Call = 11,
    Return = 12,
    Halt = 13,
    Data = 14,
    Loop = 15,
    Jal = 16,
}

/// Metabolic cost per opcode (VRAM cycles)
impl Opcode {
    pub fn metabolic_cost(&self) -> u32 {
        match self {
            Opcode::Nop => 0,    // Free - no work
            Opcode::Alloc => 10, // Memory allocation is expensive
            Opcode::Free => 5,   // Deallocation
            Opcode::Load => 3,   // Memory read
            Opcode::Store => 3,  // Memory write
            Opcode::Add => 1,    // Simple ALU
            Opcode::Sub => 1,    // Simple ALU
            Opcode::Mul => 2,    // Multiplier
            Opcode::Div => 4,    // Division is slower
            Opcode::Jump => 1,   // Control flow
            Opcode::Branch => 2, // Conditional check
            Opcode::Call => 8,   // Stack frame setup
            Opcode::Return => 6, // Stack teardown
            Opcode::Halt => 0,   // Terminal
            Opcode::Data => 0,   // Passive data
            Opcode::Loop => 3,   // Loop overhead
            Opcode::Jal => 2,    // Jump and Link
        }
    }

    /// Is this opcode "dead" (no side effects)?
    pub fn is_dead(&self) -> bool {
        matches!(self, Opcode::Nop)
    }

    /// Does this opcode read memory?
    pub fn reads_memory(&self) -> bool {
        matches!(self, Opcode::Load)
    }

    /// Does this opcode write memory?
    pub fn writes_memory(&self) -> bool {
        matches!(self, Opcode::Store | Opcode::Alloc | Opcode::Free)
    }
}

impl Opcode {
    pub fn from_value(v: u32) -> Option<Self> {
        match v {
            0 => Some(Self::Nop),
            1 => Some(Self::Alloc),
            2 => Some(Self::Free),
            3 => Some(Self::Load),
            4 => Some(Self::Store),
            5 => Some(Self::Add),
            6 => Some(Self::Sub),
            7 => Some(Self::Mul),
            8 => Some(Self::Div),
            9 => Some(Self::Jump),
            10 => Some(Self::Branch),
            11 => Some(Self::Call),
            12 => Some(Self::Return),
            13 => Some(Self::Halt),
            14 => Some(Self::Data),
            15 => Some(Self::Loop),
            16 => Some(Self::Jal),
            _ => None,
        }
    }

    pub fn to_char(&self) -> char {
        std::char::from_u32(200 + *self as u32).unwrap_or('?')
    }
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ProvenanceInfo {
    pub session_id: String,
    pub timestamp: String,
    pub creator: String,
    pub version: u32,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct GlyphMetadata {
    pub dependencies: Vec<u32>,
    pub invariants: serde_json::Value,
    pub provenance: ProvenanceInfo,
    pub rationale: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Glyph {
    pub base: GlyphBase,
    pub metadata: GlyphMetadata,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct GlyphBase {
    pub unicode: u32,
    pub stratum: u8,
}

impl Glyph {
    pub fn opcode(&self) -> Opcode {
        Opcode::from_value(self.base.unicode.saturating_sub(200)).unwrap_or(Opcode::Nop)
    }
    pub fn stratum(&self) -> Stratum {
        Stratum::from_value(Some(self.base.stratum))
    }
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct CorruptionReport {
    pub x: u32,
    pub y: u32,
    pub expected: Opcode,
    pub found: Opcode,
}

/// Redundant pattern detection result
#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum RedundantPattern {
    ConsecutiveNops { positions: Vec<u32> },
    LoadLoadWithoutStore { positions: Vec<u32> },
    DeadStore { position: u32 },
}

/// Metabolic optimization result
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct MetabolicOptimization {
    pub initial_cost: u32,
    pub final_cost: u32,
    pub savings: u32,
    pub nops_removed: usize,
    pub glyphs_before: usize,
    pub glyphs_after: usize,
}

/// Full metabolic report for AI analysis
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct MetabolicReport {
    pub bounds: ((u32, u32), (u32, u32)),
    pub glyph_count: usize,
    pub total_metabolic_cost: u32,
    pub opcode_distribution: HashMap<String, usize>,
    pub dead_glyph_count: usize,
    pub efficiency_ratio: f32,
}

/// The engine managing the Glyph Stratum grid
pub struct GlyphStratumEngine {
    pub dimensions: (u32, u32),
    pub grid: HashMap<(u32, u32), u32>,
    pub registry: HashMap<u32, Glyph>,
}

impl GlyphStratumEngine {
    pub fn new(width: u32, height: u32) -> Self {
        Self {
            dimensions: (width, height),
            grid: HashMap::new(),
            registry: HashMap::new(),
        }
    }

    pub fn place_glyph(
        &mut self,
        x: u32,
        y: u32,
        ch: char,
        stratum: Stratum,
        metadata: Option<GlyphMetadata>,
    ) -> Result<u32, String> {
        if x >= self.dimensions.0 || y >= self.dimensions.1 {
            return Err("Coordinates out of bounds".to_string());
        }

        let glyph_id = ch as u32;
        let meta = metadata.unwrap_or(GlyphMetadata {
            dependencies: Vec::new(),
            invariants: serde_json::json!({}),
            provenance: ProvenanceInfo {
                session_id: "default".to_string(),
                timestamp: "".to_string(),
                creator: "system".to_string(),
                version: 1,
            },
            rationale: "".to_string(),
        });

        self.registry.insert(
            glyph_id,
            Glyph {
                base: GlyphBase {
                    unicode: glyph_id,
                    stratum: stratum as u8,
                },
                metadata: meta,
            },
        );

        self.grid.insert((x, y), glyph_id);
        Ok(glyph_id)
    }

    pub fn get_glyph(&self, x: u32, y: u32) -> Option<&Glyph> {
        let glyph_id = self.grid.get(&(x, y))?;
        self.registry.get(glyph_id)
    }

    pub fn spawn(
        &mut self,
        src_bounds: ((u32, u32), (u32, u32)),
        dest_origin: (u32, u32),
    ) -> Result<(((u32, u32), (u32, u32)), ((u32, u32), (u32, u32))), String> {
        let (min_x, min_y) = src_bounds.0;
        let (max_x, max_y) = src_bounds.1;
        let (dest_x, dest_y) = dest_origin;

        let mut copied = 0;
        let mut new_bounds: Option<((u32, u32), (u32, u32))> = None;

        for y in min_y..=max_y {
            for x in min_x..=max_x {
                if let Some(glyph) = self.get_glyph(x, y) {
                    let new_x = dest_x + (x - min_x);
                    let new_y = dest_y + (y - min_y);

                    if new_x >= self.dimensions.0 || new_y >= self.dimensions.1 {
                        continue;
                    }

                    self.place_glyph(
                        new_x,
                        new_y,
                        std::char::from_u32(glyph.base.unicode).unwrap_or('?'),
                        glyph.stratum(),
                        Some(glyph.metadata.clone()),
                    )
                    .ok();

                    copied += 1;

                    if new_bounds.is_none() {
                        new_bounds = Some(((new_x, new_y), (new_x, new_y)));
                    } else if let Some(ref mut bounds) = new_bounds {
                        bounds.0 = (bounds.0 .0.min(new_x), bounds.0 .1.min(new_y));
                        bounds.1 = (bounds.1 .0.max(new_x), bounds.1 .1.max(new_y));
                    }
                }
            }
        }

        if copied == 0 {
            return Err("No glyphs copied".to_string());
        }

        let final_bounds = new_bounds.unwrap_or(((dest_x, dest_y), (dest_x, dest_y)));
        Ok((src_bounds, final_bounds))
    }

    pub fn scan_for_corruptions(
        &self,
        expected: &HashMap<(u32, u32), Opcode>,
    ) -> Vec<CorruptionReport> {
        let mut corruptions = Vec::new();
        for (&(x, y), &expected_op) in expected {
            if let Some(glyph) = self.get_glyph(x, y) {
                let found_op = glyph.opcode();
                if found_op != expected_op {
                    corruptions.push(CorruptionReport {
                        x,
                        y,
                        expected: expected_op,
                        found: found_op,
                    });
                }
            }
        }
        corruptions
    }

    pub fn repair_glyph(&mut self, x: u32, y: u32, expected: Opcode) -> Result<String, String> {
        if let Some(glyph) = self.get_glyph(x, y) {
            self.place_glyph(
                x,
                y,
                expected.to_char(),
                glyph.stratum(),
                Some(glyph.metadata.clone()),
            )?;
            Ok("Repaired".to_string())
        } else {
            Err("Glyph not found".to_string())
        }
    }

    pub fn apply_cosmic_rays(&mut self, _intensity: f32) -> Vec<(u32, u32, Opcode, Opcode)> {
        Vec::new()
    }

    pub fn generate_ai_summary(&self) -> String {
        format!(
            "Glyph Stratum Grid ({}x{}): {} glyphs placed",
            self.dimensions.0,
            self.dimensions.1,
            self.grid.len()
        )
    }

    // ==================== Metabolic Efficiency ====================

    /// Calculate total metabolic cost (VRAM cycles) for the grid
    pub fn calculate_metabolic_cost(&self) -> u32 {
        self.grid
            .iter()
            .filter_map(|((_x, _y), glyph_id)| {
                self.registry
                    .get(glyph_id)
                    .map(|g| g.opcode().metabolic_cost())
            })
            .sum()
    }

    /// Calculate metabolic cost for a specific region
    pub fn calculate_region_cost(&self, bounds: ((u32, u32), (u32, u32))) -> u32 {
        let (min_x, min_y) = bounds.0;
        let (max_x, max_y) = bounds.1;

        let mut total = 0u32;
        for y in min_y..=max_y {
            for x in min_x..=max_x {
                if let Some(glyph) = self.get_glyph(x, y) {
                    total += glyph.opcode().metabolic_cost();
                }
            }
        }
        total
    }

    /// Detect redundant patterns (consecutive Nops, Load-Load without Store)
    pub fn detect_redundant_patterns(
        &self,
        row: u32,
        start_x: u32,
        end_x: u32,
    ) -> Vec<RedundantPattern> {
        let mut patterns = Vec::new();
        let mut prev_opcode = None;
        let mut consecutive_nops = Vec::new();

        for x in start_x..=end_x {
            if let Some(glyph) = self.get_glyph(x, row) {
                let op = glyph.opcode();

                // Track consecutive Nops
                if op == Opcode::Nop {
                    consecutive_nops.push(x);
                } else {
                    if consecutive_nops.len() > 1 {
                        patterns.push(RedundantPattern::ConsecutiveNops {
                            positions: consecutive_nops.clone(),
                        });
                    }
                    consecutive_nops.clear();
                }

                // Detect Load-Load without Store in between
                if let Some(prev) = prev_opcode {
                    if prev == Opcode::Load && op == Opcode::Load {
                        patterns.push(RedundantPattern::LoadLoadWithoutStore {
                            positions: vec![x - 1, x],
                        });
                    }
                }

                prev_opcode = Some(op);
            }
        }

        // Handle trailing Nops
        if consecutive_nops.len() > 1 {
            patterns.push(RedundantPattern::ConsecutiveNops {
                positions: consecutive_nops,
            });
        }

        patterns
    }

    /// Optimize metabolic efficiency - remove dead code and compact
    pub fn optimize_metabolic_efficiency(
        &mut self,
        bounds: ((u32, u32), (u32, u32)),
    ) -> MetabolicOptimization {
        let (min_x, min_y) = bounds.0;
        let (max_x, max_y) = bounds.1;

        let initial_cost = self.calculate_region_cost(bounds);
        let initial_count = self.count_glyphs_in_region(bounds);

        let mut removed_nops = 0;

        // Phase 1: Remove consecutive Nops (keep first one as spacer)
        for y in min_y..=max_y {
            let mut x = min_x;
            while x <= max_x {
                if let Some(glyph) = self.get_glyph(x, y) {
                    if glyph.opcode() == Opcode::Nop {
                        // Check if next is also Nop
                        if x < max_x {
                            if let Some(next) = self.get_glyph(x + 1, y) {
                                if next.opcode() == Opcode::Nop {
                                    // Remove redundant Nop
                                    self.grid.remove(&(x + 1, y));
                                    removed_nops += 1;
                                    continue; // Don't increment x - check if there are more
                                }
                            }
                        }
                    }
                }
                x += 1;
            }
        }

        // Phase 2: Compact leftward (remove gaps created by Nop removal)
        for y in min_y..=max_y {
            let mut write_x = min_x;
            for read_x in min_x..=max_x {
                if let Some(glyph) = self.get_glyph(read_x, y) {
                    if read_x != write_x {
                        // Move glyph left
                        let ch = std::char::from_u32(glyph.base.unicode).unwrap_or('?');
                        let _ = self.place_glyph(
                            write_x,
                            y,
                            ch,
                            glyph.stratum(),
                            Some(glyph.metadata.clone()),
                        );
                        self.grid.remove(&(read_x, y));
                    }
                    write_x += 1;
                }
            }
        }

        let final_cost = self.calculate_region_cost(bounds);
        let final_count = self.count_glyphs_in_region(bounds);

        MetabolicOptimization {
            initial_cost,
            final_cost,
            savings: initial_cost.saturating_sub(final_cost),
            nops_removed: removed_nops,
            glyphs_before: initial_count,
            glyphs_after: final_count,
        }
    }

    /// Count glyphs in a region
    fn count_glyphs_in_region(&self, bounds: ((u32, u32), (u32, u32))) -> usize {
        let (min_x, min_y) = bounds.0;
        let (max_x, max_y) = bounds.1;

        let mut count = 0;
        for y in min_y..=max_y {
            for x in min_x..=max_x {
                if self.grid.contains_key(&(x, y)) {
                    count += 1;
                }
            }
        }
        count
    }

    /// Generate metabolic report for AI analysis
    pub fn generate_metabolic_report(&self, bounds: ((u32, u32), (u32, u32))) -> MetabolicReport {
        let (min_x, min_y) = bounds.0;
        let (max_x, max_y) = bounds.1;

        let mut opcode_counts: HashMap<String, usize> = HashMap::new();
        let mut total_cost = 0u32;
        let mut glyph_count = 0;

        for y in min_y..=max_y {
            for x in min_x..=max_x {
                if let Some(glyph) = self.get_glyph(x, y) {
                    let op = glyph.opcode();
                    *opcode_counts.entry(format!("{:?}", op)).or_insert(0) += 1;
                    total_cost += op.metabolic_cost();
                    glyph_count += 1;
                }
            }
        }

        let dead_glyphs = *opcode_counts.get("Nop").unwrap_or(&0);
        let efficiency_ratio = if glyph_count > 0 {
            (glyph_count - dead_glyphs) as f32 / glyph_count as f32
        } else {
            0.0
        };

        MetabolicReport {
            bounds,
            glyph_count,
            total_metabolic_cost: total_cost,
            opcode_distribution: opcode_counts,
            dead_glyph_count: dead_glyphs,
            efficiency_ratio,
        }
    }
}
