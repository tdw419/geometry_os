; DESCRIPTION: Composite: Draws a black rectangle at (438, 60) with width 36 and height 115 then Draws a magenta circle centered at (158, 68) with radius 64.
; PLAN: r0=438(x), r1=60(y), r2=36(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=158(x), r6=68(y), r7=64(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 438
LDI r1, 60
LDI r2, 36
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 68
LDI r7, 64
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
