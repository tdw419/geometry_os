/**
 * WebGPU Geometry Standard Renderer
 *
 * GPU-native rendering of Geometry Standard tokens.
 * 0x84 = RECT, 0x85 = CIRC, etc.
 * Fragment shader expands tokens to shapes.
 *
 * Usage:
 *   const renderer = new GeometryGPURenderer(device, canvas);
 *   renderer.render([
 *     { token: 0x84, x: 100, y: 100, w: 64, h: 64, color: 0xFF0000 }
 *   ]);
 */

// =============================================================================
// GEOMETRY TOKEN SHADER (WGSL)
// =============================================================================

const GEOMETRY_SHADER_WGSL = `
// Geometry Standard Token Types
const TOKEN_NULL: u32 = 0x80u;
const TOKEN_MOVE: u32 = 0x81u;
const TOKEN_ZOOM: u32 = 0x82u;
const TOKEN_LINK: u32 = 0x83u;
const TOKEN_RECT: u32 = 0x84u;
const TOKEN_CIRC: u32 = 0x85u;
const TOKEN_TEXT: u32 = 0x86u;
const TOKEN_SPRITE: u32 = 0x87u;
const TOKEN_LAYER: u32 = 0x88u;
const TOKEN_COLOR: u32 = 0x89u;
const TOKEN_ALPHA: u32 = 0x8Au;
const TOKEN_AGENT: u32 = 0x8Bu;
const TOKEN_EMIT: u32 = 0x8Cu;
const TOKEN_LISTEN: u32 = 0x8Du;
const TOKEN_FREEZE: u32 = 0x8Eu;
const TOKEN_THAW: u32 = 0x8Fu;

struct VertexOutput {
  @builtin(position) position: vec4f,
  @location(0) uv: vec2f,
  @location(1) color: vec4f,
  @location(2) token: u32,
  @location(3) params: vec4f,
}

struct TokenData {
  x: f32,
  y: f32,
  token: u32,
  color: u32,      // Packed RGBA
  params: vec4f,   // width, height, radius, etc.
}

struct Uniforms {
  resolution: vec2f,
  camera_pos: vec2f,
  zoom: f32,
  time: f32,
}

@group(0) @binding(0) var<uniform> uniforms: Uniforms;
@group(0) @binding(1) var<storage, read> tokens: array<TokenData>;
@group(0) @binding(2) var texture: texture_2d<f32>;
@group(0) @binding(3) var sampler: sampler;

@vertex
fn vertexMain(
  @builtin(vertex_index) vertexIndex: u32,
  @builtin(instance_index) instanceIndex: u32
) -> VertexOutput {
  var output: VertexOutput;

  let token = tokens[instanceIndex];
  let tokenType = token.token & 0xFFu;

  // Quad vertices
  let quadVerts = array<vec2f, 6>(
    vec2f(0.0, 0.0),
    vec2f(1.0, 0.0),
    vec2f(0.0, 1.0),
    vec2f(0.0, 1.0),
    vec2f(1.0, 0.0),
    vec2f(1.0, 1.0)
  );

  let quadUV = array<vec2f, 6>(
    vec2f(0.0, 0.0),
    vec2f(1.0, 0.0),
    vec2f(0.0, 1.0),
    vec2f(0.0, 1.0),
    vec2f(1.0, 0.0),
    vec2f(1.0, 1.0)
  );

  // Get dimensions based on token type
  var w = token.params.x;
  var h = token.params.y;

  if (tokenType == TOKEN_CIRC) {
    let r = token.params.x;
    w = r * 2.0;
    h = r * 2.0;
  } else if (tokenType == TOKEN_TEXT) {
    w = 8.0;  // Single char width
    h = 8.0;
  }

  let vert = quadVerts[vertexIndex];
  let worldPos = vec2f(token.x + vert.x * w, token.y + vert.y * h);

  // Transform to screen space
  let screenPos = (worldPos - uniforms.camera_pos) * uniforms.zoom + uniforms.resolution * 0.5;

  output.position = vec4f(
    (screenPos.x / uniforms.resolution.x - 0.5) * 2.0,
    -(screenPos.y / uniforms.resolution.y - 0.5) * 2.0,
    0.0, 1.0
  );

  output.uv = quadUV[vertexIndex];
  output.color = unpackColor(token.color);
  output.token = tokenType;
  output.params = token.params;

  return output;
}

@fragment
fn fragmentMain(input: VertexOutput) -> @location(0) vec4f {
  let tokenType = input.token;
  let uv = input.uv;
  var color = input.color;

  // RECT: Simple fill
  if (tokenType == TOKEN_RECT) {
    return color;
  }

  // CIRC: Discard outside circle
  if (tokenType == TOKEN_CIRC) {
    let r = input.params.x;
    let center = vec2f(r, r);
    let pos = uv * vec2f(r * 2.0, r * 2.0);
    let dist = length(pos - center);
    if (dist > r) {
      discard;
    }
    // Anti-aliasing at edge
    let alpha = 1.0 - smoothstep(r - 1.0, r, dist);
    return vec4f(color.rgb, color.a * alpha);
  }

  // TEXT: Sample from font atlas
  if (tokenType == TOKEN_TEXT) {
    let charCode = u32(input.params.x);
    let atlasX = f32(charCode % 16u) / 16.0;
    let atlasY = f32(charCode / 16u) / 16.0;
    let atlasUV = vec2f(atlasX + uv.x / 16.0, atlasY + uv.y / 16.0);

    let texColor = textureSample(texture, sampler, atlasUV);
    let mask = texColor.r;  // Font atlas is grayscale

    if (mask < 0.5) {
      discard;
    }

    return vec4f(color.rgb, color.a * mask);
  }

  // SPRITE: Sample from sprite sheet
  if (tokenType == TOKEN_SPRITE) {
    let spriteId = u32(input.params.x);
    let frame = u32(input.params.y);
    let spriteX = f32(spriteId % 8u) / 8.0;
    let spriteY = f32(spriteId / 8u) / 8.0;
    let spriteUV = vec2f(spriteX + uv.x / 8.0, spriteY + uv.y / 8.0);

    return textureSample(texture, sampler, spriteUV);
  }

  // LINK: Render as hexagon portal
  if (tokenType == TOKEN_LINK) {
    let size = min(input.params.x, input.params.y);
    let center = vec2f(0.5, 0.5);
    let dist = length(uv - center);

    // Hexagon shape
    let angle = atan2(uv.y - 0.5, uv.x - 0.5);
    let hexDist = 0.5 / max(
      abs(cos(angle)),
      max(abs(cos(angle + 1.047)), abs(cos(angle - 1.047)))
    );

    if (dist > hexDist) {
      discard;
    }

    // Pulsing glow effect
    let pulse = sin(uniforms.time * 3.0) * 0.2 + 0.8;
    return vec4f(color.rgb * pulse, color.a);
  }

  // AGENT: Render as diamond
  if (tokenType == TOKEN_AGENT) {
    let dx = abs(uv.x - 0.5);
    let dy = abs(uv.y - 0.5);
    if (dx + dy > 0.5) {
      discard;
    }
    return color;
  }

  // Default: pass through
  return color;
}

// Helper: Unpack RGBA from u32
fn unpackColor(packed: u32) -> vec4f {
  return vec4f(
    f32((packed >> 24u) & 0xFFu) / 255.0,
    f32((packed >> 16u) & 0xFFu) / 255.0,
    f32((packed >> 8u) & 0xFFu) / 255.0,
    f32(packed & 0xFFu) / 255.0
  );
}
`;


