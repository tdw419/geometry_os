// ============================================
// GEOMETRY OS - MSDF TEXT SHADER
// Phase 37.2: Variable-Width Glyph Rendering
// High-performance vector-like text rendering
// ============================================

struct Uniforms {
    screen_size: vec2<f32>,
    camera_pos: vec2<f32>,
    zoom: f32,
    grid_size: f32,
    grid_opacity: f32,
    time: f32,
    rts_texture_size: vec2<f32>,
    _padding2: vec2<f32>,
}

struct TextStats {
    cursor_pos: u32,
    length: u32,
    capacity: u32,
    dirty: u32,
    // Phase 35.1: Selection state
    selection_start: u32,
    selection_end: u32,
    selection_active: u32,
}

// Phase 37.2: Glyph metrics for variable-width rendering
struct GlyphMetrics {
    char_code: u32,
    uv_min_x: f32,
    uv_min_y: f32,
    uv_max_x: f32,
    uv_max_y: f32,
    width: f32,
    height: f32,
    bearing_x: f32,
    bearing_y: f32,
    advance: f32,
    _padding: f32,
}

@group(0) @binding(0) var<uniform> uniforms: Uniforms;
@group(0) @binding(1) var<storage, read_write> text_buffer: array<u32>;
@group(0) @binding(2) var<storage, read_write> stats: TextStats;
@group(0) @binding(3) var font_atlas: texture_2d<f32>;
@group(0) @binding(4) var font_sampler: sampler;
// Phase 37.2: Glyph metrics buffer
@group(0) @binding(5) var<storage, read> glyph_metrics: array<GlyphMetrics>;

struct VertexOutput {
    @builtin(position) position: vec4<f32>,
    @location(0) uv: vec2<f32>,
    @location(1) world_pos: vec2<f32>,
}

fn median(r: f32, g: f32, b: f32) -> f32 {
    return max(min(r, g), min(max(r, g), b));
}

@vertex
fn vs_main(@builtin(vertex_index) vertex_index: u32) -> VertexOutput {
    var out: VertexOutput;
    let x = f32(i32(vertex_index) % 2 * 2 - 1);
    let y = f32(i32(vertex_index) / 2 * 2 - 1);
    out.position = vec4<f32>(x, y, 0.0, 1.0);
    out.uv = vec2<f32>(x * 0.5 + 0.5, 1.0 - (y * 0.5 + 0.5));

    // Map screen UV to world coordinates
    out.world_pos = (out.uv - 0.5) * uniforms.screen_size / uniforms.zoom + uniforms.camera_pos;

    return out;
}

// Word Processor Grid Constants
const GRID_CELL_SIZE: f32 = 40.0;
const GRID_COLUMNS: u32 = 80u;
const GRID_ROWS: u32 = 40u;

// Phase 37.2: Fallback metrics for when glyph_metrics is empty
fn get_fallback_glyph(char_code: u32) -> GlyphMetrics {
    let atlas_cols = 16.0;
    let atlas_rows = 6.0;
    let char_col = f32(char_code % 16u);
    let char_row = f32(char_code / 16u);

    let uv_min_x = char_col / atlas_cols;
    let uv_min_y = char_row / atlas_rows;
    let uv_max_x = (char_col + 1.0) / atlas_cols;
    let uv_max_y = (char_row + 1.0) / atlas_rows;

    return GlyphMetrics(
        char_code,
        uv_min_x, uv_min_y, uv_max_x, uv_max_y,
        40.0, 40.0,  // width, height
        0.0, 28.0,   // bearing_x, bearing_y
        44.0,        // advance
        0.0,         // padding
    );
}

@fragment
fn fs_main(in: VertexOutput) -> @location(0) vec4<f32> {
    // 1. Determine Grid Coordinates
    // For now, center the grid at (0,0) world coordinates
    let grid_origin = vec2<f32>(0.0, 0.0);
    let grid_coord = (in.world_pos - grid_origin) / GRID_CELL_SIZE;

    // Check if within grid bounds
    if (grid_coord.x < 0.0 || grid_coord.x >= f32(GRID_COLUMNS) ||
        grid_coord.y < 0.0 || grid_coord.y >= f32(GRID_ROWS)) {
        discard;
    }

    let cell_x = u32(grid_coord.x);
    let cell_y = u32(grid_coord.y);
    let char_index = cell_y * GRID_COLUMNS + cell_x;

    // Phase 35.1: Check if cell is within selection
    let is_selected = stats.selection_active != 0u && (
        (stats.selection_start <= stats.selection_end &&
         char_index >= stats.selection_start && char_index < stats.selection_end) ||
        (stats.selection_start > stats.selection_end &&
         char_index >= stats.selection_end && char_index < stats.selection_start)
    );

    // 2. Fetch Character from Buffer
    let char_code = text_buffer[char_index];
    if (char_code == 0u) {
        // Render Selection Background (even for empty cells)
        if (is_selected) {
            return vec4<f32>(0.2, 0.4, 0.8, 0.5); // Blue selection background
        }
        // Render Cursor if at current position
        if (char_index == stats.cursor_pos && (u32(uniforms.time * 2.0) % 2u == 0u)) {
             let cursor_uv = fract(grid_coord);
             if (cursor_uv.x < 0.1) {
                 return vec4<f32>(0.0, 1.0, 1.0, 1.0); // Blinking cursor
             }
        }
        discard;
    }

    // 3. Phase 37.2: Fetch Glyph Metrics (with fallback)
    var glyph: GlyphMetrics;
    if (char_code < arrayLength(&glyph_metrics)) {
        glyph = glyph_metrics[char_code];
        // Check if metrics are valid (non-zero advance indicates valid glyph)
        if (glyph.advance <= 0.0) {
            glyph = get_fallback_glyph(char_code);
        }
    } else {
        glyph = get_fallback_glyph(char_code);
    }

    // 4. Phase 37.2: Calculate Glyph Position and UV
    let cell_uv = fract(grid_coord);

    // Map cell UV to glyph UV using metrics
    let atlas_uv = vec2<f32>(
        mix(glyph.uv_min_x, glyph.uv_max_x, cell_uv.x),
        mix(glyph.uv_min_y, glyph.uv_max_y, cell_uv.y)
    );

    // 5. Sample MSDF
    let msd = textureSample(font_atlas, font_sampler, atlas_uv).rgb;
    let sd = median(msd.r, msd.g, msd.b);

    // Distance field refinement
    let screen_pxrate = 2.0 / uniforms.zoom;
    let screen_px_distance = screen_pxrate * (sd - 0.5);
    let opacity = clamp(screen_px_distance + 0.5, 0.0, 1.0);

    // Phase 35.1: Selection color override
    let text_color = select(
        vec3<f32>(0.0, 1.0, 1.0),  // Default cyan
        vec3<f32>(1.0, 1.0, 1.0),  // White for selected text
        is_selected
    );

    if (opacity < 0.01) {
        // Still show selection background for low opacity
        if (is_selected) {
            return vec4<f32>(0.2, 0.4, 0.8, 0.3);
        }
        discard;
    }

    return vec4<f32>(text_color, opacity);
}
