; DESCRIPTION: Composite: Creates a white circular shape at (377, 201) with radius 22 then Draws a blue rectangle at (469, 123) with width 15 and height 26.
; PLAN: r0=377(x), r1=201(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=469(x), r6=123(y), r7=15(width), r8=26(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 377
LDI r1, 201
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 469
LDI r6, 123
LDI r7, 15
LDI r8, 26
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
