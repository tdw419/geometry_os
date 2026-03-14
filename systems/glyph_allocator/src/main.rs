//! Fitness evaluation binary for glyph allocator
//!
//! Outputs fitness score for autoresearch optimization loop.

use glyph_allocator::GlyphPool;

fn main() {
    // Create a 1MB pool
    let mut pool = GlyphPool::new(1);

    let mut successful_allocs = 0;
    let mut failed_allocs = 0;

    // Phase 1: Fill pool to 99%+ utilization
    // 1MB = 1048576 bytes, leave only 10KB free
    let total_target = 1024 * 1024 - 10240; // Leave 10KB free
    let block_size = total_target / 64; // ~16KB per block

    for i in 1..=64 {
        match pool.allocate(i, block_size as u64) {
            Some(_) => successful_allocs += 1,
            None => failed_allocs += 1,
        }
    }

    // Phase 2: Defragment to compact free space
    pool.defragment();

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
