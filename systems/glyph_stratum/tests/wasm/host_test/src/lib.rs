#![no_std]

/// Host function imports from Geometry OS
#[link(wasm_import_module = "geos")]
extern "C" {
    fn poke(addr: i32, val: i32);
    fn peek(addr: i32) -> i32;
    fn print(ptr: i32, len: i32);
}

/// Entry point
#[no_mangle]
pub extern "C" fn _start() {
    unsafe {
        // Test 1: Write value to substrate
        poke(0x1000, 42);

        // Test 2: Read it back
        let val = peek(0x1000);

        // Test 3: Write read value to another address
        poke(0x1004, val);

        // Test 4: Print hello
        static MSG: &[u8] = b"Hello from WASM!";
        print(MSG.as_ptr() as i32, MSG.len() as i32);
    }
}

#[panic_handler]
fn panic(_: &core::panic::PanicInfo) -> ! {
    loop {}
}
