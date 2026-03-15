// ============================================
// GEOMETRY OS - GLYPH MICROCODE VM
// Phase 43: Native Glyph Execution
// This shader implements the spatial instruction set for the OS substrate.
// ============================================

struct Glyph {
    opcode: u32,
    stratum: u32,
    p1: f32,
    p2: f32,
    dst: u32,
};

struct VMState {
    pc: u32,
    sp: u32,
    flags: u32,
    halted: u32,
    cycles: u32,
};

struct Uniforms {
    width: u32,
    height: u32,
    time: f32,
    _padding: f32,
};

@group(0) @binding(0) var<storage, read_write> program: array<Glyph>;
@group(0) @binding(1) var<storage, read_write> state: VMState;
@group(0) @binding(2) var<storage, read_write> memory: array<f32>;
@group(0) @binding(3) var<storage, read_write> stack: array<f32>;
@group(0) @binding(4) var atlas: texture_2d<f32>;
@group(0) @binding(5) var screen: texture_storage_2d<rgba8unorm, write>;

// Opcode Definitions
const OP_NOP: u32 = 140u;
const OP_DATA: u32 = 128u;
const OP_LOAD: u32 = 129u;
const OP_STORE: u32 = 130u;
const OP_MOV: u32 = 206u;
const OP_LD: u32 = 204u;
const OP_ST: u32 = 205u;
const OP_ADD: u32 = 142u;
const OP_SUB: u32 = 143u;
const OP_JZ: u32 = 209u;
const OP_JMP: u32 = 208u;
const OP_DRAW: u32 = 215u;
const OP_HALT: u32 = 141u;

// Windowing Opcodes
const OP_ADD_MEM: u32 = 216u;
const OP_SUB_MEM: u32 = 217u;
const OP_INT_DISPATCH: u32 = 218u;

// Bitwise Opcodes (for RISC-V emulation)
const OP_AND: u32 = 220u;      // memory[dst] = memory[dst] & p1 (as bits)
const OP_OR: u32 = 221u;       // memory[dst] = memory[dst] | p1
const OP_XOR: u32 = 222u;      // memory[dst] = memory[dst] ^ p1
const OP_NOT: u32 = 223u;      // memory[dst] = ~memory[dst]
const OP_SHL: u32 = 224u;      // memory[dst] = memory[dst] << p1
const OP_SHR: u32 = 225u;      // memory[dst] = memory[dst] >> p1 (logical)
const OP_SAR: u32 = 226u;      // memory[dst] = memory[dst] >> p1 (arithmetic)
const OP_AND_MEM: u32 = 227u;  // memory[dst] = memory[dst] & memory[p1]
const OP_OR_MEM: u32 = 228u;   // memory[dst] = memory[dst] | memory[p1]
const OP_XOR_MEM: u32 = 229u;  // memory[dst] = memory[dst] ^ memory[p1]
const OP_SHL_MEM: u32 = 230u;  // memory[dst] = memory[dst] << memory[p1]
const OP_SHR_MEM: u32 = 231u;  // memory[dst] = memory[dst] >> memory[p1]

// AI-Native Opcodes
const OP_SPAWN: u32 = 232u;    // Spawn new glyphs into program buffer

