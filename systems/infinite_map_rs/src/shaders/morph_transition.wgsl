// systems/infinite_map_rs/src/shaders/morph_transition.wgsl
// Phase 40.5: Morph Transition Shader
// Creates a visual distortion effect for hot-swapping modules

struct VertexInput {
    @location(0) position: vec3<f32>,
    @location(1) color: vec4<f32>,
    @location(2) uv: vec2<f32>,
    @location(3) morph_factor: f32,
}

struct VertexOutput {
    @builtin(position) clip_position: vec4<f32>,
    @location(0) color: vec4<f32>,
    @location(1) uv: vec2<f32>,
    @location(2) morph: f32,
}

struct Uniforms {
    view_proj: mat4x4<f32>,
    time: f32,
}

@group(0) @binding(0)
var<uniform> uniforms: Uniforms;

@vertex
fn vs_main(vertex: VertexInput) -> VertexOutput {
    var output: VertexOutput;

    // Apply model transformation (flattened in vertex buffer for now)
    var pos = vertex.position;
    
    // Wave distortion for "melting" look
    if (vertex.morph_factor > 0.0) {
        let wave = sin(uniforms.time * 5.0 + pos.y * 0.1) * vertex.morph_factor * 20.0;
        pos.x += wave;
        pos.z += wave;
        
        // Flattening effect
        // pos.y *= (1.0 - vertex.morph_factor * 0.5);
    }

    output.clip_position = uniforms.view_proj * vec4<f32>(pos, 1.0);
    output.color = vertex.color;
    output.uv = vertex.uv;
    output.morph = vertex.morph_factor;

    return output;
}

@fragment
fn fs_main(fragment: VertexOutput) -> @location(0) vec4<f32> {
    var color = fragment.color;
    
    // Pulse effect
    let pulse = sin(uniforms.time * 3.0) * 0.5 + 0.5;
    
    // Morph effect: Cyan shift and digital glitch
    if (fragment.morph > 0.0) {
        // Shift towards Foundry Cyan
        let cyan = vec4<f32>(0.0, 0.8, 0.8, color.a);
        color = mix(color, cyan, fragment.morph * 0.5);
        
        // Add digital "glitch" stripes
        let glitch = step(0.95, fract(fragment.uv.y * 10.0 - uniforms.time * 4.0));
        color += glitch * vec4<f32>(0.0, 1.0, 1.0, 0.0) * fragment.morph;
        
        // Edge glow
        let edge = 1.0 - min(fragment.uv.x, 1.0 - fragment.uv.x) * 2.0;
        color += edge * vec4<f32>(0.0, 0.5, 0.5, 0.0) * fragment.morph * pulse;
    }

    return color;
}
