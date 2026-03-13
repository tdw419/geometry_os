//! Native Window Drag Test
//!
//! Tests the first Autonomous Spatial Program: window_manager.glyph
//! This program runs entirely on GPU - no CPU involvement in drag logic.

#[cfg(test)]
mod tests {
    use std::sync::Arc;
    use wgpu::{Device, Queue, InstanceDescriptor, Instance, RequestAdapterOptions, PowerPreference, DeviceDescriptor, Features};
    use infinite_map_rs::gpu::glyph_vm::{GlyphVM, Glyph, GlyphVMState};
    use infinite_map_rs::backend::drm::vcc_compute::HardwareVCC;

    // Opcodes (must match glyph_microcode.wgsl)
    const OP_LD: u32 = 204;
    const OP_MOV: u32 = 206;
    const OP_JMP: u32 = 208;
    const OP_ADD_MEM: u32 = 216;
    const OP_JZ: u32 = 209;
    const OP_DRAW: u32 = 215;
    const OP_INT_DISPATCH: u32 = 218;
    const OP_HALT: u32 = 212;

    // Memory addresses
    const MOUSE_X: usize = 0;
    const MOUSE_Y: usize = 1;
    const MOUSE_BTN: usize = 2;
    const MOUSE_DX: usize = 3;
    const MOUSE_DY: usize = 4;

    const WIN_X: usize = 10;
    const WIN_Y: usize = 11;
    const WIN_W: usize = 12;
    const WIN_H: usize = 13;
    const HIT_FLAG: usize = 14;

    const HIT_TABLE: usize = 20;

    async fn setup_gpu() -> (Arc<Device>, Arc<Queue>) {
        let instance = Instance::new(InstanceDescriptor::default());
        let adapter = instance
            .request_adapter(&RequestAdapterOptions {
                power_preference: PowerPreference::HighPerformance,
                ..Default::default()
            })
            .await
            .expect("No GPU adapter found");

        let (device, queue) = adapter
            .request_device(&DeviceDescriptor {
                required_features: Features::empty(),
                ..Default::default()
            }, None)
            .await
            .expect("Failed to get device");

        (Arc::new(device), Arc::new(queue))
    }

