; DESCRIPTION: Composite: Places a purple line segment connecting (200, 249) to (140, 66) then Sets a single blue pixel at (172, 196).
; PLAN: r0=200(x1), r1=249(y1), r2=140(x2), r3=66(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=172(x), r6=196(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 200
LDI r1, 249
LDI r2, 140
LDI r3, 66
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 196
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
