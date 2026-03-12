/// Glyph Microcode Bootloader (v2) - Hilbert Spatial Edition
/// Target: < 100 lines, robust Fetch-Decode-Execute

struct Glyph { opcode: u32, stratum: u32, p1: f32, p2: f32, target: u32 };
struct State { pc: u32, sp: u32, flags: u32, halted: u32, cycles: u32 };

@group(0) @binding(0) var<storage, read> program: array<Glyph>;
@group(0) @binding(1) var<storage, read_write> state: State;
@group(0) @binding(2) var<storage, read_write> memory: array<f32>;
@group(0) @binding(3) var<storage, read_write> stack: array<u32>;
@group(0) @binding(4) var atlas: texture_2d<f32>;
@group(0) @binding(5) var screen: texture_storage_2d<rgba8unorm, write>;

fn hilbert_xy(id: u32) -> vec2<u32> {
    var x = 0u; var y = 0u; var t = id; var s = 1u;
    let n = 16u; // 1024x1024 atlas with 64x64 cells
    while (s < n) {
        let rx = 1u & (t / 2u);
        let ry = 1u & (t ^ rx);
        if (ry == 0u) {
            if (rx == 1u) { x = s - 1u - x; y = s - 1u - y; }
            let tmp = x; x = y; y = tmp;
        }
        x += s * rx; y += s * ry; t /= 4u; s *= 2u;
    }
    return vec2<u32>(x, y);
}

@compute @workgroup_size(1)
fn main(@builtin(global_invocation_id) gid: vec3<u32>) {
    if (gid.x != 0u || state.halted != 0u) { return; }

    let glyph = program[state.pc];
    state.pc += 1u;
    state.cycles += 1u;

    switch (glyph.opcode) {
        case 200u: { memory[glyph.target] = glyph.p1 + glyph.p2; } // ADD_M
        case 201u: { memory[glyph.target] = glyph.p1 - glyph.p2; } // SUB_M
        case 202u: { memory[glyph.target] = glyph.p1 * glyph.p2; } // MUL_M
        case 203u: { if (glyph.p2 != 0.0) { memory[glyph.target] = glyph.p1 / glyph.p2; } }
        case 204u: { memory[glyph.target] = memory[u32(glyph.p1)]; } // LD
        case 205u: { memory[u32(glyph.p1)] = glyph.p2; } // ST
        case 206u: { memory[glyph.target] = glyph.p1; } // MOV
        case 207u: { memory[glyph.target] = 0.0; } // CLR
        case 208u: { state.pc = u32(glyph.p1); } // JMP
        case 209u: { if (memory[glyph.target] == 0.0) { state.pc = u32(glyph.p1); } } // JZ
        case 210u: { stack[state.sp] = state.pc; state.sp += 1u; state.pc = u32(glyph.p1); } // CALL
        case 211u: { state.sp -= 1u; state.pc = stack[state.sp]; } // RET
        case 212u: { state.halted = 1u; } // HALT
        case 216u: { memory[glyph.target] = memory[u32(glyph.p1)] + memory[u32(glyph.p2)]; } // ADD_MEM
        case 217u: { memory[glyph.target] = memory[u32(glyph.p1)] - memory[u32(glyph.p2)]; } // SUB_MEM
        case 215u: { // DRAW (Spatial Blit)
            let src_cell = hilbert_xy(u32(glyph.p1));
            let dst_pos = vec2<u32>(u32(glyph.p2), glyph.target);
            for (var row = 0u; row < 64u; row++) {
                for (var col = 0u; col < 64u; col++) {
                    let texel = textureLoad(atlas, src_cell * 64u + vec2<u32>(col, row), 0);
                    textureStore(screen, dst_pos + vec2<u32>(col, row), texel);
                }
            }
        }
        case 218u: { // INT_DISPATCH (Hit Testing)
            let mouse_x = memory[0]; // MOUSE_X
            let mouse_y = memory[1]; // MOUSE_Y
            let mouse_btn = memory[2]; // MOUSE_BTN
            
            let table_start = u32(glyph.p1);
            let num_entries = u32(glyph.p2);
            var hit_id = 0.0;
            
            if (mouse_btn > 0.0) {
                for (var i = 0u; i < num_entries; i++) {
                    let base = table_start + i * 5u;
                    let win_x = memory[base];
                    let win_y = memory[base + 1u];
                    let win_w = memory[base + 2u];
                    let win_h = memory[base + 3u];
                    if (mouse_x >= win_x && mouse_x <= win_x + win_w &&
                        mouse_y >= win_y && mouse_y <= win_y + win_h) {
                        hit_id = memory[base + 4u];
                    }
                }
            }
            memory[glyph.target] = hit_id;
        }
        default: { }
    }

    if (state.cycles > 1000u) { state.halted = 1u; }
}
