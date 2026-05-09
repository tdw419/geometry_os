; DESCRIPTION: Composite: Renders a purple line between points (377, 222) and (447, 22) then Sets a single yellow pixel at (275, 118).
; PLAN: r0=377(x1), r1=222(y1), r2=447(x2), r3=22(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=275(x), r6=118(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 377
LDI r1, 222
LDI r2, 447
LDI r3, 22
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 118
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
