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
@group(0) @binding(1) var terminal_ram: texture_2d<u32>;
@group(0) @binding(2) var<storage, read> font_atlas: array<u32>; // 95 * 16 u32s
@group(0) @binding(3) var output_texture: texture_storage_2d<rgba8unorm, write>;

// Hilbert curve helper (d to xy)
fn d2xy(n: u32, d_in: u32) -> vec2<u32> {
    var x = 0u;
    var y = 0u;
    var s = 1u;
    var d = d_in;
    while (s < n) {
        let rx = 1u & (d / 2u);
        let ry = 1u & (d ^ rx);
        if (ry == 0u) {
            if (rx == 1u) {
                x = s - 1u - x;
                y = s - 1u - y;
            }
            let t = x;
            x = y;
            y = t;
        }
        x += s * rx;
        y += s * ry;
        d /= 4u;
        s *= 2u;
    }
    return vec2<u32>(x, y);
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

    // Resolve cell index via Hilbert mapping in the RAM texture
    let grid_size = 256u; // Matches GeometricVM
    let cell_linear_idx = cell_y * uniforms.cols + cell_x + 1000u; // Offset matches PUTC in v3 shader
    let coords = d2xy(grid_size, cell_linear_idx);
    
    let cell_pixel = textureLoad(terminal_ram, vec2<i32>(coords), 0);

    // Decode cell data (RGBA)
    let ch = cell_pixel.r;
    let fg_idx = cell_pixel.g;
    let bg_idx = cell_pixel.b;
    let flags = cell_pixel.a;

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
