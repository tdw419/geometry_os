/**
 * Glyph Renderer Compute Shader
 * 
 * Optimized for batch rasterization of geometric primitives (glyphs)
 * into Hilbert-mapped VRAM.
 */

struct Glyph {
    opcode: u32,    // 0xC0=SET_COLOR, 0xC3=DRAW_RECT, 0xC4=FILL_RECT, 0xCF=DRAW_PIXEL
    x: f32,
    y: f32,
    w: f32,
    h: f32,
    color: vec4<f32>,
    params: vec4<f32>,
};

struct GlyphBuffer {
    count: u32,
    glyphs: array<Glyph, 1024>,
};

struct Uniforms {
    resolution: u32, // 2^order
    time: f32,
    _padding: vec2<u32>,
};

@group(0) @binding(0) var<uniform> uniforms: Uniforms;
@group(0) @binding(1) var<storage, read> glyph_buffer: GlyphBuffer;
@group(0) @binding(2) var canvas: texture_storage_2d<rgba8unorm, read_write>;
@group(0) @binding(5) var<storage, read_write> pixel_buffer: array<u32>;  // Hilbert-indexed pixel buffer

// Hilbert curve utilities (spatial locality preservation)
fn xy_to_hilbert(x: u32, y: u32, n: u32) -> u32 {
    var d: u32 = 0u;
    var s: u32 = n / 2u;
    var xx = x;
    var yy = y;
    while (s > 0u) {
        let rx = select(0u, 1u, (xx & s) > 0u);
        let ry = select(0u, 1u, (yy & s) > 0u);
        d += s * s * ((3u * rx) ^ ry);
        let rotated = hilbert_rot(s, xx, yy, rx, ry);
        xx = rotated.x;
        yy = rotated.y;
        s >>= 1u;
    }
    return d;
}

fn hilbert_rot(n: u32, x: u32, y: u32, rx: u32, ry: u32) -> vec2<u32> {
    if (ry == 0u) {
        if (rx == 1u) {
            return vec2<u32>(n - 1u - y, n - 1u - x);
        }
        return vec2<u32>(y, x);
    }
    return vec2<u32>(x, y);
}

// ═══════════════════════════════════════════════════════════════════════════════
// PIXEL ACCESS FUNCTIONS
// ═══════════════════════════════════════════════════════════════════════════════

// Unpack color components (0xRRGGBBAA -> vec4)
fn unpack_color(color: u32) -> vec4<u32> {
    return vec4<u32>(
        (color >> 24u) & 0xFFu,  // R
        (color >> 16u) & 0xFFu,  // G
        (color >> 8u) & 0xFFu,   // B
        color & 0xFFu            // A
    );
}

// Pack color components (vec4 -> 0xRRGGBBAA)
fn pack_color(r: u32, g: u32, b: u32, a: u32) -> u32 {
    return (r << 24u) | (g << 16u) | (b << 8u) | a;
}

// Convert vec4<f32> color (0.0-1.0) to packed u32 (0xRRGGBBAA)
fn color_to_u32(color: vec4<f32>) -> u32 {
    return pack_color(
        u32(color.r * 255.0),
        u32(color.g * 255.0),
        u32(color.b * 255.0),
        u32(color.a * 255.0)
    );
}

// Convert packed u32 (0xRRGGBBAA) to vec4<f32> color (0.0-1.0)
fn u32_to_color(packed: u32) -> vec4<f32> {
    let rgba = unpack_color(packed);
    return vec4<f32>(
        f32(rgba.x) / 255.0,
        f32(rgba.y) / 255.0,
        f32(rgba.z) / 255.0,
        f32(rgba.w) / 255.0
    );
}

// Alpha blend two colors (both in 0xRRGGBBAA format)
fn blend_colors(src: u32, dst: u32) -> u32 {
    let src_rgba = unpack_color(src);
    let dst_rgba = unpack_color(dst);

    let src_alpha = src_rgba.w;
    if (src_alpha == 255u) {
        return src; // Fully opaque, replace
    }
    if (src_alpha == 0u) {
        return dst; // Fully transparent, keep dst
    }

    let src_factor = f32(src_alpha) / 255.0;
    let dst_factor = 1.0 - src_factor;

    let r = u32(f32(src_rgba.x) * src_factor + f32(dst_rgba.x) * dst_factor);
    let g = u32(f32(src_rgba.y) * src_factor + f32(dst_rgba.y) * dst_factor);
    let b = u32(f32(src_rgba.z) * src_factor + f32(dst_rgba.z) * dst_factor);
    let a = u32(f32(src_alpha) + f32(dst_rgba.w) * dst_factor);

    return pack_color(min(r, 255u), min(g, 255u), min(b, 255u), min(a, 255u));
}

