; DESCRIPTION: Composite: Draws a purple circle centered at (204, 87) with radius 16 then Sets a single blue pixel at (131, 143) then Places a blue 12x91 rectangle at position (439, 11).
; PLAN: r0=204(x), r1=87(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=131(x), r6=143(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=439(x), r11=11(y), r12=12(width), r13=91(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 204
LDI r1, 87
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 131
LDI r6, 143
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 439
LDI r11, 11
LDI r12, 12
LDI r13, 91
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
