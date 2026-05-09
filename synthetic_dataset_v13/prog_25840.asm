; DESCRIPTION: Draws a purple line from (427, 22) to (343, 131).
; PLAN: r0=427(x1), r1=22(y1), r2=343(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 22
LDI r2, 343
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
