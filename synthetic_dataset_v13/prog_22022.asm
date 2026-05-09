; DESCRIPTION: Composite: Draws a black rectangle at (78, 183) with width 49 and height 61 then Creates a magenta circular shape at (99, 115) with radius 29.
; PLAN: r0=78(x), r1=183(y), r2=49(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=99(x), r6=115(y), r7=29(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 78
LDI r1, 183
LDI r2, 49
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 99
LDI r6, 115
LDI r7, 29
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
