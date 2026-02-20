// GEOMETRY OS - Terminal Renderer Shader
// Compute shader for cell-based terminal rendering

struct TerminalUniforms {
    rows: u32,
    cols: u32,
    cursor_x: u32,
    cursor_y: u32,
    cursor_visible: u32,
    time: f32,
    _padding: vec2<f32>,
};

@group(0) @binding(0) var<uniform> uniforms: TerminalUniforms;
@group(0) @binding(1) var<storage, read> terminal_buffer: array<u32>;
@group(0) @binding(2) var<storage, read> font_atlas: array<u32>; // 95 * 16 u32s (each u32 is a row of 8 bits)
@group(0) @binding(3) var output_texture: texture_storage_2d<rgba8unorm, write>;

// Terminal Colors (standard 16-color palette)
fn get_color(idx: u32) -> vec4<f32> {
    switch (idx) {
        case 0u:  { return vec4<f32>(0.0, 0.0, 0.0, 1.0); }       // Black
        case 1u:  { return vec4<f32>(0.76, 0.21, 0.13, 1.0); }    // Red
        case 2u:  { return vec4<f32>(0.15, 0.74, 0.14, 1.0); }    // Green
        case 3u:  { return vec4<f32>(0.68, 0.68, 0.15, 1.0); }    // Yellow
        case 4u:  { return vec4<f32>(0.29, 0.18, 0.88, 1.0); }    // Blue
        case 5u:  { return vec4<f32>(0.83, 0.22, 0.83, 1.0); }    // Magenta
        case 6u:  { return vec4<f32>(0.20, 0.73, 0.78, 1.0); }    // Cyan
        case 7u:  { return vec4<f32>(0.80, 0.80, 0.80, 1.0); }    // White
        case 8u:  { return vec4<f32>(0.50, 0.50, 0.50, 1.0); }    // Bright Black
        case 9u:  { return vec4<f32>(1.00, 0.00, 0.00, 1.0); }    // Bright Red
        case 10u: { return vec4<f32>(0.00, 1.00, 0.00, 1.0); }    // Bright Green
        case 11u: { return vec4<f32>(1.00, 1.00, 0.00, 1.0); }    // Bright Yellow
        case 12u: { return vec4<f32>(0.37, 0.51, 0.95, 1.0); }    // Bright Blue
        case 13u: { return vec4<f32>(1.00, 0.00, 1.00, 1.0); }    // Bright Magenta
        case 14u: { return vec4<f32>(0.00, 1.00, 1.00, 1.0); }    // Bright Cyan
        case 15u: { return vec4<f32>(1.00, 1.00, 1.00, 1.0); }    // Bright White
        default:  { return vec4<f32>(0.0, 0.0, 0.0, 1.0); }
    }
}

@compute @workgroup_size(16, 16)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let x = global_id.x;
    let y = global_id.y;

    let char_w = 8u;
    let char_h = 16u;
    let width = uniforms.cols * char_w;
    let height = uniforms.rows * char_h;

    if (x >= width || y >= height) {
        return;
    }

    let cell_x = x / char_w;
    let cell_y = y / char_h;
    let pixel_in_cell_x = x % char_w;
    let pixel_in_cell_y = y % char_h;

    let cell_idx = cell_y * uniforms.cols + cell_x;
    let cell_data = terminal_buffer[cell_idx];

    // Decode cell data: [char(8), fg(8), bg(8), flags(8)]
    let ch = (cell_data >> 24u) & 0xFFu;
    let fg_idx = (cell_data >> 16u) & 0xFFu;
    let bg_idx = (cell_data >> 8u) & 0xFFu;
    let flags = cell_data & 0xFFu;

    // Flags: 1=bold, 2=dim, 4=italic, 8=underline, 16=blink, 32=inverse
    let is_inverse = (flags & 32u) != 0u;
    let is_bold = (flags & 1u) != 0u;
    let is_blink = (flags & 16u) != 0u;
    
    var fg = get_color(fg_idx);
    var bg = get_color(bg_idx);

    if (is_inverse) {
        let temp = fg;
        fg = bg;
        bg = temp;
    }

    // Handle cursor
    var is_at_cursor = (cell_x == uniforms.cursor_x && cell_y == uniforms.cursor_y);
    if (is_at_cursor && uniforms.cursor_visible != 0u) {
        // Simple invert cursor for now
        let temp = fg;
        fg = bg;
        bg = temp;
    }

    // Font sampling
    var color = bg;
    if (ch >= 32u && ch <= 127u) {
        let font_idx = (ch - 32u) * 16u + pixel_in_cell_y;
        let row_data = font_atlas[font_idx];
        
        // Rows in FONT_8X16 are u8, but stored in u32 array.
        // Bit 7 is leftmost pixel.
        let pixel_on = (row_data >> (7u - pixel_in_cell_x)) & 1u;
        if (pixel_on != 0u) {
            color = fg;
        }
    }

    textureStore(output_texture, vec2<i32>(i32(x), i32(y)), color);
}
