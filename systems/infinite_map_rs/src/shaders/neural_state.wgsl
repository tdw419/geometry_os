// src/shaders/neural_state.wgsl
// Neural State Visualization Shader
// Renders neural network activations, attention weights, and memory patterns

struct NeuralUniforms {
    screen_pos: vec2<f32>,
    screen_size: vec2<f32>,
    texture_size: vec2<f32>,
    time: f32,
    mode: u32,  // 0=Heatmap, 1=AttentionFlow, 2=MemoryPattern, 3=MultiChannel
    brightness: f32,
    contrast: f32,
    show_grid: u32,
    grid_size: f32,
};

@group(0) @binding(0)
var neural_texture: texture_2d<f32>;

@group(0) @binding(1)
var neural_sampler: sampler;

struct VertexOutput {
    @builtin(position) position: vec4<f32>,
    @location(0) uv: vec2<f32>,
    @location(1) screen_pos: vec2<f32>,
};

@vertex
fn vs_main(@builtin(vertex_index) vertex_index: u32) -> VertexOutput {
    var out: VertexOutput;
    
    // Full-screen quad
    var positions = array<vec2<f32>, 6>(
        vec2<f32>(-1.0, -1.0),
        vec2<f32>(1.0, -1.0),
        vec2<f32>(-1.0, 1.0),
        vec2<f32>(-1.0, 1.0),
        vec2<f32>(1.0, -1.0),
        vec2<f32>(1.0, 1.0)
    );
    
    var uvs = array<vec2<f32>, 6>(
        vec2<f32>(0.0, 1.0),
        vec2<f32>(1.0, 1.0),
        vec2<f32>(0.0, 0.0),
        vec2<f32>(0.0, 0.0),
        vec2<f32>(1.0, 1.0),
        vec2<f32>(1.0, 0.0)
    );
    
    let pos = positions[vertex_index];
    out.position = vec4<f32>(pos, 0.0, 1.0);
    out.uv = uvs[vertex_index];
    out.screen_pos = pos;
    
    return out;
}

// Heatmap color gradient: blue -> cyan -> green -> yellow -> red
fn heatmap_color(value: f32) -> vec3<f32> {
    let clamped_value = clamp(value, 0.0, 1.0);
    
    if (clamped_value < 0.25) {
        // Blue to cyan
        let t = clamped_value / 0.25;
        return vec3<f32>(0.0, t, 1.0);
    } else if (clamped_value < 0.5) {
        // Cyan to green
        let t = (clamped_value - 0.25) / 0.25;
        return vec3<f32>(0.0, 1.0, 1.0 - t);
    } else if (clamped_value < 0.75) {
        // Green to yellow
        let t = (clamped_value - 0.5) / 0.25;
        return vec3<f32>(t, 1.0, 0.0);
    } else {
        // Yellow to red
        let t = (clamped_value - 0.75) / 0.25;
        return vec3<f32>(1.0, 1.0 - t, 0.0);
    }
}

// Apply brightness and contrast
fn apply_color_correction(color: vec3<f32>, brightness: f32, contrast: f32) -> vec3<f32> {
    let adjusted = (color - 0.5) * contrast + 0.5;
    return adjusted * brightness;
}

// Draw grid lines
fn draw_grid(screen_pos: vec2<f32>, grid_size: f32, line_width: f32) -> f32 {
    let grid_x = abs(fract(screen_pos.x / grid_size) - 0.5) * grid_size;
    let grid_y = abs(fract(screen_pos.y / grid_size) - 0.5) * grid_size;
    let line_x = smoothstep(line_width, 0.0, grid_x);
    let line_y = smoothstep(line_width, 0.0, grid_y);
    return max(line_x, line_y);
}

// Pulsing effect based on time
fn pulse(time: f32, speed: f32) -> f32 {
    return 0.5 + 0.5 * sin(time * speed);
}

@fragment
fn fs_main(
    in: VertexOutput,
    @group(0) @binding(2) uniforms: NeuralUniforms
) -> @location(0) vec4<f32> {
    // Sample neural state texture
    let neural_data = textureSample(neural_texture, neural_sampler, in.uv);
    
    var color = vec3<f32>(0.0);
    var alpha = 1.0;
    
    // Select visualization mode
    if (uniforms.mode == 0u) {
        // Heatmap mode: use red channel for intensity
        let intensity = neural_data.r;
        color = heatmap_color(intensity);
        alpha = intensity;
    } else if (uniforms.mode == 1u) {
        // Attention flow mode: use green channel
        let intensity = neural_data.g;
        color = heatmap_color(intensity);
        alpha = intensity;
    } else if (uniforms.mode == 2u) {
        // Memory pattern mode: use blue channel
        let intensity = neural_data.b;
        color = heatmap_color(intensity);
        alpha = intensity;
    } else {
        // Multi-channel mode: use all channels
        color = neural_data.rgb;
        alpha = neural_data.a;
    }
    
    // Apply color correction
    color = apply_color_correction(color, uniforms.brightness, uniforms.contrast);
    
    // Add subtle pulsing effect
    let pulse_factor = pulse(uniforms.time, 2.0);
    color = mix(color, color * 1.1, pulse_factor * 0.1);
    
    // Draw grid if enabled
    if (uniforms.show_grid != 0u) {
        let grid_line = draw_grid(in.screen_pos, uniforms.grid_size, 0.02);
        color = mix(color, vec3<f32>(0.3, 0.3, 0.3), grid_line * 0.5);
    }
    
    // Add subtle glow effect for high activations
    let glow = smoothstep(0.7, 1.0, max(neural_data.r, max(neural_data.g, neural_data.b)));
    color = mix(color, vec3<f32>(1.0, 1.0, 1.0), glow * 0.3);
    
    return vec4<f32>(color, alpha);
}

// --- Cortex Pipeline Entry Points (Placeholders) ---

@compute @workgroup_size(16, 16)
fn main_compute_encoder(@builtin(global_invocation_id) id: vec3<u32>) {
    // Perception Phase Placeholder
    // Reads screen buffer, writes embeddings
}

@compute @workgroup_size(16, 16)
fn main_compute_transformer(@builtin(global_invocation_id) id: vec3<u32>) {
    // Cognition Phase Placeholder
    // Reads weights/embeddings, updates KV cache
}

@compute @workgroup_size(16, 16)
fn main_compute_intent(@builtin(global_invocation_id) id: vec3<u32>) {
    // Action Phase Placeholder
    // writes to intent texture
}
