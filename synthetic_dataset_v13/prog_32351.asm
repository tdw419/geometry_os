; DESCRIPTION: Composite: Sets a single orange pixel at (101, 62) then Renders a blue line between points (260, 147) and (194, 201).
; PLAN: r0=101(x), r1=62(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=260(x1), r6=147(y1), r7=194(x2), r8=201(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 101
LDI r1, 62
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 260
LDI r6, 147
LDI r7, 194
LDI r8, 201
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
