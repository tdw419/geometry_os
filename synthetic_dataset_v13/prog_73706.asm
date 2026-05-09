; DESCRIPTION: Composite: Creates a magenta circular shape at (247, 124) with radius 38 then Draws a black rectangle at (155, 75) with width 85 and height 77.
; PLAN: r0=247(x), r1=124(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=155(x), r6=75(y), r7=85(width), r8=77(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 247
LDI r1, 124
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 155
LDI r6, 75
LDI r7, 85
LDI r8, 77
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
