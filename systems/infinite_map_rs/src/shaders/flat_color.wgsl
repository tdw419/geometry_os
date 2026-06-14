// src/shaders/glass_decorations.wgsl

struct Uniforms {
    color: vec4<f32>,
};

@group(0) @binding(0)
var<uniform> uniforms: Uniforms;

@vertex
fn vs_main(@builtin(vertex_index) vertex_index: u32) -> @builtin(position) vec4<f32> {
    // Full-screen quad (to be clipped by viewport)
    var positions = array<vec2<f32>, 6>(
        vec2<f32>(-1.0, -1.0),
        vec2<f32>(1.0, -1.0),
        vec2<f32>(-1.0, 1.0),
        vec2<f32>(-1.0, 1.0),
        vec2<f32>(1.0, -1.0),
        vec2<f32>(1.0, 1.0)
    );
    
    let pos = positions[vertex_index];
    return vec4<f32>(pos, 0.0, 1.0);
}

@fragment
fn fs_main(@builtin(position) frag_coord: vec4<f32>) -> @location(0) vec4<f32> {
    // Glassmorphism logic
    // We don't have backbuffer access for real blur in a single pass without a separate texture.
    // However, we can simulate the "frost" effect with noise and semi-transparency.
    
    let base_color = uniforms.color;
    
    // Semi-transparent base
    var color = vec4<f32>(base_color.rgb * 0.5, 0.6);
    
    // Add subtle noise/grain for "frosted" look
    let noise = fract(sin(dot(frag_coord.xy, vec2<f32>(12.9898, 78.233))) * 43758.5453);
    color.r += (noise - 0.5) * 0.02;
    color.g += (noise - 0.5) * 0.02;
    color.b += (noise - 0.5) * 0.02;
    
    // Rim highlight (simulated frost on edges)
    // frag_coord is in screen space. Since we use viewport clipping, 
    // we don't know where we are inside the window easily unless we pass coords.
    
    return color;
}
