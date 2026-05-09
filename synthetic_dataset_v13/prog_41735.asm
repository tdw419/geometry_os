; DESCRIPTION: Places a purple line segment connecting (441, 51) to (407, 87).
; PLAN: r0=441(x1), r1=51(y1), r2=407(x2), r3=87(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 51
LDI r2, 407
LDI r3, 87
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
