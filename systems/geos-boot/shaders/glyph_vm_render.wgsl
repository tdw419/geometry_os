// Glyph VM Render Shader
// Placeholder - renders viewport with visual pulse from VM state

struct RenderUniforms {
    viewport_width: f32,
    viewport_height: f32,
    time: f32,
    _padding: f32,
}

@group(0) @binding(0) var<storage, read> vm_memory: array<u32>;
@group(0) @binding(1) var<uniform> uniforms: RenderUniforms;

struct VertexOutput {
    @builtin(position) position: vec4<f32>,
    @location(0) uv: vec2<f32>,
}

@vertex
fn vs_main(@builtin(vertex_index) vi: u32) -> VertexOutput {
    // Fullscreen triangle
    var positions = array<vec2<f32>, 3>(
        vec2<f32>(-1.0, -1.0),
        vec2<f32>(3.0, -1.0),
        vec2<f32>(-1.0, 3.0),
    );

    var out: VertexOutput;
    out.position = vec4<f32>(positions[vi], 0.0, 1.0);
    out.uv = positions[vi] * 0.5 + 0.5;
    return out;
}

@fragment
fn fs_main(in: VertexOutput) -> @location(0) vec4<f32> {
    // Read cycle counter from VM memory
    let cycle = vm_memory[1u];
    let flash = f32(cycle % 60u) / 60.0;

    // Dark background with subtle pulse
    let base = vec3<f32>(0.05, 0.06, 0.08);
    let pulse = vec3<f32>(0.02, 0.03, 0.04) * flash;

    return vec4<f32>(base + pulse, 1.0);
}