// Alpha blend two vec4<f32> colors
fn blend_colors_f32(src: vec4<f32>, dst: vec4<f32>) -> vec4<f32> {
    if (src.a >= 1.0) {
        return src; // Fully opaque, replace
    }
    if (src.a <= 0.0) {
        return dst; // Fully transparent, keep dst
    }

    let dst_factor = 1.0 - src.a;
    return vec4<f32>(
        src.r * src.a + dst.r * dst_factor,
        src.g * src.a + dst.g * dst_factor,
        src.b * src.a + dst.b * dst_factor,
        src.a + dst.a * dst_factor
    );
}

// ═══════════════════════════════════════════════════════════════════════════════
// SHAPE DRAWING PRIMITIVES
// ═══════════════════════════════════════════════════════════════════════════════

// Draw a single pixel at (x, y) with the given color
// Bounds checked against uniforms.resolution
fn draw_pixel(x: i32, y: i32, color: vec4<f32>) {
    if (x >= 0 && y >= 0 && u32(x) < uniforms.resolution && u32(y) < uniforms.resolution) {
        textureStore(canvas, vec2<i32>(x, y), color);
    }
}

// Fill a rectangle from (x, y) with given width and height
fn fill_rect(x: i32, y: i32, width: i32, height: i32, color: vec4<f32>) {
    let x_start = max(0, x);
    let y_start = max(0, y);
    let x_end = min(i32(uniforms.resolution), x + width);
    let y_end = min(i32(uniforms.resolution), y + height);

    for (var py = y_start; py < y_end; py++) {
        for (var px = x_start; px < x_end; px++) {
            textureStore(canvas, vec2<i32>(px, py), color);
        }
    }
}

// Draw rectangle outline from (x, y) with given width and height
fn draw_rect(x: i32, y: i32, width: i32, height: i32, color: vec4<f32>) {
    if (width <= 0 || height <= 0) {
        return;
    }

    let x_start = max(0, x);
    let y_start = max(0, y);
    let x_end = min(i32(uniforms.resolution) - 1, x + width - 1);
    let y_end = min(i32(uniforms.resolution) - 1, y + height - 1);

    // Top and bottom horizontal lines
    for (var px = x_start; px <= x_end; px++) {
        draw_pixel(px, y_start, color);
        draw_pixel(px, y_end, color);
    }

    // Left and right vertical lines
    for (var py = y_start; py <= y_end; py++) {
        draw_pixel(x_start, py, color);
        draw_pixel(x_end, py, color);
    }
}

// Helper function for circle drawing - plots 8 symmetric points
fn plot_circle_points(cx: i32, cy: i32, x: i32, y: i32, color: vec4<f32>) {
    draw_pixel(cx + x, cy + y, color);
    draw_pixel(cx - x, cy + y, color);
    draw_pixel(cx + x, cy - y, color);
    draw_pixel(cx - x, cy - y, color);
    draw_pixel(cx + y, cy + x, color);
    draw_pixel(cx - y, cy + x, color);
    draw_pixel(cx + y, cy - x, color);
    draw_pixel(cx - y, cy - x, color);
}

// Draw circle outline using midpoint algorithm
fn draw_circle(cx: i32, cy: i32, radius: i32, color: vec4<f32>) {
    if (radius <= 0) {
        return;
    }

    var x: i32 = 0;
    var y: i32 = radius;
    var d: i32 = 1 - radius;

    plot_circle_points(cx, cy, x, y, color);

    while (x < y) {
        x = x + 1;
        if (d < 0) {
            d = d + 2 * x + 1;
        } else {
            y = y - 1;
            d = d + 2 * (x - y) + 1;
        }
        plot_circle_points(cx, cy, x, y, color);
    }
}

