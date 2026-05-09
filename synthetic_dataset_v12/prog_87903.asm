; DESCRIPTION: Composite: Draws a cyan circle centered at (261, 77) with radius 51 then Sets a single yellow pixel at (232, 56) then Places a green 59x45 rectangle at position (157, 144).
; PLAN: r0=261(x), r1=77(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=232(x), r6=56(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=157(x), r11=144(y), r12=59(width), r13=45(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 261
LDI r1, 77
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 232
LDI r6, 56
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 157
LDI r11, 144
LDI r12, 59
LDI r13, 45
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
