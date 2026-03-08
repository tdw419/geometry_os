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