// Draw line using Bresenham's algorithm (simplified)
fn draw_line(x1: i32, y1: i32, x2: i32, y2: i32, color: vec4<f32>) {
    let dx = abs(x2 - x1);
    let dy = abs(y2 - y1);
    let sx = select(-1, 1, x1 < x2);
    let sy = select(-1, 1, y1 < y2);
    var err = dx - dy;

    var x = x1;
    var y = y1;

    loop {
        draw_pixel(x, y, color);

        if (x == x2 && y == y2) {
            break;
        }

        let e2 = 2 * err;
        if (e2 > -dy) {
            err = err - dy;
            x = x + sx;
        }
        if (e2 < dx) {
            err = err + dx;
            y = y + sy;
        }
    }
}

// ═══════════════════════════════════════════════════════════════════════════════
// COMMAND EXECUTION
// ═══════════════════════════════════════════════════════════════════════════════

// Opcode constants for glyph commands
const GLYPH_NOP: u32 = 0x00u;
const GLYPH_SET_COLOR: u32 = 0x01u;
const GLYPH_DRAW_RECT: u32 = 0x02u;
const GLYPH_FILL_RECT: u32 = 0x03u;
const GLYPH_DRAW_PIXEL: u32 = 0x04u;
const GLYPH_DRAW_CIRCLE: u32 = 0x05u;
const GLYPH_FILL_CIRCLE: u32 = 0x06u;
const GLYPH_DRAW_LINE: u32 = 0x07u;
const GLYPH_THOUGHT_RENDER: u32 = 0x08u;
const GLYPH_TOKEN_RENDER: u32 = 0x09u;
const GLYPH_TOKEN_LINK: u32 = 0x0Au;      // Semantic proximity line between tokens
const GLYPH_KERNEL_REWRITE: u32 = 0xCCu;  // Kernel rewrite visualization (Self-Rewriting Kernel)

// ═══════════════════════════════════════════════════════════════════════════════
// THOUGHT RENDER TYPES AND CONSTANTS
// ═══════════════════════════════════════════════════════════════════════════════

// Thought type constants (encoded in glyph.params.x)
const THOUGHT_TYPE_MEMORY: f32 = 0.0;      // Past experiences, stored knowledge
const THOUGHT_TYPE_CONCEPT: f32 = 1.0;     // Abstract ideas, patterns
const THOUGHT_TYPE_EMOTION: f32 = 2.0;     // Affective states, feelings
const THOUGHT_TYPE_GOAL: f32 = 3.0;        // Objectives, intentions
const THOUGHT_TYPE_QUERY: f32 = 4.0;       // Questions, searches
const THOUGHT_TYPE_RESPONSE: f32 = 5.0;    // Answers, outputs
const THOUGHT_TYPE_REFLECTION: f32 = 6.0;  // Self-analysis, meta-cognition
const THOUGHT_TYPE_DEFAULT: f32 = 7.0;     // Unclassified thoughts

// Age thresholds for pulse behavior (in seconds)
const THOUGHT_AGE_FRESH: f32 = 1.0;        // Very new thought (< 1s)
const THOUGHT_AGE_RECENT: f32 = 5.0;       // Recent thought (1-5s)
const THOUGHT_AGE_MATURE: f32 = 30.0;      // Mature thought (5-30s)
const THOUGHT_AGE_OLD: f32 = 60.0;         // Old thought (> 60s, begins fading)

// Pulse frequency multipliers by age
const PULSE_FREQ_FRESH: f32 = 8.0;         // Fast pulse for new thoughts
const PULSE_FREQ_RECENT: f32 = 4.0;        // Medium-fast pulse
const PULSE_FREQ_MATURE: f32 = 2.0;        // Slow pulse
const PULSE_FREQ_OLD: f32 = 0.5;           // Very slow pulse for old thoughts

// ═══════════════════════════════════════════════════════════════════════════════
// THOUGHT TYPE TO COLOR MAPPING
// ═══════════════════════════════════════════════════════════════════════════════

