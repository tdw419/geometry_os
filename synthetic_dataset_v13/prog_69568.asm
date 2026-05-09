; DESCRIPTION: Composite: Draws a red rectangle at (232, 35) with width 77 and height 18 then Renders a purple disk with center (405, 219) and radius 24 then Sets a single blue pixel at (177, 100).
; PLAN: r0=232(x), r1=35(y), r2=77(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=405(x), r6=219(y), r7=24(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=177(x), r11=100(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 232
LDI r1, 35
LDI r2, 77
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 219
LDI r7, 24
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 177
LDI r11, 100
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
