; DESCRIPTION: Composite: Sets a single orange pixel at (414, 136) then Renders a purple line between points (315, 165) and (207, 94).
; PLAN: r0=414(x), r1=136(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=315(x1), r6=165(y1), r7=207(x2), r8=94(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 414
LDI r1, 136
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 315
LDI r6, 165
LDI r7, 207
LDI r8, 94
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