// Map thought type to a distinct color
// Each type gets a unique hue to enable visual differentiation
fn thought_type_to_color(thought_type: f32) -> vec4<f32> {
    // Use integer comparison for type matching
    let t = floor(thought_type + 0.5);  // Round to nearest integer
    
    if (t == THOUGHT_TYPE_MEMORY) {
        // Memory: Deep blue - stable, stored, foundational
        return vec4<f32>(0.2, 0.4, 0.9, 1.0);
    } else if (t == THOUGHT_TYPE_CONCEPT) {
        // Concept: Green - growth, patterns, abstraction
        return vec4<f32>(0.2, 0.8, 0.4, 1.0);
    } else if (t == THOUGHT_TYPE_EMOTION) {
        // Emotion: Warm orange-red - passion, feeling
        return vec4<f32>(0.9, 0.4, 0.2, 1.0);
    } else if (t == THOUGHT_TYPE_GOAL) {
        // Goal: Golden yellow - aspiration, target
        return vec4<f32>(0.95, 0.85, 0.2, 1.0);
    } else if (t == THOUGHT_TYPE_QUERY) {
        // Query: Cyan - curiosity, searching
        return vec4<f32>(0.2, 0.85, 0.9, 1.0);
    } else if (t == THOUGHT_TYPE_RESPONSE) {
        // Response: Magenta - output, answer
        return vec4<f32>(0.85, 0.3, 0.85, 1.0);
    } else if (t == THOUGHT_TYPE_REFLECTION) {
        // Reflection: Purple - introspection, depth
        return vec4<f32>(0.6, 0.3, 0.85, 1.0);
    } else {
        // Default: Gray-white - neutral, unclassified
        return vec4<f32>(0.7, 0.7, 0.75, 1.0);
    }
}

// Calculate pulse frequency based on thought age
// Newer thoughts pulse faster, older thoughts pulse slower and eventually fade
fn get_pulse_frequency(age: f32) -> f32 {
    if (age < THOUGHT_AGE_FRESH) {
        // Fresh: Fast pulsing, high energy
        return PULSE_FREQ_FRESH;
    } else if (age < THOUGHT_AGE_RECENT) {
        // Recent: Medium-fast pulsing
        // Linear interpolation between fresh and recent frequencies
        let t = (age - THOUGHT_AGE_FRESH) / (THOUGHT_AGE_RECENT - THOUGHT_AGE_FRESH);
        return mix(PULSE_FREQ_FRESH, PULSE_FREQ_RECENT, t);
    } else if (age < THOUGHT_AGE_MATURE) {
        // Mature: Slow pulsing
        let t = (age - THOUGHT_AGE_RECENT) / (THOUGHT_AGE_MATURE - THOUGHT_AGE_RECENT);
        return mix(PULSE_FREQ_RECENT, PULSE_FREQ_MATURE, t);
    } else {
        // Old: Very slow pulsing
        let t = min((age - THOUGHT_AGE_MATURE) / THOUGHT_AGE_OLD, 1.0);
        return mix(PULSE_FREQ_MATURE, PULSE_FREQ_OLD, t);
    }
}

// Calculate alpha fade based on age
// Thoughts gradually fade as they age beyond the mature threshold
fn get_age_fade(age: f32) -> f32 {
    if (age < THOUGHT_AGE_MATURE) {
        // Young thoughts are fully visible
        return 1.0;
    } else if (age < THOUGHT_AGE_OLD) {
        // Aging thoughts begin to fade
        let t = (age - THOUGHT_AGE_MATURE) / (THOUGHT_AGE_OLD - THOUGHT_AGE_MATURE);
        return mix(1.0, 0.5, t);
    } else {
        // Old thoughts fade significantly
        // Exponential decay beyond old threshold
        let excess_age = age - THOUGHT_AGE_OLD;
        return 0.5 * exp(-excess_age * 0.02);
    }
}

// ═══════════════════════════════════════════════════════════════════════════════
// THOUGHT RENDER IMPLEMENTATION
// ═══════════════════════════════════════════════════════════════════════════════

