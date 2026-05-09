; DESCRIPTION: Composite: Draws a magenta rectangle at (73, 52) with width 19 and height 94 then Creates a green circular shape at (247, 84) with radius 50 then Sets a single purple pixel at (376, 9).
; PLAN: r0=73(x), r1=52(y), r2=19(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=247(x), r6=84(y), r7=50(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=376(x), r11=9(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 73
LDI r1, 52
LDI r2, 19
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 84
LDI r7, 50
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 376
LDI r11, 9
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