// =============================================================================
// GEOMETRY GPU RENDERER
// =============================================================================

export class GeometryGPURenderer {
  constructor(device, canvas, context = null) {
    this.device = device;
    this.canvas = canvas;
    this.context = context || canvas.getContext('webgpu');

    this.pipeline = null;
    this.uniformBuffer = null;
    this.tokenBuffer = null;
    this.bindGroup = null;
    this.texture = null;
    this.sampler = null;

    this.cameraX = 0;
    this.cameraY = 0;
    this.zoom = 1.0;
    this.time = 0;

    this.maxTokens = 10000;
    this.tokens = [];
  }

  async init() {
    // Configure context
    const format = navigator.gpu.getPreferredCanvasFormat();
    this.context.configure({
      device: this.device,
      format: format,
      alphaMode: 'premultiplied'
    });
    this.format = format;

    // Create shader module
    const shaderModule = this.device.createShaderModule({
      label: 'Geometry Standard Shader',
      code: GEOMETRY_SHADER_WGSL
    });

    // Create uniform buffer
    this.uniformBuffer = this.device.createBuffer({
      label: 'Uniforms',
      size: 32,  // 2 vec2f + 2 f32
      usage: GPUBufferUsage.UNIFORM | GPUBufferUsage.COPY_DST
    });

    // Create token buffer
    this.tokenBuffer = this.device.createBuffer({
      label: 'Tokens',
      size: this.maxTokens * 48,  // sizeof(TokenData) = 48 bytes
      usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST
    });

    // Create default texture (font atlas placeholder)
    await this.createDefaultTexture();

    // Create sampler
    this.sampler = this.device.createSampler({
      magFilter: 'nearest',
      minFilter: 'nearest'
    });

    // Create bind group layout
    const bindGroupLayout = this.device.createBindGroupLayout({
      entries: [
        { binding: 0, visibility: GPUShaderStage.VERTEX | GPUShaderStage.FRAGMENT, buffer: { type: 'uniform' } },
        { binding: 1, visibility: GPUShaderStage.VERTEX | GPUShaderStage.FRAGMENT, buffer: { type: 'read-only-storage' } },
        { binding: 2, visibility: GPUShaderStage.FRAGMENT, texture: { sampleType: 'float' } },
        { binding: 3, visibility: GPUShaderStage.FRAGMENT, sampler: { type: 'filtering' } }
      ]
    });

    // Create bind group
    this.bindGroup = this.device.createBindGroup({
      layout: bindGroupLayout,
      entries: [
        { binding: 0, resource: { buffer: this.uniformBuffer } },
        { binding: 1, resource: { buffer: this.tokenBuffer } },
        { binding: 2, resource: this.texture.createView() },
        { binding: 3, resource: this.sampler }
      ]
    });

    // Create pipeline
    this.pipeline = this.device.createRenderPipeline({
      layout: this.device.createPipelineLayout({
        bindGroupLayouts: [bindGroupLayout]
      }),
      vertex: {
        module: shaderModule,
        entryPoint: 'vertexMain'
      },
      fragment: {
        module: shaderModule,
        entryPoint: 'fragmentMain',
        targets: [{
          format: format,
          blend: {
            color: { srcFactor: 'src-alpha', dstFactor: 'one-minus-src-alpha', operation: 'add' },
            alpha: { srcFactor: 'one', dstFactor: 'one-minus-src-alpha', operation: 'add' }
          }
        }]
      },
      primitive: {
        topology: 'triangle-list'
      }
    });

    console.log('GeometryGPURenderer initialized');
  }