// Render a thought with type-based coloring, age-based pulse effects,
// and Hilbert curve coordinate transformation for spatial locality.
//
// Glyph.params layout:
//   x = thought_type (0-7, see THOUGHT_TYPE_* constants)
//   y = age (in seconds since thought creation)
//   z = intensity (0.0-1.0, affects brightness/size)
//   w = reserved for future use
fn render_thought(glyph: Glyph) {
    let dim = uniforms.resolution;
    
    // Extract thought parameters from glyph.params
    let thought_type = glyph.params.x;
    let age = glyph.params.y;
    let intensity = clamp(glyph.params.z, 0.0, 1.0);
    
    // Get base color from thought type
    let base_color = thought_type_to_color(thought_type);
    
    // Calculate pulse effect based on age
    let pulse_freq = get_pulse_frequency(age);
    let pulse_phase = uniforms.time * pulse_freq;
    let pulse = 0.5 + 0.5 * sin(pulse_phase);
    
    // Apply intensity to pulse amplitude
    let pulse_intensity = mix(0.3, 1.0, intensity);
    let adjusted_pulse = mix(1.0 - pulse_intensity, 1.0, pulse);
    
    // Calculate age-based fade
    let age_fade = get_age_fade(age);
    
    // Combine all effects into final color
    let final_alpha = base_color.a * adjusted_pulse * age_fade;
    let final_color = vec4<f32>(
        base_color.rgb * adjusted_pulse,
        final_alpha
    );
    
    // Transform to Hilbert curve coordinates for spatial locality
    // This preserves cache coherence when rendering neural patterns
    let px = u32(clamp(glyph.x, 0.0, f32(dim - 1u)));
    let py = u32(clamp(glyph.y, 0.0, f32(dim - 1u)));
    let hilbert_idx = xy_to_hilbert(px, py, dim);
    
    // Write to Hilbert-indexed pixel buffer for efficient neural access
    pixel_buffer[hilbert_idx] = color_to_u32(final_color);
    
    // Also render to canvas for direct visualization
    textureStore(canvas, vec2<i32>(i32(px), i32(py)), final_color);
}

// Render thought with geometric representation (larger than single pixel)
// Uses the glyph dimensions (w, h) to render a pulsing thought region
// Render a 3D thought with depth-based scaling and occlusion
fn render_thought_3d(glyph: Glyph) {
    let dim = uniforms.resolution;
    let z_depth = glyph.params.w; // Bridge stores Z in params.w
    
    // Calculate perspective scale: distant thoughts are smaller
    let scale = mix(0.5, 1.2, z_depth / 255.0);
    
    let base_color = glyph.color;
    let pulse = 0.5 + 0.5 * sin(uniforms.time * 5.0 + z_depth);
    let final_color = vec4<f32>(base_color.rgb * pulse, base_color.a * pulse);
    
    // Rasterize a small sphere instead of a pixel
    let radius = i32(3.0 * scale);
    let cx = i32(glyph.x);
    let cy = i32(glyph.y);
    
    for (var i = -radius; i <= radius; i++) {
        for (var j = -radius; j <= radius; j++) {
            if (i*i + j*j <= radius*radius) {
                draw_pixel(cx + i, cy + j, final_color);
            }
        }
    }
}

// Render a high-frequency token thought (Mind's Eye)
// Opcode 0xCD
fn render_token(glyph: Glyph) {
    let dim = uniforms.resolution;

    // Tokens use a faster pulse frequency
    let pulse = 0.7 + 0.3 * sin(uniforms.time * 12.0);
    let final_color = vec4<f32>(glyph.color.rgb * pulse, glyph.color.a * pulse);

    let px = u32(clamp(glyph.x, 0.0, f32(dim - 1u)));
    let py = u32(clamp(glyph.y, 0.0, f32(dim - 1u)));
    let hilbert_idx = xy_to_hilbert(px, py, dim);

    pixel_buffer[hilbert_idx] = color_to_u32(final_color);
    textureStore(canvas, vec2<i32>(i32(px), i32(py)), final_color);
}

// Render a semantic proximity line between consecutive tokens (Mind's Eye)
// Opcode 0x0A (GLYPH_TOKEN_LINK)
// Draws a faint, fading arc connecting tokens in the reasoning chain
fn render_token_link(glyph: Glyph) {
    let dim = uniforms.resolution;

    // Extract line parameters
    // glyph.x, glyph.y = start position (previous token)
    // glyph.w, glyph.h = end position offset (current token relative to start)
    let x1 = i32(clamp(glyph.x, 0.0, f32(dim - 1u)));
    let y1 = i32(clamp(glyph.y, 0.0, f32(dim - 1u)));
    let x2 = i32(clamp(glyph.x + glyph.w, 0.0, f32(dim - 1u)));
    let y2 = i32(clamp(glyph.y + glyph.h, 0.0, f32(dim - 1u)));

    // Calculate line color with fade based on age
    // Use params.y for age (like thoughts)
    let age = glyph.params.y;
    let age_fade = get_age_fade(age);

    // Line color: faint version of the token color
    // Lower alpha for subtle "connection" effect
    let line_alpha = 0.3 * age_fade * glyph.color.a;
    let line_color = vec4<f32>(glyph.color.rgb * 0.8, line_alpha);

    // Draw the connecting line using existing Bresenham implementation
    draw_line(x1, y1, x2, y2, line_color);
}

