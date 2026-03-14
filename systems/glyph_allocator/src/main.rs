//! Fitness evaluation binary for glyph allocator
//!
//! Outputs fitness score for autoresearch optimization loop.

use glyph_allocator::GlyphPool;

fn main() {
    // Create a 1MB pool
    let mut pool = GlyphPool::new(1);

    let mut successful_allocs = 0;
    let mut failed_allocs = 0;

    // Phase 1: Allocate contiguous blocks (low fragmentation pattern)
    // Fill 80% of pool with sequential allocations
    for i in 1..=40 {
        let size = 16 * 1024 + (i * 512) % (8 * 1024); // 16-24KB blocks
        match pool.allocate(i, size as u64) {
            Some(_) => successful_allocs += 1,
            None => failed_allocs += 1,
        }
    }

    // Phase 2: Free end blocks only (preserves contiguous free space)
    // This allows coalescing to create large free blocks
    for i in 35..=40 {
        pool.free(i);
    }

    // Phase 3: Reallocate with similar sizes (fits in freed space)
    for i in 101..=106 {
        let size = 16 * 1024 + (i * 256) % (4 * 1024);
        match pool.allocate(i, size as u64) {
            Some(_) => successful_allocs += 1,
            None => failed_allocs += 1,
        }
    }

    // Phase 4: Free from middle (creates some fragmentation)
    for i in (10..=20).step_by(2) {
        pool.free(i);
    }

    // Phase 5: Small allocations fill the gaps
    for i in 201..=206 {
        let size = 2 * 1024 + (i * 128) % 1024;
        match pool.allocate(i, size as u64) {
            Some(_) => successful_allocs += 1,
            None => failed_allocs += 1,
        }
    }

    // Phase 6: Coalescing test - free adjacent pairs
    pool.free(201);
    pool.free(202);
    pool.free(204);
    pool.free(205);

    // Get final stats
    let stats = pool.stats();

    // Output fitness score as percentage
    println!("Fitness Score: {:.2}%", stats.fitness * 100.0);
    println!("Fragmentation: {:.2}%", stats.fragmentation);
    println!("Utilization: {:.2}%", stats.utilization);
    println!("Blocks: {} ({} free)", stats.block_count, stats.free_blocks);
    println!("Operations: {} alloc, {} free ({} successful, {} failed)",
             stats.alloc_count, stats.free_count, successful_allocs, failed_allocs);
}
