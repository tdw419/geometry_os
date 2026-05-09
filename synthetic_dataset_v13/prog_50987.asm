; DESCRIPTION: Composite: Sets a single blue pixel at (129, 141) then Renders a black line between points (419, 42) and (194, 51).
; PLAN: r0=129(x), r1=141(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=419(x1), r6=42(y1), r7=194(x2), r8=51(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 129
LDI r1, 141
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 419
LDI r6, 42
LDI r7, 194
LDI r8, 51
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
