// ============================================
// GEOMETRY OS - INFINITE GRID SHADER WITH RTS TEXTURE
// Renders the Hilbert-mapped substrate with live RTS data
// ============================================

struct Uniforms {
    screen_size: vec2<f32>,
    camera_pos: vec2<f32>,
    zoom: f32,
    grid_size: f32,
    grid_opacity: f32,
    rts_texture_size: vec2<f32>,
    _padding: f32,
}

@group(0) @binding(0)
var<uniform> uniforms: Uniforms;

@group(0) @binding(1)
var rts_texture: texture_2d<f32>;

@group(0) @binding(2)
var rts_sampler: sampler;

struct VertexOutput {
    @builtin(position) position: vec4<f32>,
    @location(0) uv: vec2<f32>,
}

@vertex
fn vs_main(@builtin(vertex_index) vertex_index: u32) -> VertexOutput {
    var pos = array<vec2<f32>, 6>(
        vec2<f32>(-1.0, -1.0),
        vec2<f32>(1.0, -1.0),
        vec2<f32>(-1.0, 1.0),
        vec2<f32>(-1.0, 1.0),
        vec2<f32>(1.0, -1.0),
        vec2<f32>(1.0, 1.0)
    );

    var output: VertexOutput;
    output.position = vec4<f32>(pos[vertex_index], 0.0, 1.0);
    output.uv = pos[vertex_index];
    return output;
}

@fragment
fn fs_main(in: VertexOutput) -> @location(0) vec4<f32> {
    // Convert screen coordinates to world coordinates
    let screen_pos = (in.uv + 1.0) * 0.5 * uniforms.screen_size;
    let world_pos = (screen_pos - uniforms.screen_size * 0.5) / uniforms.zoom + uniforms.camera_pos;

    // Sample RTS texture
    // Map world coordinates to texture coordinates
    let tex_coord = vec2<f32>(
        fract(world_pos.x / uniforms.rts_texture_size.x),
        fract(world_pos.y / uniforms.rts_texture_size.y)
    );
    
    let rts_color = textureSample(rts_texture, rts_sampler, tex_coord);

    // Base color from RTS texture
    var color = rts_color.rgb;

    // Grid calculations
    let grid_screen_size = uniforms.grid_size * uniforms.zoom;
    
    // Fade grid when too dense
    let opacity = min(1.0, grid_screen_size / 20.0) * uniforms.grid_opacity;

    // Calculate grid lines
    let grid_x = fract(world_pos.x / uniforms.grid_size);
    let grid_y = fract(world_pos.y / uniforms.grid_size);

    // Line width in world units
    let line_width = 2.0 / uniforms.zoom;

    // Vertical lines
    var line_intensity = 0.0;
    if grid_x < line_width / uniforms.grid_size || grid_x > 1.0 - line_width / uniforms.grid_size {
        line_intensity = 1.0;
    }

    // Horizontal lines
    if grid_y < line_width / uniforms.grid_size || grid_y > 1.0 - line_width / uniforms.grid_size {
        line_intensity = max(line_intensity, 1.0);
    }

    // Apply grid color (cyan tint)
    let grid_color = vec3<f32>(0.2, 0.3, 0.4);
    color = mix(color, grid_color, line_intensity * opacity * 0.3);

    // Origin indicator (bright cyan dot at 0,0)
    let dist_to_origin = length(world_pos);
    let origin_radius = 5.0 / uniforms.zoom;
    if dist_to_origin < origin_radius {
        let origin_intensity = 1.0 - (dist_to_origin / origin_radius);
        color = mix(color, vec3<f32>(0.0, 1.0, 1.0), origin_intensity);
    }

    // Coordinate labels (simulated with small dots at grid intersections)
    let grid_x_int = floor(world_pos.x / uniforms.grid_size);
    let grid_y_int = floor(world_pos.y / uniforms.grid_size);
    
    // Only show labels when zoomed in enough
    if uniforms.zoom > 0.5 {
        let label_size = 3.0 / uniforms.zoom;
        let label_x = fract(world_pos.x / uniforms.grid_size) * uniforms.grid_size;
        let label_y = fract(world_pos.y / uniforms.grid_size) * uniforms.grid_size;
        
        if label_x < label_size && label_y < label_size {
            color = mix(color, vec3<f32>(0.5, 0.5, 0.5), 0.3);
        }
    }

    return vec4<f32>(color, 1.0);
}
