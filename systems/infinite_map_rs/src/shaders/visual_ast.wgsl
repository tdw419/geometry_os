// Visual AST Node Renderer
// Renders syntax nodes as glowing blocks

struct Uniforms {
    screen_size: vec2<f32>,
    camera_pos: vec2<f32>,
    zoom: f32,
    grid_size: f32,
    grid_opacity: f32,
}

@group(0) @binding(0)
var<uniform> uniforms: Uniforms;

struct InstanceInput {
    @location(1) pos: vec2<f32>,
    @location(2) size: vec2<f32>, // Width, Height
    @location(3) color: vec4<f32>,
    @location(4) border_color: vec4<f32>,
    @location(5) glow: f32, // Intensity
}

struct VertexInput {
    @location(0) position: vec2<f32>, // -0.5 to 0.5 quad
}

struct VertexOutput {
    @builtin(position) clip_position: vec4<f32>,
    @location(0) uv: vec2<f32>,
    @location(1) color: vec4<f32>,
    @location(2) border_color: vec4<f32>,
    @location(3) glow: f32,
}

@vertex
fn vs_main(
    model: VertexInput,
    instance: InstanceInput,
) -> VertexOutput {
    var out: VertexOutput;
    
    // Scale quad by instance size
    let scaled_pos = model.position * instance.size;
    
    // Translate to world position (center aligned?)
    // Assuming pos is top-left, and model.position is 0..1?
    // Let's assume model is -0.5..0.5 (center origin of quad)
    // And instance.pos is center of node.
    let world_pos = instance.pos + scaled_pos;

    // Apply Camera Transform
    // (pos - camera_pos) * zoom / (screen_size / 2)
    let view_pos = (world_pos - uniforms.camera_pos) * uniforms.zoom;
    let ndc_pos = vec2<f32>(
        view_pos.x / (uniforms.screen_size.x * 0.5),
        -view_pos.y / (uniforms.screen_size.y * 0.5) // Flip Y for WGPU
    );

    out.clip_position = vec4<f32>(ndc_pos, 0.0, 1.0);
    out.uv = model.position + vec2<f32>(0.5, 0.5); // Map -0.5..0.5 to 0..1
    out.color = instance.color;
    out.border_color = instance.border_color;
    out.glow = instance.glow;
    
    return out;
}

@fragment
fn fs_main(in: VertexOutput) -> @location(0) vec4<f32> {
    let uv = in.uv;
    
    // Border logic
    let border_width = 0.05; // Relative UV width
    var alpha = 1.0;
    
    var color = in.color;
    
    let dist_x = min(uv.x, 1.0 - uv.x);
    let dist_y = min(uv.y, 1.0 - uv.y);
    let dist = min(dist_x, dist_y);
    
    if (dist < border_width) {
        color = in.border_color;
        // Glow effect on border
        let glow_factor = (border_width - dist) / border_width;
        color = mix(color, vec4<f32>(1.0, 1.0, 1.0, 1.0), glow_factor * in.glow);
    }
    
    // Rounded corners (simple SDF)
    // let corner_radius = 0.1;
    
    return color;
}
