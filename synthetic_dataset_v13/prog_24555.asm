; DESCRIPTION: Composite: Draws a purple circle centered at (129, 90) with radius 68 then Draws a purple line from (318, 241) to (0, 133).
; PLAN: r0=129(x), r1=90(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=318(x1), r6=241(y1), r7=0(x2), r8=133(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 129
LDI r1, 90
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 318
LDI r6, 241
LDI r7, 0
LDI r8, 133
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
