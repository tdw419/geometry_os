; DESCRIPTION: Composite: Sets a single orange pixel at (26, 248) then Places a black circle of radius 48 at center (73, 131) then Creates a purple rectangular region at (83, 51) spanning 11 by 76 pixels.
; PLAN: r0=26(x), r1=248(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=73(x), r6=131(y), r7=48(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=83(x), r11=51(y), r12=11(width), r13=76(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 26
LDI r1, 248
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 73
LDI r6, 131
LDI r7, 48
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 83
LDI r11, 51
LDI r12, 11
LDI r13, 76
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
