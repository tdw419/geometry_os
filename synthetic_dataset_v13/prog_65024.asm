; DESCRIPTION: Composite: Places a purple 36x49 rectangle at position (378, 15) then Sets a single orange pixel at (239, 97) then Creates a yellow circular shape at (305, 224) with radius 32.
; PLAN: r0=378(x), r1=15(y), r2=36(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=239(x), r6=97(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=305(x), r11=224(y), r12=32(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 378
LDI r1, 15
LDI r2, 36
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 97
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 305
LDI r11, 224
LDI r12, 32
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
