; DESCRIPTION: Composite: Sets a single blue pixel at (463, 118) then Renders a red line between points (73, 0) and (432, 237).
; PLAN: r0=463(x), r1=118(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=73(x1), r6=0(y1), r7=432(x2), r8=237(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 463
LDI r1, 118
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 73
LDI r6, 0
LDI r7, 432
LDI r8, 237
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
