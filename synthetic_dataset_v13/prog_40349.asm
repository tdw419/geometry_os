; DESCRIPTION: Composite: Sets a single blue pixel at (92, 20) then Renders a black line between points (471, 250) and (351, 31).
; PLAN: r0=92(x), r1=20(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=471(x1), r6=250(y1), r7=351(x2), r8=31(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 92
LDI r1, 20
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 471
LDI r6, 250
LDI r7, 351
LDI r8, 31
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
