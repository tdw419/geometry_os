; DESCRIPTION: Composite: Sets a single orange pixel at (347, 239) then Places a purple circle of radius 76 at center (264, 77) then Places a black 17x81 rectangle at position (414, 11).
; PLAN: r0=347(x), r1=239(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=264(x), r6=77(y), r7=76(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=414(x), r11=11(y), r12=17(width), r13=81(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 347
LDI r1, 239
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 264
LDI r6, 77
LDI r7, 76
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 414
LDI r11, 11
LDI r12, 17
LDI r13, 81
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
