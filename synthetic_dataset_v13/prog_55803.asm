; DESCRIPTION: Composite: Places a purple line segment connecting (458, 179) to (56, 164) then Sets a single red pixel at (129, 115).
; PLAN: r0=458(x1), r1=179(y1), r2=56(x2), r3=164(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=129(x), r6=115(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 458
LDI r1, 179
LDI r2, 56
LDI r3, 164
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 115
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
