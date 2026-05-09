; DESCRIPTION: Composite: Draws a yellow rectangle at (186, 22) with width 63 and height 106 then Creates a black circular shape at (88, 157) with radius 77.
; PLAN: r0=186(x), r1=22(y), r2=63(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=88(x), r6=157(y), r7=77(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 186
LDI r1, 22
LDI r2, 63
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 157
LDI r7, 77
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
