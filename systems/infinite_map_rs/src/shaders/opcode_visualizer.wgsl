// Opcode Visualizer Shader
// Maps RAM texture opcodes to semantic colors for visual debugging.
// Each opcode has a unique color so you can "see" programs in memory.

@group(0) @binding(0) var ram: texture_storage_2d<rgba8uint, read>;
@group(0) @binding(1) var output_tex: texture_storage_2d<rgba8unorm, write>;

// Opcode color mapping
fn opcode_to_color(opcode: u32) -> vec4<f32> {
    // Semantic colors for each opcode
    switch (opcode) {
        // Logic Stratum (0-15)
        case 0u: { return vec4<f32>(0.2, 0.2, 0.2, 1.0); }  // NOP - Dark gray
        case 1u: { return vec4<f32>(0.0, 1.0, 1.0, 1.0); }  // ALLOC/LDI - Cyan
        case 2u: { return vec4<f32>(0.5, 0.5, 0.5, 1.0); }  // FREE/MOV - Gray
        case 3u: { return vec4<f32>(1.0, 1.0, 0.0, 1.0); }  // LOAD - Yellow
        case 4u: { return vec4<f32>(1.0, 0.0, 0.0, 1.0); }  // STORE - Red
        case 5u: { return vec4<f32>(0.0, 1.0, 0.0, 1.0); }  // ADD - Green
        case 6u: { return vec4<f32>(0.0, 0.8, 0.4, 1.0); }  // SUB - Sea green
        case 7u: { return vec4<f32>(1.0, 0.5, 0.0, 1.0); }  // MUL - Orange
        case 8u: { return vec4<f32>(0.8, 0.4, 0.0, 1.0); }  // DIV - Brown
        case 9u: { return vec4<f32>(0.5, 0.0, 0.5, 1.0); }  // JMP - Purple
        case 10u: { return vec4<f32>(0.8, 0.0, 0.8, 1.0); } // BRANCH - Magenta
        case 11u: { return vec4<f32>(0.0, 0.5, 0.8, 1.0); } // CALL - Sky blue
        case 12u: { return vec4<f32>(0.3, 0.6, 0.8, 1.0); } // RETURN - Light blue
        case 13u: { return vec4<f32>(1.0, 1.0, 1.0, 1.0); } // HALT - White
        case 14u: { return vec4<f32>(0.6, 0.6, 0.0, 1.0); } // DATA - Olive
        case 15u: { return vec4<f32>(0.4, 0.8, 0.8, 1.0); } // LOOP - Teal

        // Bitwise Stratum (128+)
        case 128u: { return vec4<f32>(0.0, 0.8, 0.8, 1.0); } // AND
        case 129u: { return vec4<f32>(0.8, 0.8, 0.0, 1.0); } // OR
        case 130u: { return vec4<f32>(0.8, 0.0, 0.8, 1.0); } // XOR
        case 131u: { return vec4<f32>(0.0, 0.0, 0.8, 1.0); } // SHL
        case 132u: { return vec4<f32>(0.8, 0.0, 0.0, 1.0); } // SHR

        default: {
            // Unknown opcode - show as dim blue
            return vec4<f32>(0.1, 0.1, 0.3, 1.0);
        }
    }
}

// Hilbert curve - convert 1D address to 2D coordinate
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

@compute @workgroup_size(16, 16)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let dims = textureDimensions(ram);
    let x = global_id.x;
    let y = global_id.y;

    if (x >= dims.x || y >= dims.y) {
        return;
    }

    // Read pixel from RAM texture
    let pixel = textureLoad(ram, vec2<i32>(i32(x), i32(y)));
    let opcode = pixel.r;  // R channel contains opcode

    // Convert opcode to color
    let color = opcode_to_color(opcode);

    // Write to output texture
    textureStore(output_tex, vec2<i32>(i32(x), i32(y)), color);
}
