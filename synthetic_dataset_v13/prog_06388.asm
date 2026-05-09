; DESCRIPTION: Composite: Sets a single yellow pixel at (138, 237) then Renders a purple line between points (105, 147) and (33, 159).
; PLAN: r0=138(x), r1=237(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=105(x1), r6=147(y1), r7=33(x2), r8=159(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 138
LDI r1, 237
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 105
LDI r6, 147
LDI r7, 33
LDI r8, 159
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
