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
