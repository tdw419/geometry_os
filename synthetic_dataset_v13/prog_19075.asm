; DESCRIPTION: Places a purple line segment connecting (427, 36) to (441, 66).
; PLAN: r0=427(x1), r1=36(y1), r2=441(x2), r3=66(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 36
LDI r2, 441
LDI r3, 66
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