// Render a kernel rewrite event (Self-Rewriting Kernel visualization)
// Opcode 0xCC - Visualizes when the daemon rewrites native kernels
fn render_kernel_rewrite(glyph: Glyph) {
    let dim = uniforms.resolution;

    // Kernel rewrites pulse with orange/red color to indicate active optimization
    // Fast pulse to draw attention to rewrite events
    let pulse = 0.5 + 0.5 * sin(uniforms.time * 3.0);

    // Orange-red color for kernel rewrites
    let rewrite_color = vec4<f32>(1.0, 0.3 * pulse, 0.0, 1.0);

    let px = u32(clamp(glyph.x, 0.0, f32(dim - 1u)));
    let py = u32(clamp(glyph.y, 0.0, f32(dim - 1u)));
    let hilbert_idx = xy_to_hilbert(px, py, dim);

    // Blend with existing content for visual continuity
    let existing_packed = pixel_buffer[hilbert_idx];
    let existing_color = u32_to_color(existing_packed);
    let blended = blend_colors_f32(rewrite_color, existing_color);

    pixel_buffer[hilbert_idx] = color_to_u32(blended);
    textureStore(canvas, vec2<i32>(i32(px), i32(py)), blended);
}

// Command structure for the dispatcher
struct GlyphCommand {
    opcode: u32,    // Command opcode (GLYPH_* constants)
    x: i32,         // X coordinate
    y: i32,         // Y coordinate
    width: i32,     // Width (or radius for circles)
    height: i32,    // Height (or second coordinate for lines)
    color: u32,     // Packed color (0xRRGGBBAA)
}

// Renderer state for tracking current color across commands
struct RendererState {
    current_color: u32,  // Current drawing color (0xRRGGBBAA)
}

var<private> state: RendererState;

// Helper function to convert packed u32 color (0xRRGGBBAA) to vec4<f32> (0.0-1.0)
fn unpack_color_to_f32(color: u32) -> vec4<f32> {
    return u32_to_color(color);
}

// Execute a glyph command
fn execute_command(cmd: GlyphCommand) {
    switch (cmd.opcode) {
        case GLYPH_NOP: {
            // Do nothing
        }
        case GLYPH_SET_COLOR: {
            state.current_color = cmd.color;
        }
        case GLYPH_DRAW_PIXEL: {
            let color_f32 = unpack_color_to_f32(cmd.color);
            draw_pixel(cmd.x, cmd.y, color_f32);
        }
        case GLYPH_FILL_RECT: {
            let color_f32 = unpack_color_to_f32(cmd.color);
            fill_rect(cmd.x, cmd.y, cmd.width, cmd.height, color_f32);
        }
        case GLYPH_DRAW_RECT: {
            let color_f32 = unpack_color_to_f32(cmd.color);
            draw_rect(cmd.x, cmd.y, cmd.width, cmd.height, color_f32);
        }
        case GLYPH_DRAW_CIRCLE: {
            let color_f32 = unpack_color_to_f32(cmd.color);
            draw_circle(cmd.x, cmd.y, cmd.width, color_f32);  // width = radius
        }
        case GLYPH_FILL_CIRCLE: {
            // TODO: Implement fill_circle
            // For now, just draw the outline
            let color_f32 = unpack_color_to_f32(cmd.color);
            draw_circle(cmd.x, cmd.y, cmd.width, color_f32);
        }
        case GLYPH_DRAW_LINE: {
            let color_f32 = unpack_color_to_f32(cmd.color);
            draw_line(cmd.x, cmd.y, cmd.width, cmd.height, color_f32);
        }
        case GLYPH_THOUGHT_RENDER: {
            // Convert GlyphCommand to Glyph format for thought rendering
            let thought_glyph = Glyph(
                cmd.opcode,
                f32(cmd.x),
                f32(cmd.y),
                f32(cmd.width),
                f32(cmd.height),
                unpack_color_to_f32(cmd.color),
                vec4<f32>(f32(cmd.width), 0.0, 1.0, 0.0) // type from width, age=0, intensity=1
            );
            render_thought(thought_glyph);
        }
        case GLYPH_TOKEN_RENDER: {
            let token_glyph = Glyph(
                cmd.opcode,
                f32(cmd.x),
                f32(cmd.y),
                f32(cmd.width),
                f32(cmd.height),
                unpack_color_to_f32(cmd.color),
                vec4<f32>(0.0, 0.0, 1.0, 0.0)
            );
            render_token(token_glyph);
        }
        case 0xDFu: { // KERNEL_REWRITE
            // Pulsing orange visual for kernel modification
            let dim = uniforms.resolution;
            let idx = xy_to_hilbert(u32(glyph.x), u32(glyph.y), dim);
            
            let pulse = 0.5 + 0.5 * sin(uniforms.time * 5.0);
            let rewrite_color = vec4<f32>(1.0, 0.4 * pulse, 0.0, 1.0);
            
            pixel_buffer[idx] = color_to_u32(rewrite_color);
        }
        default: {
            // Ignore unknown opcode
        }
    }
}

