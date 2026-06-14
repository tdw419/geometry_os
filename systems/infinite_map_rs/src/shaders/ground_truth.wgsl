// ============================================
// GEOMETRY OS - GROUND TRUTH SUBSTRATE SHADER
// Renders bootable cartridge as biological ground with AI state coupling
// ============================================

struct Uniforms {
    screen_size: vec2<f32>,
    camera_pos: vec2<f32>,
    zoom: f32,
    grid_size: f32,
    grid_opacity: f32,
    cartridge_texture_size: vec2<f32>,
    _padding: f32,
}

struct CartridgeUniforms {
    brightness: f32,
    saturation: f32,
    hue_shift: f32,
    _padding: f32,
}

@group(0) @binding(0)
var<uniform> uniforms: Uniforms;

@group(0) @binding(1)
var cartridge_texture: texture_2d<f32>;

@group(0) @binding(2)
var cartridge_sampler: sampler;

@group(0) @binding(3)
var<uniform> cartridge_state: CartridgeUniforms;

struct VertexOutput {
    @builtin(position) position: vec4<f32>,
    @location(0) uv: vec2<f32>,
}

// HSV to RGB conversion
fn hsv_to_rgb(hsv: vec3<f32>) -> vec3<f32> {
    let h = hsv.x;
    let s = hsv.y;
    let v = hsv.z;
    
    let i = floor(h * 6.0);
    let f = h * 6.0 - i;
    let p = v * (1.0 - s);
    let q = v * (1.0 - f * s);
    let t = v * (1.0 - (1.0 - f) * s);
    
    let imod = i32(i) % 6;
    
    var rgb = vec3<f32>(0.0, 0.0, 0.0);
    
    if imod == 0 {
        rgb = vec3<f32>(v, t, p);
    } else if imod == 1 {
        rgb = vec3<f32>(q, v, p);
    } else if imod == 2 {
        rgb = vec3<f32>(p, v, t);
    } else if imod == 3 {
        rgb = vec3<f32>(p, q, v);
    } else if imod == 4 {
        rgb = vec3<f32>(t, p, v);
    } else {
        rgb = vec3<f32>(v, p, q);
    }
    
    return rgb;
}

// RGB to HSV conversion
fn rgb_to_hsv(rgb: vec3<f32>) -> vec3<f32> {
    let cmax = max(max(rgb.r, rgb.g), rgb.b);
    let cmin = min(min(rgb.r, rgb.g), rgb.b);
    let delta = cmax - cmin;
    
    let v = cmax;
    let s = select(0.0, delta / cmax, cmax > 0.0);
    
    var h = 0.0;
    
    if delta > 0.0 {
        if cmax == rgb.r {
            let numerator = (rgb.g - rgb.b) / delta;
            h = numerator - 6.0 * floor(numerator / 6.0);
        } else if cmax == rgb.g {
            h = (rgb.b - rgb.r) / delta + 2.0;
        } else {
            h = (rgb.r - rgb.g) / delta + 4.0;
        }
    }
    
    h = h / 6.0;
    
    return vec3<f32>(h, s, v);
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

    // Sample cartridge texture (ground truth substrate)
    // Map world coordinates to texture coordinates with tiling
    // Note: uniforms.cartridge_texture_size must be positive and non-zero
    let tex_coord = vec2<f32>(
        fract(world_pos.x / uniforms.cartridge_texture_size.x),
        fract(1.0 - world_pos.y / uniforms.cartridge_texture_size.y)
    );
    
    let cartridge_color = textureSample(cartridge_texture, cartridge_sampler, tex_coord);

    // Apply biological coupling from AI state
    var color = cartridge_color.rgb;
    
    // 1. Convert to HSV for easier manipulation
    var hsv = rgb_to_hsv(color);
    
    // 2. Apply brightness modulation (AI confidence)
    // Higher confidence = brighter ground
    hsv.z = hsv.z * cartridge_state.brightness;
    
    // 3. Apply saturation modulation (AI fatigue)
    // Higher fatigue = desaturated ground
    hsv.y = hsv.y * cartridge_state.saturation;
    
    // 4. Apply hue shift (AI alignment)
    // Lower alignment = shift toward red (warning state)
    hsv.x = fract(hsv.x + cartridge_state.hue_shift);
    
    // 5. Convert back to RGB
    color = hsv_to_rgb(hsv);

    // Grid overlay (subtle)
    let grid_screen_size = uniforms.grid_size * uniforms.zoom;
    let opacity = min(1.0, grid_screen_size / 20.0) * uniforms.grid_opacity * 0.5;

    let grid_x = fract(world_pos.x / uniforms.grid_size);
    let grid_y = fract(world_pos.y / uniforms.grid_size);
    let line_width = 1.0 / uniforms.zoom;

    var line_intensity = 0.0;
    if grid_x < line_width / uniforms.grid_size || grid_x > 1.0 - line_width / uniforms.grid_size {
        line_intensity = 1.0;
    }
    if grid_y < line_width / uniforms.grid_size || grid_y > 1.0 - line_width / uniforms.grid_size {
        line_intensity = max(line_intensity, 1.0);
    }

    // Grid color (cyan tint, affected by AI state)
    let grid_color = vec3<f32>(0.2, 0.3, 0.4) * cartridge_state.brightness;
    color = mix(color, grid_color, line_intensity * opacity);

    // Origin indicator (AI consciousness center)
    let dist_to_origin = length(world_pos);
    let origin_radius = 10.0 / uniforms.zoom;
    if dist_to_origin < origin_radius {
        let origin_intensity = 1.0 - (dist_to_origin / origin_radius);
        // Origin color affected by alignment (cyan = aligned, red = misaligned)
        let origin_color = mix(vec3<f32>(1.0, 0.0, 0.0), vec3<f32>(0.0, 1.0, 1.0), cartridge_state.brightness);
        color = mix(color, origin_color, origin_intensity);
    }

    // Cognitive state visualization (pulsing based on confidence)
    let pulse_speed = 2.0;
    let pulse = sin(dist_to_origin * 0.1 + cartridge_state.brightness * pulse_speed) * 0.5 + 0.5;
    let pulse_radius = 20.0 / uniforms.zoom;
    
    if dist_to_origin < pulse_radius {
        let pulse_intensity = (1.0 - dist_to_origin / pulse_radius) * pulse * 0.1;
        color = mix(color, vec3<f32>(0.0, 1.0, 1.0), pulse_intensity);
    }

    // Fatigue visualization (darkening at edges)
    let fatigue_radius = 50.0 / uniforms.zoom;
    if dist_to_origin > fatigue_radius {
        let fatigue_factor = min(1.0, (dist_to_origin - fatigue_radius) / fatigue_radius);
        let fatigue_darkening = fatigue_factor * (1.0 - cartridge_state.saturation) * 0.5;
        color = color * (1.0 - fatigue_darkening);
    }

    return vec4<f32>(color, 1.0);
}
