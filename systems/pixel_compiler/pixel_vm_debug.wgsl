// geometry_os/systems/pixel_compiler/pixel_vm_debug.wgsl
// Enhanced Pixel VM with Visual Debugging Support

@group(0) @binding(0) var program_texture: texture_2d<f32>;
@group(0) @binding(1) var<storage, read_write> registers: array<f32>;
@group(0) @binding(2) var<storage, read_write> execution_trace: array<u32>;  // New: trace buffer
@group(0) @binding(3) var<storage, read_write> heatmap_buffer: array<vec4<f32>>;  // Heatmap as buffer

const OP_NOP: u32 = 0u;
const OP_LOAD: u32 = 10u;   // 0x0A
const OP_MOV: u32 = 11u;    // 0x0B
const OP_ADD: u32 = 100u;   // 0x64
const OP_MUL: u32 = 102u;   // 0x66
const OP_RET: u32 = 211u;   // 0xD3

struct TraceEntry {
    pc: u32,
    opcode: u32,
    dest: u32,
    src: u32,
    immediate: u32,
}

@compute @workgroup_size(1)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    var pc: u32 = 0u;
    var executing: bool = true;
    let max_instructions: u32 = 1000u;  // Increased for debugging
    var steps: u32 = 0u;
    var trace_index: u32 = 0u;

    let dims = textureDimensions(program_texture);
    let width = u32(dims.x);
    let height = u32(dims.y);

    loop {
        if (!executing || steps >= max_instructions) {
            break;
        }

        let x = i32(pc % width);
        let y = i32(pc / width);

        if (u32(y) >= height) {
            executing = false;
            break;
        }

        let pixel = textureLoad(program_texture, vec2<i32>(x, y), 0);

        let r = u32(pixel.r * 255.0 + 0.5);
        let g = u32(pixel.g * 255.0 + 0.5);
        let b = u32(pixel.b * 255.0 + 0.5);
        let a_u32 = u32(pixel.a * 255.0 + 0.5);
        let a = f32(a_u32);

        // Update heatmap: mark this instruction as executed
        let heatmap_index = pc * 4u;
        if (heatmap_index < arrayLength(&heatmap_buffer)) {
            heatmap_buffer[heatmap_index] = vec4<f32>(1.0, 0.0, 0.0, 1.0);  // Red for executed
        }

        // Write trace entry (if space available)
        if (trace_index < 10000u) {
            let base = trace_index * 5u;
            execution_trace[base] = pc;
            execution_trace[base + 1u] = r;
            execution_trace[base + 2u] = g;
            execution_trace[base + 3u] = b;
            execution_trace[base + 4u] = a_u32;
            trace_index += 1u;
        }

        // Execute (same as before)
        switch (r) {
            case OP_NOP: {}
            case OP_LOAD: {
                if (g < 256u) {
                    registers[g] = a;
                }
            }
            case OP_MOV: {
                if (g < 256u && b < 256u) {
                    registers[g] = registers[b];
                }
            }
            case OP_ADD: {
                if (g < 256u && b < 256u) {
                    registers[g] = registers[g] + registers[b];
                }
            }
            case OP_MUL: {
                if (g < 256u && b < 256u) {
                    registers[g] = registers[g] * registers[b];
                }
            }
            case OP_RET: {
                executing = false;
            }
            default: {}
        }

        pc = pc + 1u;
        steps = steps + 1u;
    }

    // Store final step count at end of trace
    execution_trace[49999u] = steps;
}