// Main rendering entry point
@compute @workgroup_size(64, 1, 1)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let glyph_idx = global_id.x;
    if (glyph_idx >= glyph_buffer.count) {
        return;
    }

    let glyph = glyph_buffer.glyphs[glyph_idx];

    switch (glyph.opcode) {
        case 0xC3u: { // DRAW_RECT
            render_rect_outline(glyph);
        }
        case 0xC4u: { // FILL_RECT
            render_rect_filled(glyph);
        }
        case 0xCFu: { // DRAW_PIXEL
            let px = u32(glyph.x);
            let py = u32(glyph.y);
            if (px < uniforms.resolution && py < uniforms.resolution) {
                textureStore(canvas, vec2<u32>(px, py), glyph.color);
            }
        }
        case 0xCEu: { // THOUGHT_RENDER (opcode 0xCE)
            // Full thought rendering with type-based color mapping,
            // age-based pulse effects, and Hilbert curve coordinates
            render_thought(glyph);
        }
        case 0xCDu: { // TOKEN_RENDER (opcode 0xCD)
            render_token(glyph);
        }
        case 0x0Au: { // TOKEN_LINK (opcode 0x0A)
            render_token_link(glyph);
        }
        case 0xCCu: { // KERNEL_REWRITE (opcode 0xCC)
            render_kernel_rewrite(glyph);
        }
        default: {} // SET_COLOR (0xC0) is handled as state by the caller
    }
}

fn render_rect_filled(glyph: Glyph) {
    let x_start = u32(max(0.0, glyph.x));
    let y_start = u32(max(0.0, glyph.y));
    let x_end = u32(min(f32(uniforms.resolution), glyph.x + glyph.w));
    let y_end = u32(min(f32(uniforms.resolution), glyph.y + glyph.h));

    for (var y = y_start; y < y_end; y++) {
        for (var x = x_start; x < x_end; x++) {
            textureStore(canvas, vec2<u32>(x, y), glyph.color);
        }
    }
}

fn render_rect_outline(glyph: Glyph) {
    let x_start = u32(max(0.0, glyph.x));
    let y_start = u32(max(0.0, glyph.y));
    let x_end = u32(min(f32(uniforms.resolution), glyph.x + glyph.w)) - 1u;
    let y_end = u32(min(f32(uniforms.resolution), glyph.y + glyph.h)) - 1u;

    // Horizontal lines
    for (var x = x_start; x <= x_end; x++) {
        textureStore(canvas, vec2<u32>(x, y_start), glyph.color);
        textureStore(canvas, vec2<u32>(x, y_end), glyph.color);
    }
    // Vertical lines
    for (var y = y_start; y <= y_end; y++) {
        textureStore(canvas, vec2<u32>(x_start, y), glyph.color);
        textureStore(canvas, vec2<u32>(x_end, y), glyph.color);
    }
}

// ═══════════════════════════════════════════════════════════════════════════════
// COMMAND BUFFER FOR BATCH RENDERING
// ═══════════════════════════════════════════════════════════════════════════════

// Command buffer structure for batch rendering
struct CommandBuffer {
    count: atomic<u32>,                    // Atomic counter for commands
    commands: array<GlyphCommand, 4096>,   // Command array
}

