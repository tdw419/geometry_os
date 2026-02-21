// Cortex Overlay Shader
// Visualizes high-dimensional neural state as a colorized overlay

struct VertexOutput {
    @builtin(position) clip_position: vec4<f32>,
    @location(0) tex_coords: vec2<f32>,
};

@group(0) @binding(0) var cortex_texture: texture_2d<f32>;
@group(0) @binding(1) var cortex_sampler: sampler;
@group(0) @binding(2) var<uniform> overlay_color: vec4<f32>; // r, g, b, global_alpha_mult

@vertex
fn vs_main(@builtin(vertex_index) in_vertex_index: u32) -> VertexOutput {
    var out: VertexOutput;
    // Standard full-screen triangle using index trick
    let x = f32(i32(in_vertex_index) & 1);
    let y = f32(i32(in_vertex_index >> 1) & 1);
    out.tex_coords = vec2<f32>(x * 2.0, (1.0 - y * 2.0));
    out.clip_position = vec4<f32>(x * 4.0 - 1.0, 1.0 - y * 4.0, 0.0, 1.0);
    return out;
}

@fragment
fn fs_main(in: VertexOutput) -> @location(0) vec4<f32> {
    // Sample the single-channel intensity (assuming format R8 or similar)
    // For R8Unorm, .r will contain the normalized float value.
    let intensity = textureSample(cortex_texture, cortex_sampler, in.tex_coords).r;

    if (intensity < 0.01) {
        discard;
    }

    let color_rgb = overlay_color.rgb;
    let alpha = intensity * overlay_color.a;

    return vec4<f32>(color_rgb, alpha);
}
