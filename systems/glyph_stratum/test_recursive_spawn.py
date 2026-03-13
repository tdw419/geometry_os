import os
import sys
import time
import numpy as np
import wgpu
from pathlib import Path

# Paths
ROOT = Path(__file__).parent.parent.parent.absolute()
SHADER_PATH = ROOT / "systems/infinite_map_rs/shaders/glyph_microcode.wgsl"

def run_spawn_test(max_generations=50):
    # Initialize WGPU
    adapter = wgpu.gpu.request_adapter_sync(power_preference="high-performance")
    device = adapter.request_device_sync()

    # Load Shader
    with open(SHADER_PATH, "r") as f:
        shader_code = f.read()
    
    shader_module = device.create_shader_module(code=shader_code)

    # Setup Buffers
    num_glyphs = 1000
    program_buffer = device.create_buffer(size=num_glyphs * 20, usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC | wgpu.BufferUsage.COPY_DST)
    state_buffer = device.create_buffer(size=20, usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC | wgpu.BufferUsage.COPY_DST)
    memory_buffer = device.create_buffer(size=65536 * 4, usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC | wgpu.BufferUsage.COPY_DST)
    stack_buffer = device.create_buffer(size=1024 * 4, usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC | wgpu.BufferUsage.COPY_DST)

    atlas_texture = device.create_texture(size=(1024, 1024, 1), usage=wgpu.TextureUsage.TEXTURE_BINDING | wgpu.TextureUsage.COPY_DST, format=wgpu.TextureFormat.rgba8unorm)
    screen_texture = device.create_texture(size=(1024, 1024, 1), usage=wgpu.TextureUsage.STORAGE_BINDING | wgpu.TextureUsage.COPY_SRC, format=wgpu.TextureFormat.rgba8unorm)

    # Initialize Program: Recursive SPATIAL_SPAWN
    # Glyph 0: SPATIAL_SPAWN(p1=PC+1, p2=225, dst=PC+2)
    # This should theoretically create a chain of spawns if the interpreter allows it.
    # However, our microcode executes one glyph per dispatch.
    # To test recursion, we need the spawned glyph to be executed in the NEXT cycle.
    
    data = np.zeros(num_glyphs * 5, dtype=np.uint32)
    # Opcode 225 = SPATIAL_SPAWN
    data[0] = 225 
    data[1] = 0 # stratum
    data[2] = np.float32(1.0).view(np.uint32) # p1 = index 1
    data[3] = np.float32(225.0).view(np.uint32) # p2 = opcode 225
    data[4] = 2 # dst = will set index 1's dst to 2
    
    device.queue.write_buffer(program_buffer, 0, data.tobytes())

    # Create Pipeline
    compute_pipeline = device.create_compute_pipeline(
        layout="auto",
        compute={"module": shader_module, "entry_point": "main"},
    )

    bind_group = device.create_bind_group(
        layout=compute_pipeline.get_bind_group_layout(0),
        entries=[
            {"binding": 0, "resource": {"buffer": program_buffer, "offset": 0, "size": program_buffer.size}},
            {"binding": 1, "resource": {"buffer": state_buffer, "offset": 0, "size": state_buffer.size}},
            {"binding": 2, "resource": {"buffer": memory_buffer, "offset": 0, "size": memory_buffer.size}},
            {"binding": 3, "resource": {"buffer": stack_buffer, "offset": 0, "size": stack_buffer.size}},
            {"binding": 4, "resource": atlas_texture.create_view()},
            {"binding": 5, "resource": screen_texture.create_view()},
        ],
    )

    print(f"● Starting Recursive SPATIAL_SPAWN Test (Max Generations: {max_generations})...")
    
    generations_reached = 0
    for gen in range(max_generations):
        command_encoder = device.create_command_encoder()
        compute_pass = command_encoder.begin_compute_pass()
        compute_pass.set_pipeline(compute_pipeline)
        compute_pass.set_bind_group(0, bind_group)
        compute_pass.dispatch_workgroups(1)
        compute_pass.end()
        device.queue.submit([command_encoder.finish()])
        
        # Read back the program buffer to see if the next glyph was spawned correctly
        # In our microcode: program[u32(glyph.p1)].opcode = u32(glyph.p2);
        # So after dispatch 1, program[1].opcode should be 225.
        
        # We need to wait for GPU to finish
        device.queue.on_submitted_work_done()
        
        # For a true recursive test, we'd need to adjust the program to spawn the NEXT one.
        # Let's check if the spawn happened.
        result_data = device.queue.read_buffer(program_buffer).cast("I")
        
        next_glyph_idx = gen + 1
        if result_data[next_glyph_idx * 5] == 225:
            # Success, it spawned the next one. 
            # Now we need to make sure the NEXT one spawns the one after it.
            # We can do this by having the spawn opcode also set the p1 and p2 of the child.
            # Our current SPATIAL_SPAWN only sets opcode and dst.
            # Let's manually "evolve" the child to point to the grandchild for the next iteration.
            
            # Update child at next_glyph_idx to spawn grandchild at next_glyph_idx + 1
            child_base = next_glyph_idx * 5
            new_child_data = np.zeros(5, dtype=np.uint32)
            new_child_data[0] = 225 # Opcode
            new_child_data[2] = np.float32(next_glyph_idx + 1).view(np.uint32) # p1 = index + 1
            new_child_data[3] = np.float32(225.0).view(np.uint32) # p2 = opcode 225
            
            device.queue.write_buffer(program_buffer, child_base * 4, new_child_data.tobytes())
            generations_reached += 1
        else:
            print(f"  [!] Spawn failed at generation {gen}")
            break

    print(f"\n[Spawn Test Results]")
    print(f"  Generations Reached: {generations_reached}")
    print(f"  Status: {'PASS' if generations_reached >= max_generations else 'FAIL'}")
    
    return generations_reached

if __name__ == "__main__":
    run_spawn_test()
