// Glyph VM - Native Geometry OS Execution Layer
// Executes Glyph Stratum programs directly on the GPU.
// Bypasses Python/Rust interpreters for bare-metal morphological computation.

struct GlyphState {
    regs: array<u32, 32>,
    pc: u32,
    halted: u32,
    stratum: u32,
    cycles: u32,
    stack_ptr: u32,
    stack: array<u32, 64>,
}

@group(0) @binding(0) var ram: texture_storage_2d<rgba8uint, read_write>;
@group(0) @binding(1) var<storage, read_write> state: GlyphState;

struct KeyEventEntry {
    code: u32,
    state: u32,
    mods: u32,
    timestamp: u32,
}

struct InputBusHeader {
    magic: u32,
    mouse_x: f32,
    mouse_y: f32,
    mouse_btn: u32,
    kb_head: u32,
    kb_tail: u32,
    kb_cap: u32,
    _pad: u32,
}

@group(0) @binding(9) var<storage, read_write> vib: array<u32>; // Dynamic size, Header + FIFO

const REG_INPUT_CHAR: u32 = 29u;
const REG_INPUT_PENDING: u32 = 30u;

fn poll_input_bus() {
    // VIB Header is first 8 u32s (32 bytes)
    let kb_head = vib[4];
    let kb_tail = vib[5];
    let kb_cap = vib[6];

    if (kb_head != kb_tail) {
        // Pull one event from FIFO
        let entry_idx = 8u + (kb_tail % kb_cap) * 4u;
        let code = vib[entry_idx];
        let event_state = vib[entry_idx + 1u];
        
        if (event_state == 1u) { // Key Down
            state.regs[REG_INPUT_CHAR] = code;
            state.regs[REG_INPUT_PENDING] = 1u;
        }
        
        // Advance tail
        vib[5] = (kb_tail + 1u);
    }
}

// Opcodes (0-15) - Logic Stratum
const OP_NOP: u32    = 0u;
const OP_ALLOC: u32  = 1u;
const OP_FREE: u32   = 2u;
const OP_LOAD: u32   = 3u;
const OP_STORE: u32  = 4u;
const OP_ADD: u32    = 5u;
const OP_SUB: u32    = 6u;
const OP_MUL: u32    = 7u;
const OP_DIV: u32    = 8u;
const OP_JMP: u32    = 9u;
const OP_BRANCH: u32 = 10u;
const OP_CALL: u32   = 11u;
const OP_RETURN: u32 = 12u;
const OP_HALT: u32   = 13u;
const OP_DATA: u32   = 14u;
const OP_LOOP: u32   = 15u;

// AI-Native / Substrate Opcodes (220-227)
const OP_SPATIAL_SPAWN: u32 = 225u;
const OP_GLYPH_MUTATE: u32  = 226u;

// Strata
const STRATUM_SUBSTRATE: u32 = 0u;
const STRATUM_MEMORY: u32    = 1u;
const STRATUM_LOGIC: u32     = 2u;
const STRATUM_SPEC: u32      = 3u;
const STRATUM_INTENT: u32    = 4u;

// Hilbert curve helper (d to xy)
fn d2xy(n: u32, d_in: u32) -> vec2<u32> {
    var x = 0u;
    var y = 0u;
    var s = 1u;
    var d = d_in;
    while (s < n) {
        let rx = 1u & (d / 2u);
        let ry = 1u & (d ^ rx);
        if (ry == 0u) {
            if (rx == 1u) {
                x = s - 1u - x;
                y = s - 1u - y;
            }
            let t = x;
            x = y;
            y = t;
        }
        x += s * rx;
        y += s * ry;
        d /= 4u;
        s *= 2u;
    }
    return vec2<u32>(x, y);
}