@compute @workgroup_size(1)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    if (state.halted != 0u) { return; }

    // FETCH
    let inst = program[state.pc];
    state.cycles = state.cycles + 1u;

    // DECODE & EXECUTE
    switch inst.opcode {
        case 128u: { // DATA
            memory[inst.dst] = inst.p1;
            state.pc = state.pc + 1u;
        }
        case 206u: { // MOV
            memory[inst.dst] = memory[u32(inst.p1)];
            state.pc = state.pc + 1u;
        }
        case 129u: { // LOAD
            memory[inst.dst] = memory[u32(inst.p1)];
            state.pc = state.pc + 1u;
        }
        case 130u: { // STORE
            memory[u32(inst.p1)] = memory[inst.dst];
            state.pc = state.pc + 1u;
        }
        case 142u: { // ADD
            memory[inst.dst] = memory[inst.dst] + inst.p1;
            state.pc = state.pc + 1u;
        }
        case 204u: { // LD - Load immediate value (p1) into memory[dst]
            memory[inst.dst] = inst.p1;
            state.pc = state.pc + 1u;
        }
        case 205u: { // ST - Store memory[dst] into memory[p1]
            memory[u32(inst.p1)] = memory[inst.dst];
            state.pc = state.pc + 1u;
        }
        case 216u: { // ADD_MEM
            memory[inst.dst] = memory[inst.dst] + memory[u32(inst.p1)];
            state.pc = state.pc + 1u;
        }
        case 217u: { // SUB_MEM
            memory[inst.dst] = memory[inst.dst] - memory[u32(inst.p1)];
            state.pc = state.pc + 1u;
        }
        case 218u: { // INT_DISPATCH - Hit-test mouse against region table
            // p1 = address of hit table (X, Y, W, H, ID)
            // p2 = hit mode (1 = point-in-rect)
            // dst = address to store hit result (1 = hit, 0 = miss)
            // Reads mouse position from memory[0] (MOUSE_X) and memory[1] (MOUSE_Y)
            // Also checks memory[2] (MOUSE_BTN) for click state
            let hit_table_addr = u32(inst.p1);
            let mouse_x = memory[0u];  // MOUSE_X
            let mouse_y = memory[1u];  // MOUSE_Y
            let mouse_btn = memory[2u]; // MOUSE_BTN

            let rect_x = memory[hit_table_addr];
            let rect_y = memory[hit_table_addr + 1u];
            let rect_w = memory[hit_table_addr + 2u];
            let rect_h = memory[hit_table_addr + 3u];

            let in_rect = mouse_x >= rect_x &&
                          mouse_x < rect_x + rect_w &&
                          mouse_y >= rect_y &&
                          mouse_y < rect_y + rect_h;

            // Hit = inside rect AND mouse button pressed
            memory[inst.dst] = select(0.0, 1.0, in_rect && mouse_btn > 0.0);
            state.pc = state.pc + 1u;
        }

        // === BITWISE OPERATIONS (for RISC-V emulation) ===
        // Note: memory stores floats, but we treat them as u32 bit patterns
        case 220u: { // AND - Bitwise AND with immediate
            let val = bitcast<u32>(memory[inst.dst]);
            let imm = u32(inst.p1);
            memory[inst.dst] = bitcast<f32>(val & imm);
            state.pc = state.pc + 1u;
        }
        case 221u: { // OR - Bitwise OR with immediate
            let val = bitcast<u32>(memory[inst.dst]);
            let imm = u32(inst.p1);
            memory[inst.dst] = bitcast<f32>(val | imm);
            state.pc = state.pc + 1u;
        }
        case 222u: { // XOR - Bitwise XOR with immediate
            let val = bitcast<u32>(memory[inst.dst]);
            let imm = u32(inst.p1);
            memory[inst.dst] = bitcast<f32>(val ^ imm);
            state.pc = state.pc + 1u;
        }
        case 223u: { // NOT - Bitwise NOT
            let val = bitcast<u32>(memory[inst.dst]);
            memory[inst.dst] = bitcast<f32>(~val);
            state.pc = state.pc + 1u;
        }
        case 224u: { // SHL - Shift left by immediate
            let val = bitcast<u32>(memory[inst.dst]);
            let shift = u32(inst.p1) & 31u;
            memory[inst.dst] = bitcast<f32>(val << shift);
            state.pc = state.pc + 1u;
        }
        case 225u: { // SHR - Shift right (logical) by immediate
            let val = bitcast<u32>(memory[inst.dst]);
            let shift = u32(inst.p1) & 31u;
            memory[inst.dst] = bitcast<f32>(val >> shift);
            state.pc = state.pc + 1u;
        }
        case 226u: { // SAR - Shift right (arithmetic) by immediate
            // Treat as signed, shift, preserve sign
            let val = bitcast<i32>(memory[inst.dst]);
            let shift = u32(inst.p1) & 31u;
            memory[inst.dst] = bitcast<f32>(val >> shift);
            state.pc = state.pc + 1u;
        }
        case 227u: { // AND_MEM - Bitwise AND with memory
            let val1 = bitcast<u32>(memory[inst.dst]);
            let val2 = bitcast<u32>(memory[u32(inst.p1)]);
            memory[inst.dst] = bitcast<f32>(val1 & val2);
            state.pc = state.pc + 1u;
        }
        case 228u: { // OR_MEM - Bitwise OR with memory
            let val1 = bitcast<u32>(memory[inst.dst]);
            let val2 = bitcast<u32>(memory[u32(inst.p1)]);
            memory[inst.dst] = bitcast<f32>(val1 | val2);
            state.pc = state.pc + 1u;
        }
        case 229u: { // XOR_MEM - Bitwise XOR with memory
            let val1 = bitcast<u32>(memory[inst.dst]);
            let val2 = bitcast<u32>(memory[u32(inst.p1)]);
            memory[inst.dst] = bitcast<f32>(val1 ^ val2);
            state.pc = state.pc + 1u;
        }
        case 230u: { // SHL_MEM - Shift left by memory value
            let val = bitcast<u32>(memory[inst.dst]);
            let shift = u32(memory[u32(inst.p1)]) & 31u;
            memory[inst.dst] = bitcast<f32>(val << shift);
            state.pc = state.pc + 1u;
        }
        case 231u: { // SHR_MEM - Shift right by memory value
            let val = bitcast<u32>(memory[inst.dst]);
            let shift = u32(memory[u32(inst.p1)]) & 31u;
            memory[inst.dst] = bitcast<f32>(val >> shift);
            state.pc = state.pc + 1u;
        }
        case 232u: { // SPATIAL_SPAWN - Write glyphs into program buffer
            let mode = u32(inst.p1);
            let src_addr = u32(inst.p2);
            let target = inst.dst;

            // Bounds check - silent no-op on failure
            if (target >= arrayLength(&program)) {
                state.pc = state.pc + 1u;
                return;
            }

            if (mode == 0u) {
                // Single glyph spawn
                program[target].opcode = u32(memory[src_addr]);
                program[target].stratum = u32(memory[src_addr + 1u]);
                program[target].p1 = memory[src_addr + 2u];
                program[target].p2 = memory[src_addr + 3u];
                program[target].dst = u32(memory[src_addr + 4u]);
            } else {
                // Block spawn - check bounds
                if (target + mode > arrayLength(&program)) {
                    state.pc = state.pc + 1u;
                    return;
                }
                for (var i: u32 = 0u; i < mode; i++) {
                    let src_offset = src_addr + i * 5u;
                    let dst_offset = target + i;
                    program[dst_offset].opcode = u32(memory[src_offset]);
                    program[dst_offset].stratum = u32(memory[src_offset + 1u]);
                    program[dst_offset].p1 = memory[src_offset + 2u];
                    program[dst_offset].p2 = memory[src_offset + 3u];
                    program[dst_offset].dst = u32(memory[src_offset + 4u]);
                }
            }
            state.pc = state.pc + 1u;
        }
        case 208u: { // JMP
            state.pc = u32(inst.p1);
        }
        case 209u: { // JZ
            if (memory[inst.dst] == 0.0) {
                state.pc = u32(inst.p1);
            } else {
                state.pc = state.pc + 1u;
            }
        }
        case 215u: { // DRAW (Simplified blit)
            let glyph_id = u32(inst.p1);
            let x = u32(memory[inst.dst]);
            let y = u32(memory[inst.dst + 1u]);
            
            // In a real implementation, this would loop over glyph pixels
            // For now, we blit a 16x16 block from the atlas
            let atlas_x = (glyph_id % 16u) * 128u;
            let atlas_y = (glyph_id / 16u) * 128u;
            
            for (var i: u32 = 0u; i < 16u; i = i + 1u) {
                for (var j: u32 = 0u; j < 16u; j = j + 1u) {
                    let texel = textureLoad(atlas, vec2<u32>(atlas_x + i, atlas_y + j), 0);
                    textureStore(screen, vec2<u32>(x + i, y + j), texel);
                }
            }
            state.pc = state.pc + 1u;
        }
        case 141u: { // HALT
            state.halted = 1u;
        }
        default: {
            state.pc = state.pc + 1u;
        }
    }

    // Safety: prevent infinite loops in one dispatch
    if (state.cycles > 1000000u) {
        state.halted = 1u;
    }
}
