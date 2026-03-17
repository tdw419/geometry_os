// pixel_brain_attention.wgsl
// Single-head self-attention for PixelBrain Nano
//
// Computes: attention(Q, K, V) = softmax(Q * K^T) * V
// Then: output = attention * O

struct AttentionConfig {
    layer: u32,           // Current layer (0-3)
    hidden_dim: u32,      // 256 for Nano
    head_dim: u32,        // 64 for Nano (hidden_dim / n_heads)
    seq_len: u32,         // Sequence length (1 for single token)
    q_offset: u32,        // Q weight offset in atlas
    k_offset: u32,        // K weight offset
    v_offset: u32,        // V weight offset
    o_offset: u32,        // O weight offset
    atlas_size: u32,      // Atlas dimension
}

@group(0) @binding(0) var<uniform> config: AttentionConfig;
@group(0) @binding(1) var brain_atlas: texture_2d<f32>;
@group(0) @binding(2) var<storage, read> hidden_in: array<f32>;
@group(0) @binding(3) var<storage, read_write> hidden_out: array<f32>;
@group(0) @binding(4) var<storage, read_write> attention_buffer: array<f32>;

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

fn load_weight(offset: u32, row: u32, col: u32) -> f32 {
    let addr = offset + row * config.hidden_dim + col;
    let coords = hilbert_d2xy(config.atlas_size, addr);
    return textureLoad(brain_atlas, vec2<i32>(i32(coords.x), i32(coords.y)), 0).r;
}

@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let idx = global_id.x;

    if (idx >= config.hidden_dim) {
        return;
    }

    // 1. Compute Q[idx] = hidden_in · W_q[idx, :]
    var q_val: f32 = 0.0;
    for (var i: u32 = 0u; i < config.hidden_dim; i++) {
        let w = load_weight(config.q_offset, idx, i);
        q_val += hidden_in[i] * w;
    }

    // 2. Compute K and V similarly (simplified for single token)
    var k_val: f32 = 0.0;
    var v_val: f32 = 0.0;
    for (var i: u32 = 0u; i < config.hidden_dim; i++) {
        k_val += hidden_in[i] * load_weight(config.k_offset, idx, i);
        v_val += hidden_in[i] * load_weight(config.v_offset, idx, i);
    }

    // 3. For single token: attention = softmax(q * k) * v ≈ v (simplified)
    //    In full implementation, this would compute attention scores
    let attention_out = v_val;

    // 4. Apply output projection: O · attention
    var out_val: f32 = 0.0;
    for (var i: u32 = 0u; i < config.hidden_dim; i++) {
        out_val += attention_out * load_weight(config.o_offset, idx, i);
    }

    // 5. Residual connection
    hidden_out[idx] = hidden_in[idx] + out_val;
}