@compute @workgroup_size(1)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    // Only thread 0 executes for this VM instance
    if (global_id.x > 0u || state.halted != 0u) {
        return;
    }

    // Process VIB events before execution
    poll_input_bus();

    let grid_size = 4096u; // Standard .rts.png dimension
    let coords = d2xy(grid_size, state.pc);
    
    // Fetch Glyph: RGBA = (Unicode/Opcode, Stratum, P1, P2)
    let glyph = textureLoad(ram, vec2<i32>(i32(coords.x), i32(coords.y)));
    
    // Normalize opcode: Opcode is often stored as Unicode 200 + ID
    var opcode = glyph.r;
    if (opcode >= 200u) {
        opcode = opcode - 200u;
    }
    
    let stratum = glyph.g;
    let p1 = glyph.b; // Register Source 1 / Address
    let p2 = glyph.a; // Register Source 2 / Value / Offset / Destination

    // Execution Loop Logic
    state.cycles = state.cycles + 1u;

    switch (opcode) {
        case OP_NOP: {
            state.pc = state.pc + 1u;
        }
        case OP_ADD: {
            // regs[p2] = regs[p1] + regs[p2] (simplified)
            if (p1 < 32u && p2 < 32u) {
                state.regs[p2] = state.regs[p1] + state.regs[p2];
            }
            state.pc = state.pc + 1u;
        }
        case OP_SUB: {
            if (p1 < 32u && p2 < 32u) {
                state.regs[p2] = state.regs[p1] - state.regs[p2];
            }
            state.pc = state.pc + 1u;
        }
        case OP_MUL: {
            if (p1 < 32u && p2 < 32u) {
                state.regs[p2] = state.regs[p1] * state.regs[p2];
            }
            state.pc = state.pc + 1u;
        }
        case OP_DIV: {
            if (p1 < 32u && p2 < 32u && state.regs[p2] != 0u) {
                state.regs[p2] = state.regs[p1] / state.regs[p2];
            }
            state.pc = state.pc + 1u;
        }
        case OP_LOAD: {
            // Load from memory (texture) into register
            // regs[p2] = ram[regs[p1]]
            let addr_coords = d2xy(grid_size, state.regs[p1]);
            let val = textureLoad(ram, vec2<i32>(i32(addr_coords.x), i32(addr_coords.y)));
            state.regs[p2] = val.r; // For now just load the Red channel (data)
            state.pc = state.pc + 1u;
        }
        case OP_STORE: {
            // Store register value to memory (texture)
            // ram[regs[p1]] = regs[p2]
            let addr_coords = d2xy(grid_size, state.regs[p1]);
            textureStore(ram, vec2<i32>(i32(addr_coords.x), i32(addr_coords.y)), vec4<u32>(state.regs[p2], STRATUM_MEMORY, 0u, 255u));
            state.pc = state.pc + 1u;
        }
        case OP_JMP: {
            // Jump to register address or immediate
            state.pc = state.regs[p1];
        }
        case OP_BRANCH: {
            // If regs[p1] == 0, jump to regs[p2]
            if (state.regs[p1] == 0u) {
                state.pc = state.regs[p2];
            } else {
                state.pc = state.pc + 1u;
            }
        }
        case OP_CALL: {
            // Push PC to stack, jump to regs[p1]
            if (state.stack_ptr < 64u) {
                state.stack[state.stack_ptr] = state.pc + 1u;
                state.stack_ptr = state.stack_ptr + 1u;
                state.pc = state.regs[p1];
            } else {
                state.halted = 2u; // Stack Overflow
            }
        }
        case OP_RETURN: {
            if (state.stack_ptr > 0u) {
                state.stack_ptr = state.stack_ptr - 1u;
                state.pc = state.stack[state.stack_ptr];
            } else {
                state.halted = 3u; // Stack Underflow
            }
        }
        case OP_HALT: {
            state.halted = 1u;
        }
        case OP_SPATIAL_SPAWN: {
            // Create a new VM at spatial coordinates defined by regs[p1]
            // For now, this is a conceptual placeholder as spawning new threads
            // from within a compute shader requires indirect dispatch or pre-allocated slots.
            state.pc = state.pc + 1u;
        }
        case OP_GLYPH_MUTATE: {
            // Self-modify: Change the glyph atregs[p1] to regs[p2]
            let addr_coords = d2xy(grid_size, state.regs[p1]);
            textureStore(ram, vec2<i32>(i32(addr_coords.x), i32(addr_coords.y)), vec4<u32>(state.regs[p2], stratum, 0u, 255u));
            state.pc = state.pc + 1u;
        }
        default: {
            state.pc = state.pc + 1u;
        }
    }
}
