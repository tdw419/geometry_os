; DESCRIPTION: Composite: Renders a orange line between points (195, 136) and (261, 156) then Creates a purple circular shape at (227, 182) with radius 13.
; PLAN: r0=195(x1), r1=136(y1), r2=261(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=227(x), r6=182(y), r7=13(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 195
LDI r1, 136
LDI r2, 261
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 182
LDI r7, 13
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
