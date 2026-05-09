; DESCRIPTION: Composite: Draws a purple line from (323, 83) to (276, 5) then Creates a orange circular shape at (402, 156) with radius 62.
; PLAN: r0=323(x1), r1=83(y1), r2=276(x2), r3=5(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=402(x), r6=156(y), r7=62(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 323
LDI r1, 83
LDI r2, 276
LDI r3, 5
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 156
LDI r7, 62
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
