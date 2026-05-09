; DESCRIPTION: Composite: Draws a purple rectangle at (238, 18) with width 82 and height 30 then Creates a yellow circular shape at (26, 36) with radius 15 then Sets a single white pixel at (417, 22).
; PLAN: r0=238(x), r1=18(y), r2=82(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=26(x), r6=36(y), r7=15(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=417(x), r11=22(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 238
LDI r1, 18
LDI r2, 82
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 26
LDI r6, 36
LDI r7, 15
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 417
LDI r11, 22
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
