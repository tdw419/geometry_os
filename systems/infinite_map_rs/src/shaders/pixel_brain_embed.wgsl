// pixel_brain_embed.wgsl
// Token ID → Hidden state via embedding lookup
//
// This shader looks up the embedding vector for a token ID
// from the brain atlas and stores it in the hidden state buffer.

struct EmbedConfig {
    token_id: u32,        // Input token to embed
    hidden_dim: u32,      // Dimension of hidden state (256 for Nano)
    embed_offset: u32,    // Where embeddings start in atlas
    atlas_size: u32,      // Atlas dimension (4096)
}

@group(0) @binding(0) var<uniform> config: EmbedConfig;
@group(0) @binding(1) var brain_atlas: texture_2d<f32>;
@group(0) @binding(2) var<storage, read_write> hidden_state: array<f32>;

// Hilbert curve: convert distance to (x, y)
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

        // Rotate
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

@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let idx = global_id.x;

    // Bounds check
    if (idx >= config.hidden_dim) {
        return;
    }

    // Calculate address in atlas: embed_offset + token_id * hidden_dim + idx
    let addr = config.embed_offset + config.token_id * config.hidden_dim + idx;

    // Convert to texture coordinates
    let coords = hilbert_d2xy(config.atlas_size, addr);

    // Load embedding weight from brain atlas
    let weight = textureLoad(brain_atlas, vec2<i32>(i32(coords.x), i32(coords.y)), 0).r;

    // Store to hidden state buffer
    hidden_state[idx] = weight;
}
