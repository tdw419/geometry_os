; DESCRIPTION: Places a purple line segment connecting (441, 7) to (469, 145).
; PLAN: r0=441(x1), r1=7(y1), r2=469(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 7
LDI r2, 469
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