// Global state for tracking rendering progress
struct RenderState {
    commands_processed: atomic<u32>,       // Total commands processed
    current_batch: atomic<u32>,            // Current batch being processed
    clear_color: vec4<f32>,                // Color to use when clearing
}

// Additional bindings for command buffer rendering
@group(0) @binding(3) var<storage, read_write> cmd_buffer: CommandBuffer;
@group(0) @binding(4) var<storage, read_write> render_state: RenderState;

// ═══════════════════════════════════════════════════════════════════════════════
// COMPUTE SHADER ENTRY POINTS
// ═══════════════════════════════════════════════════════════════════════════════

// Main compute shader - one thread per command
@compute @workgroup_size(64)
fn render_glyphs(
    @builtin(global_invocation_id) global_id: vec3<u32>,
    @builtin(local_invocation_id) local_id: vec3<u32>,
    @builtin(workgroup_id) workgroup_id: vec3<u32>
) {
    let cmd_idx = global_id.x;
    let total_cmds = atomicLoad(&cmd_buffer.count);

    if (cmd_idx >= total_cmds) {
        return;
    }

    // Execute command
    let cmd = cmd_buffer.commands[cmd_idx];
    execute_command(cmd);

    // Track processed commands
    atomicAdd(&render_state.commands_processed, 1u);
}

// Batched renderer - one workgroup per batch of commands
// Each workgroup processes up to 64 commands (workgroup_size)
// Useful for better cache locality when commands are spatially coherent
@compute @workgroup_size(64)
fn render_glyphs_batched(
    @builtin(global_invocation_id) global_id: vec3<u32>,
    @builtin(local_invocation_id) local_id: vec3<u32>,
    @builtin(workgroup_id) workgroup_id: vec3<u32>
) {
    let batch_idx = workgroup_id.x;
    let local_idx = local_id.x;
    let batch_size = 64u;

    // Calculate command index within this batch
    let cmd_idx = batch_idx * batch_size + local_idx;
    let total_cmds = atomicLoad(&cmd_buffer.count);

    if (cmd_idx >= total_cmds) {
        return;
    }

    // Execute command
    let cmd = cmd_buffer.commands[cmd_idx];
    execute_command(cmd);

    // Only one thread per workgroup updates the counter
    if (local_idx == 0u) {
        let cmds_in_batch = min(batch_size, total_cmds - batch_idx * batch_size);
        atomicAdd(&render_state.commands_processed, cmds_in_batch);
    }
}

// Clear the canvas to a specified color
// Uses 16x16 workgroup for efficient 2D parallel clearing
@compute @workgroup_size(16, 16)
fn clear_canvas(
    @builtin(global_invocation_id) global_id: vec3<u32>
) {
    let x = global_id.x;
    let y = global_id.y;

    if (x >= uniforms.resolution || y >= uniforms.resolution) {
        return;
    }

    // Use clear color from render state, or default to transparent black
    let clear_color = render_state.clear_color;
    textureStore(canvas, vec2<i32>(i32(x), i32(y)), clear_color);
}

// ═══════════════════════════════════════════════════════════════════════════════
// BUFFER/TEXTURE UTILITIES
// ═══════════════════════════════════════════════════════════════════════════════

// Copy Hilbert-indexed pixel buffer to output texture
// Call after rendering to make result visible
@compute @workgroup_size(16, 16)
fn copy_hilbert_to_texture(
    @builtin(global_invocation_id) global_id: vec3<u32>
) {
    let x = global_id.x;
    let y = global_id.y;
    let dim = uniforms.resolution;

    if (x >= dim || y >= dim) {
        return;
    }

    // Get pixel from Hilbert buffer
    let hilbert_idx = xy_to_hilbert(x, y, dim);
    let color_packed = pixel_buffer[hilbert_idx];
    let color = u32_to_color(color_packed);

    // Write to output texture
    textureStore(canvas, vec2<i32>(i32(x), i32(y)), color);
}

// Clear the Hilbert-indexed pixel buffer
@compute @workgroup_size(256)
fn clear_hilbert_buffer(
    @builtin(global_invocation_id) global_id: vec3<u32>
) {
    let idx = global_id.x;
    let dim = uniforms.resolution;
    let size = dim * dim;

    if (idx < size) {
        pixel_buffer[idx] = 0u; // Transparent black
    }
}
