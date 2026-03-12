/// Glyph Microcode Interpreter (v2)
/// 
/// This shader executes micro-operations based on glyph opcodes 200-215.
/// It treats the Glyph Stratum as an instruction space.

struct Glyph {
    opcode: u32,
    stratum: u32,
    p1: f32, // Parameter 1
    p2: f32, // Parameter 2
    target: u32, // Target glyph/memory index
};

struct ExecutionState {
    pc: u32,       // Program Counter
    sp: u32,       // Stack Pointer
    flags: u32,    // CPU Flags (Zero, Sign, etc.)
    halted: u32,   // Halt status
    cycles: u32,   // Cycle count
};

// Memory layout
@group(0) @binding(0) var<storage, read> program: array<Glyph>;
@group(0) @binding(1) var<storage, read_write> state: ExecutionState;
@group(0) @binding(2) var<storage, read_write> memory: array<f32>;
@group(0) @binding(3) var<storage, read_write> stack: array<u32>;

@compute @workgroup_size(1)
fn main(@builtin(global_invocation_id) id: vec3<u32>) {
    // Only the first thread handles the sequential PC execution for now
    // (In a parallel model, we'd use different dispatch patterns)
    if (id.x != 0u || state.halted != 0u) {
        return;
    }

    let current_pc = state.pc;
    let glyph = program[current_pc];
    
    // Increment PC
    state.pc += 1u;
    state.cycles += 1u;

    // Execute Microcode (Mapping to 200-215 internally)
    switch (glyph.opcode) {
        // Arithmetic (200-203)
        case 200u: { // ADD_M
            memory[glyph.target] = glyph.p1 + glyph.p2;
        }
        case 201u: { // SUB_M
            memory[glyph.target] = glyph.p1 - glyph.p2;
        }
        case 202u: { // MUL_M
            memory[glyph.target] = glyph.p1 * glyph.p2;
        }
        case 203u: { // DIV_M
            if (glyph.p2 != 0.0) {
                memory[glyph.target] = glyph.p1 / glyph.p2;
            }
        }

        // Memory (204-207)
        case 204u: { // LD
            memory[glyph.target] = memory[u32(glyph.p1)];
        }
        case 205u: { // ST
            memory[u32(glyph.p1)] = glyph.p2;
        }
        case 206u: { // MOV
            memory[glyph.target] = glyph.p1;
        }
        case 207u: { // CLR
            memory[glyph.target] = 0.0;
        }

        // Control (208-211)
        case 208u: { // JMP
            state.pc = u32(glyph.p1);
        }
        case 209u: { // JZ (Jump if result in target is zero)
            if (memory[glyph.target] == 0.0) {
                state.pc = u32(glyph.p1);
            }
        }
        case 210u: { // CALL_M
            stack[state.sp] = state.pc;
            state.sp += 1u;
            state.pc = u32(glyph.p1);
        }
        case 211u: { // RET_M
            state.sp -= 1u;
            state.pc = stack[state.sp];
        }

        // System (212-215)
        case 212u: { // HALT_M
            state.halted = 1u;
        }
        case 213u: { // SYNC
            // Implementation specific - barrier or flush
        }
        case 215u: { // DRAW (Simplified)
            // This would interact with a texture/framebuffer
            // memory[DRAW_BUFFER_START + offset] = glyph.p1;
        }

        default: {
            // NOP or Unknown
        }
    }

    // Safety halt after max cycles to prevent infinite loops in shader
    if (state.cycles > 1000u) {
        state.halted = 1u;
    }
}
