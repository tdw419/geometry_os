// ============================================
// HEBBIAN UPDATE - Parallel Weight Learning
// ============================================
// Implements Hebbian learning rule on GPU using Hilbert-curve memory mapping.
// Processes 256 weight updates per dispatch for efficient batch processing.
//
// Hebbian Rule: Δw = η × pre × post × reward
// "Neurons that fire together, wire together"

// --- Constants & Bindings ---

/// Hebbian update request from training pipeline
struct HebbianUpdate {
    address: u32,          // Hilbert distance in brain atlas
    pre_activation: f32,   // Pre-synaptic neuron activation
    post_activation: f32,  // Post-synaptic neuron activation
    reward: f32,           // Reward signal (positive strengthens, negative weakens)
}

/// Uniforms for shader configuration
struct HebbianUniforms {
    atlas_size: u32,       // Width/height of brain atlas (power of 2)
    learning_rate: f32,    // Learning rate (η)
    weight_decay: f32,     // Optional weight decay for regularization
    _padding: u32,
}

@group(0) @binding(0) var<storage, read> pending_updates: array<HebbianUpdate>;
@group(0) @binding(1) var brain_atlas: texture_storage_2d<rgba16float, read_write>;
@group(0) @binding(2) var<uniform> uniforms: HebbianUniforms;

// --- Hilbert Curve Math ---
// Maps linear distance to (x, y) coordinates preserving locality.
// Essential for accessing neural weights stored in 2D texture.

fn hilbert_rot(n: u32, x: ptr<function, u32>, y: ptr<function, u32>, rx: u32, ry: u32) {
    if (ry == 0u) {
        if (rx == 1u) {
            *x = n - 1u - *x;
            *y = n - 1u - *y;
        }
        // Swap x and y
        let t = *x;
        *x = *y;
        *y = t;
    }
}

/// Convert Hilbert distance to (x, y) coordinates
fn hilbert_d2xy(n: u32, d: u32) -> vec2<u32> {
    var x: u32 = 0u;
    var y: u32 = 0u;
    var s: u32 = 1u;
    var t: u32 = d;

    // Iterate based on bits. Max texture size 4096 (2^12) -> 12 iterations needed.
    // Use 16 iterations for safety margin.
    for (var i = 0u; i < 16u; i = i + 1u) {
        if (s >= n) { break; }

        let rx = 1u & (t / 2u);
        let ry = 1u & (t ^ rx);
        hilbert_rot(s, &x, &y, rx, ry);
        x = x + s * rx;
        y = y + s * ry;
        t = t / 4u;
        s = s * 2u;
    }

    return vec2<u32>(x, y);
}

// --- Main Hebbian Update Kernel ---

@compute @workgroup_size(256)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let idx = global_id.x;

    // Load the update request
    let update = pending_updates[idx];

    // Skip padding entries (zero address with zero reward indicates unused slot)
    if (update.address == 0u && update.reward == 0.0) {
        return;
    }

    // Validate address is within atlas bounds
    let max_addr = uniforms.atlas_size * uniforms.atlas_size;
    if (update.address >= max_addr) {
        return;
    }

    // Convert Hilbert distance to texture coordinates
    let coords = hilbert_d2xy(uniforms.atlas_size, update.address);
    let x = coords.x;
    let y = coords.y;

    // Bounds check (should not be needed if address validated, but safety first)
    if (x >= uniforms.atlas_size || y >= uniforms.atlas_size) {
        return;
    }

    // Load current weight from brain atlas
    // R channel stores the weight value (Float16 stored in R channel)
    let current_pixel = textureLoad(brain_atlas, vec2<i32>(i32(x), i32(y)));
    let current_weight = current_pixel.r;

    // Hebbian learning rule: Δw = η × pre × post × reward
    // - pre_activation: how strongly the input neuron fired
    // - post_activation: how strongly the output neuron fired
    // - reward: reinforcement signal (positive = strengthen, negative = weaken)
    let delta_w = uniforms.learning_rate * update.pre_activation * update.post_activation * update.reward;

    // Apply optional weight decay (L2 regularization)
    let decayed_weight = current_weight * (1.0 - uniforms.weight_decay);

    // Compute new weight
    var new_weight = decayed_weight + delta_w;

    // Clamp weight to prevent explosion (keep in reasonable range for Float16)
    new_weight = clamp(new_weight, -10.0, 10.0);

    // Write updated weight back to atlas
    // Preserve other channels (G, B, A) which may store metadata
    var out_pixel = current_pixel;
    out_pixel.r = new_weight;
    textureStore(brain_atlas, vec2<i32>(i32(x), i32(y)), out_pixel);
}
