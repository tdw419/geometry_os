; DESCRIPTION: Composite: Renders a yellow box of size 61x102 starting at (289, 17) then Places a black dot at position (348, 12) then Draws a black circle centered at (87, 195) with radius 27.
; PLAN: r0=289(x), r1=17(y), r2=61(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=348(x), r6=12(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=87(x), r11=195(y), r12=27(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 289
LDI r1, 17
LDI r2, 61
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 12
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 87
LDI r11, 195
LDI r12, 27
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