  async createDefaultTexture() {
    // Create a simple 128x128 font atlas placeholder
    const size = 128;
    const data = new Uint8Array(size * size * 4);

    // Fill with simple grid pattern (placeholder for actual font atlas)
    for (let y = 0; y < size; y++) {
      for (let x = 0; x < size; x++) {
        const idx = (y * size + x) * 4;
        const cellX = x % 8;
        const cellY = y % 8;
        // Simple 'A' shape in first cell
        if (x < 8 && y < 8) {
          if ((y === 1 && cellX >= 2 && cellX <= 5) ||
              (y === 2 && (cellX === 1 || cellX === 6)) ||
              (y === 3 && (cellX === 1 || cellX === 6)) ||
              (y === 4 && (cellX === 1 || cellX === 6 || (cellX >= 3 && cellX <= 4))) ||
              (y === 5 && (cellX === 1 || cellX === 6)) ||
              (y === 6 && (cellX === 1 || cellX === 6))) {
            data[idx] = 255;
            data[idx + 1] = 255;
            data[idx + 2] = 255;
            data[idx + 3] = 255;
          }
        }
      }
    }

    this.texture = this.device.createTexture({
      size: [size, size],
      format: 'rgba8unorm',
      usage: GPUTextureUsage.TEXTURE_BINDING | GPUTextureUsage.COPY_DST
    });

    this.device.queue.writeTexture(
      { texture: this.texture },
      data,
      { bytesPerRow: size * 4 },
      [size, size]
    );
  }

