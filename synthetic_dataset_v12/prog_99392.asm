; DESCRIPTION: Composite: Places a purple line segment connecting (297, 193) to (112, 77) then Sets a single black pixel at (278, 36).
; PLAN: r0=297(x1), r1=193(y1), r2=112(x2), r3=77(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=278(x), r6=36(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 297
LDI r1, 193
LDI r2, 112
LDI r3, 77
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 36
LDI r7, 0x000000
PSET r5, r6, r7
HALT
