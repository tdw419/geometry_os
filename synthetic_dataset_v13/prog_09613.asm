; DESCRIPTION: Composite: Draws a green rectangle at (9, 15) with width 34 and height 64 then Draws a purple circle centered at (226, 145) with radius 63.
; PLAN: r0=9(x), r1=15(y), r2=34(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=226(x), r6=145(y), r7=63(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 9
LDI r1, 15
LDI r2, 34
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 145
LDI r7, 63
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
