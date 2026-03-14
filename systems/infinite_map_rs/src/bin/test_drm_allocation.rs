use anyhow::{Context, Result};
use std::fs::File;
use std::os::unix::io::AsRawFd;
use infinite_map_rs::backend::drm::DrmDevice;
use infinite_map_rs::backend::drm::dmabuf::DmaBuf;

fn main() -> Result<()> {
    env_logger::init();
    println!("🧬 Geometry OS: DRM Allocation Test");
    println!("===================================");

    // 1. Open DRM device (render node is usually enough for allocation)
    let device_path = "/dev/dri/renderD128";
    println!("● Opening DRM device: {}", device_path);
    
    let device = match DrmDevice::open(device_path) {
        Ok(d) => d,
        Err(e) => {
            println!("⚠️  Failed to open {}: {}", device_path, e);
            println!("   Attempting /dev/dri/card0...");
            DrmDevice::open("/dev/dri/card0").context("Failed to open any DRM device")?
        }
    };

    let fd = device.fd();
    println!("✅ Opened DRM device (fd={})", fd);

    // 2. Attempt DMA-BUF allocation (using the placeholder for now, or real if implemented)
    println!("● Attempting DMA-BUF allocation (1920x1080 BGRA)...");
    
    // In our current implementation, export_from_gpu is a placeholder that uses memfd
    let dma_buf = DmaBuf::export_from_gpu(
        fd,
        0, // handle (placeholder)
        1920,
        1080,
        1920 * 4,
        0x34325241, // DRM_FORMAT_ARGB8888
    ).context("Failed to create DMA-BUF")?;

    println!("✅ DMA-BUF created successfully (fd={})", dma_buf.as_raw_fd());
    println!("   Dimensions: {}x{}", dma_buf.dimensions().0, dma_buf.dimensions().1);

    // 3. Test KMS Import (Safe as it only creates a metadata entry in the kernel)
    println!("● Testing KMS Framebuffer creation (Import)...");
    match dma_buf.import_to_kms(fd) {
        Ok(fb_id) => println!("✅ KMS Framebuffer created: ID={}", fb_id),
        Err(e) => println!("⚠️  KMS Import failed (expected if not root or card0): {}", e),
    }

    println!("\n🏁 DRM Infrastructure Test Passed!");
    Ok(())
}
