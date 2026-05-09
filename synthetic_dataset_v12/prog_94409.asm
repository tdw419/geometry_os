; DESCRIPTION: Composite: Draws a red circle centered at (37, 100) with radius 31 then Renders a purple line between points (201, 37) and (286, 73).
; PLAN: r0=37(x), r1=100(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=201(x1), r6=37(y1), r7=286(x2), r8=73(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 37
LDI r1, 100
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 201
LDI r6, 37
LDI r7, 286
LDI r8, 73
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
