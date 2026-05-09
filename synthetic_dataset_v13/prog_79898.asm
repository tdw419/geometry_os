; DESCRIPTION: Composite: Draws a blue circle centered at (414, 175) with radius 61 then Renders a orange line between points (49, 254) and (205, 135).
; PLAN: r0=414(x), r1=175(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=49(x1), r6=254(y1), r7=205(x2), r8=135(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 414
LDI r1, 175
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 49
LDI r6, 254
LDI r7, 205
LDI r8, 135
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
