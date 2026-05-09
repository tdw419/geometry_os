; DESCRIPTION: Composite: Draws a magenta rectangle at (8, 167) with width 26 and height 29 then Creates a magenta circular shape at (280, 195) with radius 51.
; PLAN: r0=8(x), r1=167(y), r2=26(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x), r6=195(y), r7=51(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 8
LDI r1, 167
LDI r2, 26
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 195
LDI r7, 51
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
