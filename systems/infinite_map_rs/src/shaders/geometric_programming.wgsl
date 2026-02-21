// Geometric Programming Shader
// Interprets code as a topological texture (4-byte RGBA pixel cluster)
// Red: Opcode (8 bits)
// Green: Register A / Source 1
// Blue: Register B / Source 2
// Alpha: Immediate / Flag / Metadata (Destination in GEOMETRIC_PROGRAMMING.md example)

struct GeometricState {
    regs: array<u32, 32>,
    pc: u32,
    halted: u32,
    flags: u32,
    cursor_x: u32,
    cursor_y: u32,
    fg: u32,
    bg: u32,
}

@group(0) @binding(0) var ram: texture_storage_2d<rgba8uint, read_write>;
@group(0) @binding(1) var<storage, read_write> state: GeometricState;

const OP_NOP: u32 = 0x00u;
const OP_MOV: u32 = 0x01u;
const OP_LDI: u32 = 0x08u;
const OP_ADD: u32 = 0x33u;
const OP_SUB: u32 = 0x34u;
const OP_MUL: u32 = 0x35u;
const OP_DIV: u32 = 0x36u;
const OP_JMP: u32 = 0x06u;
const OP_HALT: u32 = 0x07u;

// Terminal Opcodes (0x40-0x4F)
const OP_PUTC: u32 = 0x40u;
const OP_MVCR: u32 = 0x41u;
const OP_SCRL: u32 = 0x42u;
const OP_CLR: u32 = 0x43u;
const OP_SETFG: u32 = 0x44u;
const OP_SETBG: u32 = 0x45u;

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
    if (global_id.x > 0u || state.halted != 0u) {
        return;
    }

    let grid_size = 256u;
    let coords = d2xy(grid_size, state.pc);
    
    let pixel = textureLoad(ram, vec2<i32>(i32(coords.x), i32(coords.y)));
    
    let opcode = pixel.r;
    let rs1 = pixel.g;
    let rs2 = pixel.b;
    let rd = pixel.a;

    // Execute
    if (opcode == OP_ADD) {
        if (rd < 32u && rs1 < 32u && rs2 < 32u) {
            state.regs[rd] = state.regs[rs1] + state.regs[rs2];
        }
        state.pc = state.pc + 1u;
    } else if (opcode == OP_MOV) {
        if (rd < 32u && rs1 < 32u) {
            state.regs[rd] = state.regs[rs1];
        }
        state.pc = state.pc + 1u;
    } else if (opcode == OP_LDI) {
        if (rd < 32u) {
            state.regs[rd] = rs1; // rs1 is immediate in v3 spec
        }
        state.pc = state.pc + 1u;
    } else if (opcode == OP_SUB) {
        if (rd < 32u && rs1 < 32u && rs2 < 32u) {
            state.regs[rd] = state.regs[rs1] - state.regs[rs2];
        }
        state.pc = state.pc + 1u;
    } else if (opcode == OP_HALT) {
        state.halted = 1u;
    } else if (opcode == OP_JMP) {
        if (rs1 < 32u) {
            state.pc = state.regs[rs1];
        } else {
            state.pc = state.pc + 1u;
        }
    } 
    // Terminal Instructions
    else if (opcode == OP_PUTC) {
        // PUTC r1, r2 (r1=char, r2=pos) or use current cursor
        let char = rs1; // For now, assume RS1 contains the ASCII
        let target_coords = d2xy(grid_size, state.cursor_y * 80u + state.cursor_x + 1000u); // Offset by 1000 for terminal region
        textureStore(ram, vec2<i32>(target_coords), vec4<u32>(char, state.fg, state.bg, 0u));
        state.cursor_x = state.cursor_x + 1u;
        if (state.cursor_x >= 80u) {
            state.cursor_x = 0u;
            state.cursor_y = state.cursor_y + 1u;
        }
        state.pc = state.pc + 1u;
    } else if (opcode == OP_MVCR) {
        state.cursor_x = rs1;
        state.cursor_y = rs2;
        state.pc = state.pc + 1u;
    } else if (opcode == OP_SETFG) {
        state.fg = rs1;
        state.pc = state.pc + 1u;
    } else if (opcode == OP_SETBG) {
        state.bg = rs1;
        state.pc = state.pc + 1u;
    } else if (opcode == OP_CLR) {
        // CLR would need a loop or multiple passes, but for now just reset cursor
        state.cursor_x = 0u;
        state.cursor_y = 0u;
        state.pc = state.pc + 1u;
    }
    else {
        state.pc = state.pc + 1u;
    }
}
