; DESCRIPTION: Composite: Renders a purple line between points (505, 31) and (220, 144) then Draws a orange circle centered at (166, 24) with radius 18.
; PLAN: r0=505(x1), r1=31(y1), r2=220(x2), r3=144(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=166(x), r6=24(y), r7=18(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 505
LDI r1, 31
LDI r2, 220
LDI r3, 144
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 24
LDI r7, 18
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