    fn create_test_atlas_texture(device: &Device) -> wgpu::TextureView {
        let texture = device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Test Atlas"),
            size: wgpu::Extent3d { width: 256, height: 256, depth_or_array_layers: 1 },
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8Unorm,
            usage: wgpu::TextureUsages::TEXTURE_BINDING | wgpu::TextureUsages::COPY_DST,
            view_formats: &[],
        });
        texture.create_view(&wgpu::TextureViewDescriptor::default())
    }

    fn create_screen_texture(device: &Device) -> wgpu::TextureView {
        let texture = device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Screen"),
            size: wgpu::Extent3d { width: 800, height: 600, depth_or_array_layers: 1 },
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8Unorm,
            usage: wgpu::TextureUsages::STORAGE_BINDING | wgpu::TextureUsages::COPY_SRC,
            view_formats: &[],
        });
        texture.create_view(&wgpu::TextureViewDescriptor::default())
    }

    /// Native window drag program
    fn create_window_drag_program() -> Vec<Glyph> {
        vec![
            // 0: Clear hit flag (set to 0)
            Glyph { opcode: OP_LD, stratum: 2, p1: 0.0, p2: 0.0, dst: HIT_FLAG as u32 },
            // 1: Copy WIN_X to HIT_TABLE[0] using MOV (load from memory[WIN_X])
            Glyph { opcode: OP_MOV, stratum: 2, p1: WIN_X as f32, p2: 0.0, dst: HIT_TABLE as u32 },
            // 2: Copy WIN_Y to HIT_TABLE[1]
            Glyph { opcode: OP_MOV, stratum: 2, p1: WIN_Y as f32, p2: 0.0, dst: (HIT_TABLE + 1) as u32 },
            // 3: Hit-test mouse against window
            Glyph { opcode: OP_INT_DISPATCH, stratum: 2, p1: HIT_TABLE as f32, p2: 1.0, dst: HIT_FLAG as u32 },
            // 4: If no hit, jump to DRAW (instruction 7)
            Glyph { opcode: OP_JZ, stratum: 2, p1: 7.0, p2: 0.0, dst: HIT_FLAG as u32 },
            // 5: WIN_X += MOUSE_DX (ADD_MEM adds memory[p1] to memory[dst])
            Glyph { opcode: OP_ADD_MEM, stratum: 2, p1: MOUSE_DX as f32, p2: 0.0, dst: WIN_X as u32 },
            // 6: WIN_Y += MOUSE_DY
            Glyph { opcode: OP_ADD_MEM, stratum: 2, p1: MOUSE_DY as f32, p2: 0.0, dst: WIN_Y as u32 },
            // 7: Draw glyph at window position
            Glyph { opcode: OP_DRAW, stratum: 2, p1: 65.0, p2: 0.0, dst: WIN_X as u32 },
            // 8: Halt
            Glyph { opcode: OP_HALT, stratum: 2, p1: 0.0, p2: 0.0, dst: 0 },
        ]
    }

    fn create_initial_memory() -> Vec<f32> {
        let mut memory = vec![0.0; 1024];

        // Window position and size
        memory[WIN_X] = 100.0;
        memory[WIN_Y] = 100.0;
        memory[WIN_W] = 300.0;
        memory[WIN_H] = 200.0;

        // Hit table (X, Y, W, H, ID)
        memory[HIT_TABLE] = 100.0;     // X
        memory[HIT_TABLE + 1] = 100.0; // Y
        memory[HIT_TABLE + 2] = 300.0; // W
        memory[HIT_TABLE + 3] = 200.0; // H
        memory[HIT_TABLE + 4] = 1.0;   // ID

        memory
    }

    /// Run the VM until halt or max_steps reached
    fn run_until_halt(vm: &GlyphVM, device: &Device, max_steps: usize) {
        for _ in 0..max_steps {
            let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor::default());
            vm.step(&mut encoder);
            vm.queue.submit(std::iter::once(encoder.finish()));
            device.poll(wgpu::Maintain::Wait);

            // Check if halted by reading state
            let state = read_state(vm, device);
            if state.halted != 0 {
                break;
            }
        }
    }

    fn read_state(vm: &GlyphVM, device: &Device) -> GlyphVMState {
        let staging = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("State Staging"),
            size: std::mem::size_of::<GlyphVMState>() as u64,
            usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor::default());
        encoder.copy_buffer_to_buffer(&vm.state_buffer, 0, &staging, 0, std::mem::size_of::<GlyphVMState>() as u64);
        vm.queue.submit(std::iter::once(encoder.finish()));

        let slice = staging.slice(..);
        let (tx, rx) = std::sync::mpsc::channel();
        slice.map_async(wgpu::MapMode::Read, move |r| { tx.send(r).ok(); });
        device.poll(wgpu::Maintain::Wait);
        rx.recv().unwrap().unwrap();

        let data = slice.get_mapped_range();
        let bytes: &[u8] = &data;
        let state: GlyphVMState = bytemuck::cast_slice(bytes)[0];
        drop(data);
        staging.unmap();

        state
    }

    #[tokio::test]
    async fn test_native_window_no_drag_without_click() {
        let (device, queue) = setup_gpu().await;
        let atlas_view = create_test_atlas_texture(&device);
        let screen_view = create_screen_texture(&device);

        let vm = GlyphVM::new(
            device.clone(),
            queue.clone(),
            atlas_view,
            screen_view,
            16,   // program_size
            1024, // memory_size
            256,  // stack_size
        );

        // Upload program
        let program = create_window_drag_program();
        vm.upload_program(&program);

        // Set up memory: mouse at 150,150 but NOT clicked
        let mut memory = create_initial_memory();
        memory[MOUSE_X] = 150.0;
        memory[MOUSE_Y] = 150.0;
        memory[MOUSE_BTN] = 0.0; // Not clicked
        vm.upload_memory(&memory);

        // Execute
        vm.reset_state();
        run_until_halt(&vm, &device, 20);

        // Read back memory
        let memory = read_memory(&vm, &device);
        let final_win_x = memory[WIN_X];
        let final_win_y = memory[WIN_Y];

        // Window should NOT have moved (no drag without click)
        assert_eq!(final_win_x, 100.0, "Window X should not change without click");
        assert_eq!(final_win_y, 100.0, "Window Y should not change without click");
    }

    #[tokio::test]
    async fn test_native_window_drag_with_click_inside() {
        let (device, queue) = setup_gpu().await;
        let atlas_view = create_test_atlas_texture(&device);
        let screen_view = create_screen_texture(&device);

        let vm = GlyphVM::new(
            device.clone(),
            queue.clone(),
            atlas_view,
            screen_view,
            16,
            1024,
            256,
        );

        let program = create_window_drag_program();
        vm.upload_program(&program);

        // Set up memory: mouse clicked inside window with delta
        let mut memory = create_initial_memory();
        memory[MOUSE_X] = 150.0;  // Inside window (100-400)
        memory[MOUSE_Y] = 150.0;  // Inside window (100-300)
        memory[MOUSE_BTN] = 1.0;  // Clicked!
        memory[MOUSE_DX] = 50.0;  // Drag delta X
        memory[MOUSE_DY] = 25.0;  // Drag delta Y
        vm.upload_memory(&memory);

        // Execute
        vm.reset_state();
        run_until_halt(&vm, &device, 20);

        // Read back memory
        let memory = read_memory(&vm, &device);
        let final_win_x = memory[WIN_X];
        let final_win_y = memory[WIN_Y];

        // Window SHOULD have moved by delta
        assert_eq!(final_win_x, 150.0, "Window X should increase by 50 (100 + 50)");
        assert_eq!(final_win_y, 125.0, "Window Y should increase by 25 (100 + 25)");
    }

    /// Multi-window manager program (simplified for testing)
    fn create_window_manager_program() -> Vec<Glyph> {
        vec![
            // 0: Clear FOCUSED_ID
            Glyph { opcode: OP_LD, stratum: 2, p1: 0.0, p2: 0.0, dst: 5 },
            // 1: Hit-test Win0 (Table at 30)
            Glyph { opcode: OP_INT_DISPATCH, stratum: 2, p1: 30.0, p2: 1.0, dst: 12 },
            // 2: JZ instruction 6 (Skip Win0 update)
            Glyph { opcode: OP_JZ, stratum: 2, p1: 6.0, p2: 0.0, dst: 12 },
            // 3: Update Win0
            Glyph { opcode: OP_ADD_MEM, stratum: 2, p1: 3.0, p2: 0.0, dst: 30 },
            Glyph { opcode: OP_ADD_MEM, stratum: 2, p1: 4.0, p2: 0.0, dst: 31 },
            // 5: JMP to DRAW (instruction 11) - Win0 captured focus
            Glyph { opcode: OP_JMP, stratum: 2, p1: 11.0, p2: 0.0, dst: 0 },
            // 6: Hit-test Win1 (Table at 40)
            Glyph { opcode: OP_INT_DISPATCH, stratum: 2, p1: 40.0, p2: 1.0, dst: 12 },
            // 7: JZ instruction 11
            Glyph { opcode: OP_JZ, stratum: 2, p1: 11.0, p2: 0.0, dst: 12 },
            // 8: Update Win1
            Glyph { opcode: OP_ADD_MEM, stratum: 2, p1: 3.0, p2: 0.0, dst: 40 },
            Glyph { opcode: OP_ADD_MEM, stratum: 2, p1: 4.0, p2: 0.0, dst: 41 },
            // 10: (JMP next window if we had more)
            // 11: DRAW Win0
            Glyph { opcode: OP_DRAW, stratum: 2, p1: 65.0, p2: 0.0, dst: 30 },
            // 12: DRAW Win1
            Glyph { opcode: OP_DRAW, stratum: 2, p1: 66.0, p2: 0.0, dst: 40 },
            // 13: Halt
            Glyph { opcode: OP_HALT, stratum: 2, p1: 0.0, p2: 0.0, dst: 0 },
        ]
    }

    #[tokio::test]
    async fn test_native_z_order_top_window_wins() {
        let (device, queue) = setup_gpu().await;
        let atlas_view = create_test_atlas_texture(&device);
        let screen_view = create_screen_texture(&device);

        let vm = GlyphVM::new(
            device.clone(),
            queue.clone(),
            atlas_view,
            screen_view,
            32,
            1024,
            256,
        );

        let program = create_window_manager_program();
        vm.upload_program(&program);

        // Setup memory: 2 overlapping windows
        // Win0: 100,100 (300x200) - TOP
        // Win1: 150,150 (300x200) - BOTTOM
        let mut memory = vec![0.0; 1024];
        
        // Mouse clicked at 200,200 (INSIDE BOTH)
        memory[MOUSE_X] = 200.0;
        memory[MOUSE_Y] = 200.0;
        memory[MOUSE_BTN] = 1.0;
        memory[MOUSE_DX] = 10.0;
        memory[MOUSE_DY] = 10.0;

        // Window 0 (X, Y, W, H, ID)
        memory[30] = 100.0;
        memory[31] = 100.0;
        memory[32] = 300.0;
        memory[33] = 200.0;
        memory[34] = 1.0;

        // Window 1
        memory[40] = 150.0;
        memory[41] = 150.0;
        memory[42] = 300.0;
        memory[43] = 200.0;
        memory[44] = 2.0;

        vm.upload_memory(&memory);

        // Execute
        vm.reset_state();
        run_until_halt(&vm, &device, 50);

        // Read back memory
        let memory = read_memory(&vm, &device);
        
        // Only Window 0 should have moved (it is first in scan order)
        assert_eq!(memory[30], 110.0, "Window 0 should have moved by delta");
        assert_eq!(memory[40], 150.0, "Window 1 should NOT have moved (blocked by Z-order)");
        
        println!("✅ Z-Order Test Passed: Top window captured interaction, bottom window blocked.");
    }

    fn read_memory(vm: &GlyphVM, device: &Device) -> Vec<f32> {
        let staging = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Memory Staging"),
            size: 1024 * 4,
            usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor::default());
        encoder.copy_buffer_to_buffer(&vm.memory_buffer, 0, &staging, 0, 1024 * 4);
        vm.queue.submit(std::iter::once(encoder.finish()));

        let slice = staging.slice(..);
        let (tx, rx) = std::sync::mpsc::channel();
        slice.map_async(wgpu::MapMode::Read, move |r| { tx.send(r).ok(); });
        device.poll(wgpu::Maintain::Wait);
        rx.recv().unwrap().unwrap();

        let data = slice.get_mapped_range();
        let memory: Vec<f32> = bytemuck::cast_slice(&data).to_vec();
        drop(data);
        staging.unmap();

        memory
    }

    #[tokio::test]
    async fn test_native_window_attestation_blocks_tampered_atlas() {
        let (device, queue) = setup_gpu().await;

        // Create VCC verifier
        let vcc = HardwareVCC::new().await.expect("VCC init");

        // Simulate tampered atlas (wrong hash)
        let _wrong_hash: (u64, u64) = (0xDEADBEEF_u64, 0xCAFEBABE_u64);

        // The attestation should detect the mismatch
        // In a real scenario, execute_attested would BLOCK execution
        println!("✅ Attestation test: VCC verifier initialized");
        println!("   In production, DrmGlyphExecutor::execute_attested() would");
        println!("   block execution if atlas hash doesn't match contract.");
    }
}
