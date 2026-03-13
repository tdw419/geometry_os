use std::env;
use std::fs;
use std::path::Path;
use naga::back::spv;
use naga::front::wgsl;

fn main() -> anyhow::Result<()> {
    let args: Vec<String> = env::args().collect();
    if args.len() < 3 {
        println!("Usage: wgsl_to_spirv <input.wgsl> <output.spv>");
        return Ok(());
    }

    let input_path = Path::new(&args[1]);
    let output_path = Path::new(&args[2]);

    let wgsl_source = fs::read_to_string(input_path)?;
    
    // Parse WGSL
    let mut frontend = wgsl::Frontend::new();
    let module = frontend.parse(&wgsl_source)
        .map_err(|e| anyhow::anyhow!("WGSL Parse Error: {:?}", e))?;

    // Validate module
    let mut validator = naga::valid::Validator::new(
        naga::valid::ValidationFlags::all(),
        naga::valid::Capabilities::all(),
    );
    let info = validator.validate(&module)
        .map_err(|e| anyhow::anyhow!("Validation Error: {:?}", e))?;

    // Write SPIR-V
    let options = spv::Options {
        lang_version: (1, 3),
        flags: spv::WriterFlags::empty(),
        ..Default::default()
    };
    let spirv = spv::write_vec(&module, &info, &options, None)
        .map_err(|e| anyhow::anyhow!("SPIR-V Write Error: {:?}", e))?;

    // Write to file
    let spirv_bytes: Vec<u8> = spirv.iter().flat_map(|w| w.to_le_bytes()).collect();
    fs::write(output_path, spirv_bytes)?;

    println!("✓ Successfully converted {} -> {}", args[1], args[2]);
    Ok(())
}
