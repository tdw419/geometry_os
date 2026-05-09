; DESCRIPTION: Composite: Draws a yellow rectangle at (12, 51) with width 114 and height 81 then Creates a magenta circular shape at (351, 97) with radius 27.
; PLAN: r0=12(x), r1=51(y), r2=114(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=351(x), r6=97(y), r7=27(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 12
LDI r1, 51
LDI r2, 114
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 97
LDI r7, 27
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
