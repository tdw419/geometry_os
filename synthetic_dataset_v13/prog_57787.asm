; DESCRIPTION: Composite: Draws a red rectangle at (26, 139) with width 118 and height 66 then Draws a blue circle centered at (450, 178) with radius 33.
; PLAN: r0=26(x), r1=139(y), r2=118(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=450(x), r6=178(y), r7=33(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 26
LDI r1, 139
LDI r2, 118
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 178
LDI r7, 33
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
