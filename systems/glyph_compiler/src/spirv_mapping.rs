use spirv_headers::Op as SpirvOp;

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_add_opcode_maps_to_spirv_fadd() {
        let builder = SpirvBuilder::new();
        let spirv_op = builder.map_glyph_opcode(GlyphOpcode::ADD_M);
        assert_eq!(spirv_op, SpirvOp::FAdd);
    }

    #[test]
    fn test_memory_ops_map_to_load_store() {
        let builder = SpirvBuilder::new();
        assert_eq!(builder.map_glyph_opcode(GlyphOpcode::LD), SpirvOp::Load);
        assert_eq!(builder.map_glyph_opcode(GlyphOpcode::ST), SpirvOp::Store);
    }

    #[test]
    fn test_control_flow_ops_map_correctly() {
        let builder = SpirvBuilder::new();
        assert_eq!(builder.map_glyph_opcode(GlyphOpcode::JMP), SpirvOp::Branch);
        assert_eq!(builder.map_glyph_opcode(GlyphOpcode::JZ), SpirvOp::BranchConditional);
    }
}

/// Glyph opcodes from apps/autoresearch/champion_shader.wgsl (200-227)
#[allow(non_camel_case_types)]
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
#[repr(u32)]
pub enum GlyphOpcode {
    ADD_M = 200,
    SUB_M = 201,
    MUL_M = 202,
    DIV_M = 203,
    LD = 204,
    ST = 205,
    MOV = 206,
    CLR = 207,
    JMP = 208,
    JZ = 209,
    CALL_M = 210,
    RET_M = 211,
    HALT_M = 212,
    DRAW = 215,
    ADD_MEM = 216,
    SUB_MEM = 217,
    INT_DISPATCH = 218,
    BRANCH_PROB = 220,
    CONFIDENCE_MARK = 221,
    ALTERNATE_PATH = 222,
    ATTENTION_FOCUS = 223,
    GLYPH_MUTATE = 224,
    SPATIAL_SPAWN = 225,
    LOAD_EMBEDDING = 227,
}

impl TryFrom<u32> for GlyphOpcode {
    type Error = String;

    fn try_from(value: u32) -> Result<Self, Self::Error> {
        match value {
            200 => Ok(GlyphOpcode::ADD_M),
            201 => Ok(GlyphOpcode::SUB_M),
            202 => Ok(GlyphOpcode::MUL_M),
            203 => Ok(GlyphOpcode::DIV_M),
            204 => Ok(GlyphOpcode::LD),
            205 => Ok(GlyphOpcode::ST),
            206 => Ok(GlyphOpcode::MOV),
            207 => Ok(GlyphOpcode::CLR),
            208 => Ok(GlyphOpcode::JMP),
            209 => Ok(GlyphOpcode::JZ),
            210 => Ok(GlyphOpcode::CALL_M),
            211 => Ok(GlyphOpcode::RET_M),
            212 => Ok(GlyphOpcode::HALT_M),
            215 => Ok(GlyphOpcode::DRAW),
            216 => Ok(GlyphOpcode::ADD_MEM),
            217 => Ok(GlyphOpcode::SUB_MEM),
            218 => Ok(GlyphOpcode::INT_DISPATCH),
            220 => Ok(GlyphOpcode::BRANCH_PROB),
            221 => Ok(GlyphOpcode::CONFIDENCE_MARK),
            222 => Ok(GlyphOpcode::ALTERNATE_PATH),
            223 => Ok(GlyphOpcode::ATTENTION_FOCUS),
            224 => Ok(GlyphOpcode::GLYPH_MUTATE),
            225 => Ok(GlyphOpcode::SPATIAL_SPAWN),
            227 => Ok(GlyphOpcode::LOAD_EMBEDDING),
            _ => Err(format!("Unknown glyph opcode: {}", value)),
        }
    }
}

pub struct SpirvBuilder {
    pub id_bound: u32,
}

impl SpirvBuilder {
    pub fn new() -> Self {
        Self { id_bound: 1 }
    }

    pub fn map_glyph_opcode(&self, opcode: GlyphOpcode) -> SpirvOp {
        match opcode {
            GlyphOpcode::ADD_M | GlyphOpcode::ADD_MEM => SpirvOp::FAdd,
            GlyphOpcode::SUB_M | GlyphOpcode::SUB_MEM => SpirvOp::FSub,
            GlyphOpcode::MUL_M => SpirvOp::FMul,
            GlyphOpcode::DIV_M => SpirvOp::FDiv,
            GlyphOpcode::LD => SpirvOp::Load,
            GlyphOpcode::ST => SpirvOp::Store,
            GlyphOpcode::MOV | GlyphOpcode::CLR => SpirvOp::CopyObject,
            GlyphOpcode::JMP => SpirvOp::Branch,
            GlyphOpcode::JZ => SpirvOp::BranchConditional,
            GlyphOpcode::CALL_M => SpirvOp::FunctionCall,
            GlyphOpcode::RET_M => SpirvOp::Return,
            GlyphOpcode::HALT_M => SpirvOp::Kill, // Closest SPIR-V equivalent
            _ => SpirvOp::Nop, // Extended ops need custom handling
        }
    }
}