  /**
   * Add a geometry token to render
   */
  addRect(x, y, w, h, r, g, b, a = 255) {
    this.tokens.push({
      x, y,
      token: 0x84,
      color: (r << 24) | (g << 16) | (b << 8) | a,
      params: [w, h, 0, 0]
    });
  }

  addCircle(x, y, radius, r, g, b, a = 255) {
    this.tokens.push({
      x: x - radius, y: y - radius,
      token: 0x85,
      color: (r << 24) | (g << 16) | (b << 8) | a,
      params: [radius, 0, 0, 0]
    });
  }

  addText(x, y, charCode, r, g, b, a = 255) {
    this.tokens.push({
      x, y,
      token: 0x86,
      color: (r << 24) | (g << 16) | (b << 8) | a,
      params: [charCode, 1, 0, 0]
    });
  }

  addLink(x, y, w, h, r, g, b, a = 255) {
    this.tokens.push({
      x, y,
      token: 0x83,
      color: (r << 24) | (g << 16) | (b << 8) | a,
      params: [w, h, 0, 0]
    });
  }

  addAgent(x, y, size, r, g, b, a = 255) {
    this.tokens.push({
      x, y,
      token: 0x8B,
      color: (r << 24) | (g << 16) | (b << 8) | a,
      params: [size, size, 0, 0]
    });
  }

  clear() {
    this.tokens = [];
  }

  /**
   * Update camera position
   */
  setCamera(x, y, zoom = 1.0) {
    this.cameraX = x;
    this.cameraY = y;
    this.zoom = zoom;
  }

  /**
   * Render all tokens
   */
  render(commandEncoder = null) {
    if (this.tokens.length === 0) return;

    const ownEncoder = !commandEncoder;
    if (ownEncoder) {
      commandEncoder = this.device.createCommandEncoder();
    }

    // Update uniforms
    const uniformData = new Float32Array([
      this.canvas.width, this.canvas.height,
      this.cameraX, this.cameraY,
      this.zoom, this.time
    ]);
    this.device.queue.writeBuffer(this.uniformBuffer, 0, uniformData);

    // Update tokens
    const tokenData = new Float32Array(this.tokens.length * 12);
    for (let i = 0; i < this.tokens.length; i++) {
      const t = this.tokens[i];
      const offset = i * 12;
      tokenData[offset] = t.x;
      tokenData[offset + 1] = t.y;
      tokenData[offset + 2] = t.token;
      tokenData[offset + 3] = t.color;
      tokenData[offset + 4] = t.params[0];
      tokenData[offset + 5] = t.params[1];
      tokenData[offset + 6] = t.params[2];
      tokenData[offset + 7] = t.params[3];
    }
    this.device.queue.writeBuffer(this.tokenBuffer, 0, tokenData);

    // Render pass
    const textureView = this.context.getCurrentTexture().createView();
    const renderPass = commandEncoder.beginRenderPass({
      colorAttachments: [{
        view: textureView,
        clearValue: { r: 0.04, g: 0.04, b: 0.08, a: 1.0 },
        loadOp: 'clear',
        storeOp: 'store'
      }]
    });

    renderPass.setPipeline(this.pipeline);
    renderPass.setBindGroup(0, this.bindGroup);
    renderPass.draw(6, this.tokens.length);  // 6 vertices per quad, N instances
    renderPass.end();

    if (ownEncoder) {
      this.device.queue.submit([commandEncoder.finish()]);
    }

    this.time += 0.016;  // ~60fps
  }
}


// =============================================================================
// INITIALIZATION HELPER
// =============================================================================

export async function createGPURenderer(canvas) {
  if (!navigator.gpu) {
    throw new Error('WebGPU not supported');
  }

  const adapter = await navigator.gpu.requestAdapter();
  if (!adapter) {
    throw new Error('No GPU adapter found');
  }

  const device = await adapter.requestDevice();

  const renderer = new GeometryGPURenderer(device, canvas);
  await renderer.init();

  return renderer;
}


// =============================================================================
// DEFAULT EXPORT
// =============================================================================

export default {
  GeometryGPURenderer,
  createGPURenderer,
  GEOMETRY_SHADER_WGSL
};
