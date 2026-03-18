// Glyph Shell WGSL - Native Rasterization Pipeline
//
// Supports two modes:
// 1. Fullscreen: Renders substrate covering entire viewport (for compatibility)
// 2. Positioned: Renders substrate at specific screen position (for text overlays)

struct GlyphUniforms {
    // Screen position in pixels (top-left corner)
    position: vec2<f32>,
    // Size in pixels
    size: vec2<f32>,
    // Screen dimensions for NDC conversion
    screen_size: vec2<f32>,
    // 1.0 for positioned mode, 0.0 for fullscreen
    positioned: f32,
    // Padding for 16-byte alignment
    _pad: f32,
}

struct VertexOutput {
    @builtin(position) position: vec4<f32>,
    @location(0) uv: vec2<f32>,
};

@group(0) @binding(0)
var<storage, read> substrate: array<u32>;

@group(0) @binding(1)
var<uniform> uniforms: GlyphUniforms;

@vertex
fn vs_main(@builtin(vertex_index) vertex_index: u32) -> VertexOutput {
    var out: VertexOutput;
    
    // Quad vertices: (0,0), (1,0), (0,1), (1,1)
    let x = f32(vertex_index % 2u);
    let y = f32(vertex_index / 2u);
    
    // UV coordinates (flip Y)
    out.uv = vec2<f32>(x, 1.0 - y);
    
    if (uniforms.positioned > 0.5) {
        // Positioned mode: render quad at specific screen location
        let px = uniforms.position.x + x * uniforms.size.x;
        let py = uniforms.position.y + y * uniforms.size.y;
        
        // Convert to NDC (-1 to 1)
        let ndc_x = (px / uniforms.screen_size.x) * 2.0 - 1.0;
        let ndc_y = 1.0 - (py / uniforms.screen_size.y) * 2.0; // Flip Y for NDC
        
        out.position = vec4<f32>(ndc_x, ndc_y, 0.0, 1.0);
    } else {
        // Fullscreen mode: cover entire viewport (backward compatibility)
        out.position = vec4<f32>(x * 2.0 - 1.0, y * 2.0 - 1.0, 0.0, 1.0);
    }
    
    return out;
}

@fragment
fn fs_main(in: VertexOutput) -> @location(0) vec4<f32> {
    // Substrate dimensions (order 8 = 256x256)
    let grid_size = 256u;
    let px = u32(in.uv.x * f32(grid_size));
    let py = u32(in.uv.y * f32(grid_size));
    
    // Sample substrate at this location
    let idx = px + py * grid_size;
    if (idx >= arrayLength(&substrate)) {
        return vec4<f32>(0.0, 0.0, 0.0, 0.0); // Out of bounds = transparent
    }
    
    let color_u32 = substrate[idx];
    
    // Unpack RGBA from u32 (ABGR format)
    let r = f32((color_u32 >> 0u) & 0xFFu) / 255.0;
    let g = f32((color_u32 >> 8u) & 0xFFu) / 255.0;
    let b = f32((color_u32 >> 16u) & 0xFFu) / 255.0;
    let a = f32((color_u32 >> 24u) & 0xFFu) / 255.0;
    
    return vec4<f32>(r, g, b, a);
}
