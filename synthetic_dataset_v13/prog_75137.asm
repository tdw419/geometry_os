; DESCRIPTION: Composite: Draws a blue circle centered at (181, 22) with radius 13 then Draws a orange rectangle at (172, 26) with width 87 and height 118.
; PLAN: r0=181(x), r1=22(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=172(x), r6=26(y), r7=87(width), r8=118(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 181
LDI r1, 22
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 172
LDI r6, 26
LDI r7, 87
LDI r8, 118
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
