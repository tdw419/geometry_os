; DESCRIPTION: Composite: Creates a purple circular shape at (414, 140) with radius 49 then Draws a red line from (454, 155) to (43, 142).
; PLAN: r0=414(x), r1=140(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=454(x1), r6=155(y1), r7=43(x2), r8=142(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 414
LDI r1, 140
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 454
LDI r6, 155
LDI r7, 43
LDI r8, 142
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
