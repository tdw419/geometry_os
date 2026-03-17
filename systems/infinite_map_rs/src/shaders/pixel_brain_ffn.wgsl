// pixel_brain_ffn.wgsl
// Feed-forward network: hidden → expand → ReLU → contract → hidden
//
// FFN(x) = ReLU(x · W_up + b_up) · W_down + b_down
// output = x + FFN(x)  (residual connection)

struct FFNConfig {
    layer: u32,           // Current layer (0-3)
    hidden_dim: u32,      // 256 for Nano
    ffn_dim: u32,         // 1024 for Nano (4x hidden_dim)
    up_offset: u32,       // Up projection weights offset
    down_offset: u32,     // Down projection weights offset
    atlas_size: u32,      // Atlas dimension
    _padding: u32,        // Alignment padding
}

@group(0) @binding(0) var<uniform> config: FFNConfig;
@group(0) @binding(1) var brain_atlas: texture_2d<f32>;
@group(0) @binding(2) var<storage, read> hidden_in: array<f32>;
@group(0) @binding(3) var<storage, read_write> hidden_out: array<f32>;
@group(0) @binding(4) var<storage, read_write> ffn_buffer: array<f32>;

fn hilbert_d2xy(n: u32, d: u32) -> vec2<u32> {
    var x: u32 = 0u;
    var y: u32 = 0u;
    var s: u32 = 1u;
    var rx: u32 = 0u;
    var ry: u32 = 0u;
    var t: u32 = d;

    while (s < n) {
        ry = (t >> 1u) & 1u;
        rx = (t ^ ry) & 1u;

        if (ry == 0u) {
            if (rx == 1u) {
                x = s - 1u - x;
                y = s - 1u - y;
            }
            let tmp = x;
            x = y;
            y = tmp;
        }

        x += s * rx;
        y += s * ry;
        t >>= 2u;
        s <<= 1u;
    }

    return vec2<u32>(x, y);
}

fn load_weight(offset: u32, row: u32, col: u32, stride: u32) -> f32 {
    let addr = offset + row * stride + col;
    let coords = hilbert_d2xy(config.atlas_size, addr);
    return textureLoad(brain_atlas, vec2<i32>(i32(coords.x), i32(coords.y)), 0i).r;
}

fn relu(x: f32) -> f32 {
    return max(0.0, x);
}

@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let idx = global_id.x;

    if (idx >= config.hidden_dim) {
        return;
    }

    // 1. Up projection: ffn_buffer = hidden_in · W_up
    //    Each thread computes one output of the up projection
    //    Note: This is simplified - in practice we'd dispatch differently

    // For thread idx, compute contribution to all ffn_dim outputs
    var down_input: f32 = 0.0;

    for (var j: u32 = 0u; j < config.ffn_dim; j++) {
        // Up projection
        var up_val: f32 = 0.0;
        for (var i: u32 = 0u; i < config.hidden_dim; i++) {
            up_val += hidden_in[i] * load_weight(config.up_offset, j, i, config.hidden_dim);
        }

        // ReLU activation
        let activated = relu(up_val);

        // Accumulate down projection for this output element
        down_input += activated * load_weight(config.down_offset, idx, j, config.ffn_dim);
    }

    // 2. Residual connection
    hidden_out[idx] = hidden_in[idx] + down_input;
}
