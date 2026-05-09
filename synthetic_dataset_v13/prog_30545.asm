; DESCRIPTION: Composite: Draws a black rectangle at (210, 126) with width 89 and height 96 then Draws a magenta circle centered at (285, 97) with radius 74.
; PLAN: r0=210(x), r1=126(y), r2=89(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=285(x), r6=97(y), r7=74(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 210
LDI r1, 126
LDI r2, 89
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 285
LDI r6, 97
LDI r7, 74
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
