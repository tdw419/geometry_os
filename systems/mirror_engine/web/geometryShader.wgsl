// Geometry Token Shader - WebGPU WGSL
// Renders Geometry Standard tokens (0x80-0x8F) directly on GPU
// 
// Usage:
//   1. Upload font atlas as texture
//   2. Send token buffer: [x, y, token, color, ...]
//   3. GPU expands tokens to shapes

struct VertexOutput {
    @builtin(position) position: vec4<f32>,
    @location(0) uv: vec2<f32>,
    @location(1) color: vec4<f32>,
    @location(2) token_type: f32,
}

struct Uniforms {
    resolution: vec2<f32>,
    camera_offset: vec2<f32>,
    zoom: f32,
    time: f32,
}

@group(0) @binding(0) var<uniform> uniforms: Uniforms;
@group(0) @binding(1) var font_atlas: texture_2d<f32>;
@group(0) @binding(2) var font_sampler: sampler;

// Geometry Token Constants
const TOKEN_MOVE: f32 = 0x80;
const TOKEN_ZOOM: f32 = 0x81;
const TOKEN_LINK: f32 = 0x82;
const TOKEN_THREAD: f32 = 0x83;
const TOKEN_RECT: f32 = 0x84;
const TOKEN_CIRC: f32 = 0x85;
const TOKEN_TEXT: f32 = 0x86;
const TOKEN_SPRITE: f32 = 0x87;
const TOKEN_LAYER: f32 = 0x88;
const TOKEN_COLOR: f32 = 0x89;
const TOKEN_ALPHA: f32 = 0x8A;

// Vertex Shader - Expands Geometry Tokens to Vertices
@vertex
fn vertexMain(
    @location(0) position: vec2<f32>,      // Token position
    @location(1) token: f32,               // Geometry token (0x80-0x8F)
    @location(2) params: vec4<f32>,        // Token parameters (w/h/color/etc)
    @builtin(vertex_index) vertexIndex: u32
) -> VertexOutput {
    var output: VertexOutput;
    
    // Calculate screen position
    let screenPos = (position - uniforms.camera_offset) * uniforms.zoom;
    
    // Expand token based on type
    var worldPos = vec2<f32>(0.0, 0.0);
    var size = vec2<f32>(16.0, 16.0);  // Default 16x16 cell
    
    // Token-specific expansion
    let tokenInt = u32(token);
    
    if (tokenInt == u32(TOKEN_RECT)) {
        // RECT: params.xy = width/height
        size = params.xy;
    } else if (tokenInt == u32(TOKEN_CIRC)) {
        // CIRC: params.x = radius
        size = vec2<f32>(params.x * 2.0, params.x * 2.0);
    } else if (tokenInt == u32(TOKEN_TEXT)) {
        // TEXT: use font atlas
        size = vec2<f32>(8.0, 8.0);  // 8x8 bitmap font
    }
    
    // Generate quad vertices (triangle strip)
    let corners = array<vec2<f32>, 4>(
        vec2<f32>(0.0, 0.0),
        vec2<f32>(1.0, 0.0),
        vec2<f32>(0.0, 1.0),
        vec2<f32>(1.0, 1.0)
    );
    
    let corner = corners[vertexIndex];
    worldPos = screenPos + corner * size;
    
    // Convert to clip space
    output.position = vec4<f32>(
        (worldPos.x / uniforms.resolution.x) * 2.0 - 1.0,
        1.0 - (worldPos.y / uniforms.resolution.y) * 2.0,
        0.0,
        1.0
    );
    
    output.uv = corner;
    output.token_type = token;
    
    // Decode color from params.zw (RGBA packed)
    output.color = vec4<f32>(
        f32(u32(params.z) >> 24u) / 255.0,
        f32((u32(params.z) >> 16u) & 0xFFu) / 255.0,
        f32((u32(params.z) >> 8u) & 0xFFu) / 255.0,
        f32(u32(params.z) & 0xFFu) / 255.0
    );
    
    return output;
}

// Fragment Shader - Rasterizes Geometry Tokens
@fragment
fn fragmentMain(input: VertexOutput) -> @location(0) vec4<f32> {
    let tokenInt = u32(input.token_type);
    
    // RECT: Solid fill
    if (tokenInt == u32(TOKEN_RECT)) {
        return input.color;
    }
    
    // CIRC: Circle shape
    if (tokenInt == u32(TOKEN_CIRC)) {
        let center = vec2<f32>(0.5, 0.5);
        let dist = length(input.uv - center);
        if (dist > 0.5) {
            discard;  // Outside circle
        }
        return input.color;
    }
    
    // TEXT: Sample from font atlas
    if (tokenInt == u32(TOKEN_TEXT)) {
        let fontUV = input.uv;
        let fontColor = textureSample(font_atlas, font_sampler, fontUV);
        return fontColor * input.color;
    }
    
    // Default: pass through
    return input.color;
}

// Compute Shader - Batch Token Processing
// Processes entire token buffer in parallel
@compute @workgroup_size(64)
fn computeMain(
    @builtin(global_invocation_id) globalId: vec3<u32>,
    @binding(3) buffer<storage, read> tokenBuffer: array<u32>,
    @binding(4) buffer<storage, read_write> outputBuffer: array<u32>
) {
    let idx = globalId.x;
    
    // Each thread processes one token
    // Token format: [x:16, y:16, token:8, params:24, color:32]
    let packedToken = tokenBuffer[idx * 2];
    let packedColor = tokenBuffer[idx * 2 + 1];
    
    // Unpack
    let x = f32(packedToken & 0xFFFFu);
    let y = f32((packedToken >> 16u) & 0xFFFFu);
    let token = (packedToken >> 32u) & 0xFFu;
    let params = (packedToken >> 40u) & 0xFFFFFFu;
    
    // Security validation (runs on GPU!)
    // Check if agent signature is authorized for this token
    // In production: validate against security.py rules
    let isAuthorized = (token < 0x8Eu) || (params >> 16u >= 0x300u);  // System-only check
    
    if (!isAuthorized) {
        // Write security violation marker
        outputBuffer[idx * 4] = 0xFF0000FFu;  // Red pixel
        return;
    }
    
    // Process token and write to output
    // GPU parallel processing happens here
    outputBuffer[idx * 4] = packedColor;
}
