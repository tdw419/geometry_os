/**
 * WebGPU Geometry Renderer
 * 
 * Uses GPU shaders to render Geometry Standard tokens (0x80-0x8F)
 * at hardware speed. Offloads rendering from CPU to RTX 5090.
 * 
 * Usage:
 *   const renderer = await WebGPURenderer.init(canvas);
 *   renderer.renderTokens(tokens);
 */

class WebGPURenderer {
  constructor(device, context, pipeline, uniformBuffer, fontTexture) {
    this.device = device;
    this.context = context;
    this.pipeline = pipeline;
    this.uniformBuffer = uniformBuffer;
    this.fontTexture = fontTexture;
    this.frameCount = 0;
  }
  
  static async init(canvas) {
    // Initialize WebGPU
    if (!navigator.gpu) {
      console.warn('WebGPU not supported, falling back to Canvas2D');
      return null;
    }
    
    const adapter = await navigator.gpu.requestAdapter();
    if (!adapter) {
      console.warn('No GPU adapter found');
      return null;
    }
    
    const device = await adapter.requestDevice();
    const context = canvas.getContext('webgpu');
    
    const format = navigator.gpu.getPreferredCanvasFormat();
    context.configure({
      device,
      format,
      alphaMode: 'premultiplied',
    });
    
    // Load shader
    const shaderModule = device.createShaderModule({
      code: await fetch('geometryShader.wgsl').then(r => r.text()),
    });
    
    // Create pipeline
    const pipeline = device.createRenderPipeline({
      layout: 'auto',
      vertex: {
        module: shaderModule,
        entryPoint: 'vertexMain',
        buffers: [{
          arrayStride: 32,  // 8 floats per vertex
          attributes: [
            { shaderLocation: 0, offset: 0, format: 'float32x2' },   // position
            { shaderLocation: 1, offset: 8, format: 'float32' },     // token
            { shaderLocation: 2, offset: 16, format: 'float32x4' },  // params
          ],
        }],
      },
      fragment: {
        module: shaderModule,
        entryPoint: 'fragmentMain',
        targets: [{
          format,
          blend: {
            color: { srcFactor: 'src-alpha', dstFactor: 'one-minus-src-alpha' },
            alpha: { srcFactor: 'one', dstFactor: 'one' },
          },
        }],
      },
      primitive: { topology: 'triangle-strip' },
    });
    
    // Create uniform buffer
    const uniformBuffer = device.createBuffer({
      size: 16,  // 4 floats
      usage: GPUBufferUsage.UNIFORM | GPUBufferUsage.COPY_DST,
    });
    
    // Load font atlas texture
    const fontTexture = await WebGPURenderer.loadFontAtlas(device);
    
    return new WebGPURenderer(device, context, pipeline, uniformBuffer, fontTexture);
  }
  
  static async loadFontAtlas(device) {
    // Create 8x8 bitmap font atlas (256 chars)
    const size = 256;  // 16x16 grid of 16x16 chars
    const data = new Uint8Array(size * size * 4);
    
    // TODO: Load actual font atlas from bitmapFont.js
    // For now, create placeholder
    for (let i = 0; i < 256; i++) {
      const cx = (i % 16) * 16;
      const cy = Math.floor(i / 16) * 16;
      
      // Fill with pattern based on char code
      for (let y = 0; y < 16; y++) {
        for (let x = 0; x < 16; x++) {
          const idx = ((cy + y) * size + (cx + x)) * 4;
          const brightness = ((i ^ (x * y)) & 0xFF) / 255;
          data[idx] = brightness * 255;     // R
          data[idx + 1] = brightness * 255; // G
          data[idx + 2] = brightness * 255; // B
          data[idx + 3] = 255;              // A
        }
      }
    }
    
    const texture = device.createTexture({
      size: [size, size],
      format: 'rgba8unorm',
      usage: GPUTextureUsage.TEXTURE_BINDING | GPUTextureUsage.COPY_DST,
    });
    
    device.queue.writeTexture(
      { texture },
      data,
      { bytesPerRow: size * 4 },
      [size, size]
    );
    
    return texture;
  }
  
  /**
   * Render Geometry Tokens
   * @param {Array} tokens - Array of {x, y, token, params, color}
   * @param {Object} camera - {x, y, zoom}
   */
  render(tokens, camera) {
    const commandEncoder = this.device.createCommandEncoder();
    
    // Update uniforms
    const uniforms = new Float32Array([
      this.context.canvas.width,
      this.context.canvas.height,
      camera.x,
      camera.y,
    ]);
    this.device.queue.writeBuffer(this.uniformBuffer, 0, uniforms);
    
    // Create vertex buffer from tokens
    const vertices = new Float32Array(tokens.length * 8);
    for (let i = 0; i < tokens.length; i++) {
      const t = tokens[i];
      const offset = i * 8;
      vertices[offset] = t.x;
      vertices[offset + 1] = t.y;
      vertices[offset + 2] = t.token;
      vertices[offset + 3] = 0;  // padding
      vertices[offset + 4] = t.params?.x || 16;
      vertices[offset + 5] = t.params?.y || 16;
      vertices[offset + 6] = t.color || 0xFFFFFFFF;
      vertices[offset + 7] = t.alpha || 1.0;
    }
    
    const vertexBuffer = this.device.createBuffer({
      size: vertices.byteLength,
      usage: GPUBufferUsage.VERTEX | GPUBufferUsage.COPY_DST,
    });
    this.device.queue.writeBuffer(vertexBuffer, 0, vertices);
    
    // Render pass
    const textureView = this.context.getCurrentTexture().createView();
    const renderPass = commandEncoder.beginRenderPass({
      colorAttachments: [{
        view: textureView,
        clearValue: { r: 0.05, g: 0.05, b: 0.1, a: 1.0 },
        loadOp: 'clear',
        storeOp: 'store',
      }],
    });
    
    renderPass.setPipeline(this.pipeline);
    renderPass.setVertexBuffer(0, vertexBuffer);
    renderPass.draw(4 * tokens.length);  // 4 vertices per token
    renderPass.end();
    
    this.device.queue.submit([commandEncoder.finish()]);
    this.frameCount++;
  }
  
  /**
   * Render with compute shader (batch processing)
   * Runs security validation on GPU
   */
  renderWithCompute(tokens, camera) {
    const commandEncoder = this.device.createCommandEncoder();
    
    // Create token buffer
    const tokenData = new Uint32Array(tokens.length * 2);
    for (let i = 0; i < tokens.length; i++) {
      const t = tokens[i];
      tokenData[i * 2] = (t.x & 0xFFFF) | ((t.y & 0xFFFF) << 16) | (t.token << 32);
      tokenData[i * 2 + 1] = t.color;
    }
    
    const tokenBuffer = this.device.createBuffer({
      size: tokenData.byteLength,
      usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST,
    });
    this.device.queue.writeBuffer(tokenBuffer, 0, tokenData);
    
    // Output buffer for GPU-validated pixels
    const outputBuffer = this.device.createBuffer({
      size: tokens.length * 16,  // 4 bytes per pixel
      usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_SRC,
    });
    
    // TODO: Run compute shader for batch validation
    // This would call computeMain() from geometryShader.wgsl
    
    this.device.queue.submit([commandEncoder.finish()]);
  }
}

// Export for use in index.html
if (typeof module !== 'undefined') {
  module.exports = { WebGPURenderer };
}
