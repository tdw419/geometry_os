use glyph_allocator::GlyphAllocator;

fn main() {
    println!("🧬 Glyph Allocator Fitness Evaluation");
    println!("=====================================");

    let fitness = GlyphAllocator::evaluate_fitness();

    println!("Fitness Score: {:.2}%", fitness * 100.0);

    if fitness > 0.8 {
        println!("✅ Excellent! Allocator performs well");
    } else if fitness > 0.6 {
        println!("⚠️  Acceptable but room for improvement");
    } else {
        println!("❌ Poor performance - needs evolution");
    }

    println!("\n🧪 Detailed breakdown would be shown here in a full implementation");
}
