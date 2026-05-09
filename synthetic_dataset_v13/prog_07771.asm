; DESCRIPTION: Composite: Sets a single blue pixel at (500, 20) then Renders a purple line between points (73, 112) and (478, 65).
; PLAN: r0=500(x), r1=20(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=73(x1), r6=112(y1), r7=478(x2), r8=65(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 500
LDI r1, 20
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 73
LDI r6, 112
LDI r7, 478
LDI r8, 65
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
