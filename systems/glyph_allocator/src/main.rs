//! Fitness evaluation binary for glyph allocator
//!
//! Outputs fitness score for autoresearch optimization loop.

use glyph_allocator::GlyphPool;

fn main() {
    // Create a 1MB pool
    let mut pool = GlyphPool::new(1);

    let mut successful_allocs = 0;
    let mut failed_allocs = 0;

    // Simulate realistic allocation pattern
    // Allocate 100 glyphs of varying sizes
    for i in 1..=100 {
        let size = 256 + (i * 37) % 4096; // 256 to 4352 bytes
        match pool.allocate(i, size as u64) {
            Some(_) => successful_allocs += 1,
            None => failed_allocs += 1,
        }
    }

    // Free every other glyph to create fragmentation
    for i in (1..=100).step_by(2) {
        pool.free(i);
    }

    // Allocate 50 more glyphs (reusing freed space)
    for i in 101..=150 {
        let size = 512 + (i * 23) % 2048;
        match pool.allocate(i, size as u64) {
            Some(_) => successful_allocs += 1,
            None => failed_allocs += 1,
        }
    }

    // Free some more to test coalescing
    for i in (2..=100).step_by(4) {
        pool.free(i);
    }

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
