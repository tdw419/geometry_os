// attention_blend.wgsl
// Blends attention patterns from multiple PixelBrains into shared attention region
//
// This shader enables inter-brain communication by:
// 1. Reading attention patterns from each brain's region
// 2. Blending them based on focus and blend factor
// 3. Writing the blended attention to shared region

struct SharedAttentionConfig {
    atlas_size: u32,
    num_brains: u32,
    attention_dim: u32,
    focus_brain: u32,
    blend_factor: f32,
}

@group(0) @binding(0) var<uniform> config: SharedAttentionConfig;
@group(0) @binding(1) var brain1_atlas: texture_2d<f32>;
@group(0) @binding(2) var brain2_atlas: texture_2d<f32>;
@group(0) @binding(3) var shared_attention: texture_storage_2d<rgba16float, write>;

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

// Load attention weight from brain atlas at given offset
fn load_attention_weight(atlas: texture_2d<f32>, offset: u32, idx: u32, atlas_size: u32) -> f32 {
    let addr = offset + idx;
    let coords = hilbert_d2xy(atlas_size, addr);
    return textureLoad(atlas, vec2<i32>(i32(coords.x), i32(coords.y)), 0i).r;
}

// Store attention weight to shared attention region
fn store_attention_weight(weight: f32, addr: u32, atlas_size: u32) {
    let coords = hilbert_d2xy(atlas_size, addr);
    // RGBA16Float encoding: R=G=weight, B=access_count, A=saliency
    let encoded = vec4<f32>(weight, 1.0, 1.0, 0.5);
    textureStore(shared_attention, vec2<i32>(i32(coords.x), i32(coords.y)), encoded);
}

@compute @workgroup_size(256)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let idx = global_id.x;

    // Bounds check
    if (idx >= config.attention_dim) {
        return;
    }

    // Calculate addresses in each brain's region
    // Brain 1: (0, 0) - 2047, 2047
    // Brain 2: (2048, 0) - 4095, 2047
    // Shared Attention: (0, 2048) - 2047, 4095

    let brain1_offset = idx; // 0 to config.attention_dim - 1
    let brain2_offset = config.atlas_size * config.atlas_size + idx;
    let shared_offset = config.atlas_size * config.atlas_size + idx;

    // Load attention from both brain
    let attn1 = load_attention_weight(brain1_atlas, brain1_offset, idx, config.atlas_size);
    let attn2 = load_attention_weight(brain2_atlas, brain2_offset, idx, config.atlas_size);

    // Blend based on focus
    let blend = config.blend_factor;
    let focus_weight: f32;

    // If this brain is in focus, give it more weight to its attention
    if (config.focus_brain == 0u) {
        focus_weight = attn1 * (1.0 + blend) + attn2 * blend;
    } else {
        focus_weight = attn2 * blend + attn1 * (1.0 + blend);
    }

    // Store blended attention
    store_attention_weight(focus_weight, shared_offset, idx, config.atlas_size);
}
