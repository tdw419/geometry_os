; DESCRIPTION: Composite: Draws a yellow rectangle at (64, 117) with width 84 and height 52 then Creates a green circular shape at (347, 48) with radius 24 then Sets a single white pixel at (486, 137).
; PLAN: r0=64(x), r1=117(y), r2=84(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=347(x), r6=48(y), r7=24(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=486(x), r11=137(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 64
LDI r1, 117
LDI r2, 84
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 48
LDI r7, 24
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 486
LDI r11, 137
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
