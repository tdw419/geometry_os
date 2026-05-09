; DESCRIPTION: Composite: Places a purple line segment connecting (100, 105) to (418, 63) then Draws a white rectangle at (241, 106) with width 37 and height 114.
; PLAN: r0=100(x1), r1=105(y1), r2=418(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=241(x), r6=106(y), r7=37(width), r8=114(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 100
LDI r1, 105
LDI r2, 418
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 106
LDI r7, 37
LDI r8, 114
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
