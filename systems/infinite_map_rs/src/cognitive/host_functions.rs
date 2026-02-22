use wasmtime::*;
use crate::cognitive::ace_runtime::ACEState;
use image::{DynamicImage, GenericImageView, GenericImage};
use std::os::unix::net::UnixStream;
use std::io::Write;

pub fn register_host_functions(linker: &mut Linker<ACEState>) -> anyhow::Result<()> {
    // Permission System check would happen inside these functions

    linker.func_wrap("ace", "read_texture", |mut caller: Caller<'_, ACEState>, x: u32, y: u32| -> u32 {
        // Read color from texture
        match image::open(&caller.data().texture_path) {
            Ok(img) => {
                let (width, height) = img.dimensions();
                if x >= width || y >= height {
                    return 0;
                }
                let pixel = img.get_pixel(x, y);
                let rgba = pixel.0;
                // Pack RGBA to u32: R << 24 | G << 16 | B << 8 | A
                ((rgba[0] as u32) << 24) | ((rgba[1] as u32) << 16) | ((rgba[2] as u32) << 8) | (rgba[3] as u32)
            }
            Err(_) => 0,
        }
    })?;

    linker.func_wrap("ace", "write_texture", |mut caller: Caller<'_, ACEState>, x: u32, y: u32, color: u32| {
        // Write color to texture
        if let Ok(mut img) = image::open(&caller.data().texture_path) {
            let (width, height) = img.dimensions();
            if x < width && y < height {
                // Unpack u32 to RGBA
                let r = ((color >> 24) & 0xFF) as u8;
                let g = ((color >> 16) & 0xFF) as u8;
                let b = ((color >> 8) & 0xFF) as u8;
                let a = (color & 0xFF) as u8;
                img.put_pixel(x, y, image::Rgba([r, g, b, a]));
                let _ = img.save(&caller.data().texture_path); // Ignore save errors for now
            }
        }
    })?;

    linker.func_wrap("ace", "evolve", |mut caller: Caller<'_, ACEState>, thought_ptr: u32, len: u32| {
        // Send thought to evolution daemon
        if let Some(export) = caller.get_export("memory") {
            if let Some(memory) = export.into_memory() {
                let mut buf = vec![0u8; len as usize];
                if memory.read(&caller, thought_ptr as usize, &mut buf).is_ok() {
                    if let Ok(thought) = String::from_utf8(buf) {
                        if let Ok(mut stream) = UnixStream::connect("/tmp/evolution_daemon.sock") {
                            let _ = stream.write_all(thought.as_bytes()); // Ignore write errors for now
                        }
                    }
                }
            }
        }
    })?;

    Ok(())
}
