; DESCRIPTION: Composite: Draws a white rectangle at (183, 87) with width 118 and height 21 then Draws a white circle centered at (324, 137) with radius 78.
; PLAN: r0=183(x), r1=87(y), r2=118(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=324(x), r6=137(y), r7=78(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 183
LDI r1, 87
LDI r2, 118
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 137
LDI r7, 78
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
