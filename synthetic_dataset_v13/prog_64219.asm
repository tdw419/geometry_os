; DESCRIPTION: Composite: Sets a single blue pixel at (153, 200) then Renders a magenta line between points (507, 175) and (323, 245).
; PLAN: r0=153(x), r1=200(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=507(x1), r6=175(y1), r7=323(x2), r8=245(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 153
LDI r1, 200
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 507
LDI r6, 175
LDI r7, 323
LDI r8, 245
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
