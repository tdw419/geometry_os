; DESCRIPTION: Composite: Draws a purple line from (132, 191) to (200, 213) then Sets a single yellow pixel at (427, 208).
; PLAN: r0=132(x1), r1=191(y1), r2=200(x2), r3=213(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=427(x), r6=208(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 132
LDI r1, 191
LDI r2, 200
LDI r3, 213
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 427
LDI r6, 208
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
