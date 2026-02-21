// Phase 46: Agent Particles Shader
// Instanced rendering for cognitive agents in Source City

struct Uniforms {
    screen_size: vec2<f32>,
    camera_pos: vec2<f32>,
    zoom: f32,
    grid_size: f32,
    grid_opacity: f32,
    time: f32,
    rts_texture_size: vec2<f32>,
    _padding: vec2<f32>,
};

@group(0) @binding(0)
var<uniform> uniforms: Uniforms;

struct VertexInput {
    @location(0) position: vec2<f32>,      // Quad vertex position (-1.0 to 1.0)
    // Instanced data:
    @location(1) instance_pos: vec2<f32>,  // Agent world position
    @location(2) color: vec4<f32>,         // Agent color
    @location(3) role: f32,                // Agent role (0=Scout, 1=Engineer, 2=Archivist)
    @location(4) state: f32,               // Agent state (pulse effect)
};

struct VertexOutput {
    @builtin(position) clip_position: vec4<f32>,
    @location(0) color: vec4<f32>,
    @location(1) uv: vec2<f32>,
    @location(2) role: f32,
    @location(3) state_factor: f32,
};

@vertex
fn vs_main(input: VertexInput) -> VertexOutput {
    var out: VertexOutput;

    // Agent size in world coordinates (adjust as needed)
    let agent_size = 8.0 * uniforms.zoom;
    
    // Scale quad
    let local_pos = input.position * agent_size;
    
    // World position of the vertex
    let world_pos = input.instance_pos + local_pos;
    
    // Project to screen space
    let screen_pos = (world_pos - uniforms.camera_pos) * uniforms.zoom;
    
    // Convert to NDC (-1.0 to 1.0)
    // uniforms.screen_size is in pixels
    let ndc_pos = vec2<f32>(
        (screen_pos.x * 2.0) / uniforms.screen_size.x,
        (screen_pos.y * 2.0) / uniforms.screen_size.y
    );

    out.clip_position = vec4<f32>(ndc_pos, 0.0, 1.0);
    out.color = input.color;
    out.uv = input.position; // -1.0 to 1.0
    out.role = input.role;
    out.state_factor = input.state;

    return out;
}

@fragment
fn fs_main(in: VertexOutput) -> @location(0) vec4<f32> {
    // Distance from center for circle shape
    let dist = length(in.uv);
    if (dist > 1.0) {
        discard;
    }

    // Base color
    var color = in.color;
    
    // Pulse effect
    let pulse = sin(uniforms.time * 5.0) * 0.15 + 0.85;
    color.a = color.a * (1.0 - smoothstep(0.8, 1.0, dist));
    
    // Role-specific glows
    if (in.role < 0.5) { // Scout (Gold)
        color = color * pulse;
    } else if (in.role < 1.5) { // Engineer (Cyan)
        color = color * (0.9 + sin(uniforms.time * 10.0) * 0.1);
    } else { // Archivist (Purple)
        color = color * (0.8 + 0.2 * cos(uniforms.time * 3.0));
    }

    // Inner core
    let inner = 1.0 - smoothstep(0.2, 0.3, dist);
    color = mix(color, vec4<f32>(1.0, 1.0, 1.0, color.a), inner * 0.5);

    return color;
}
