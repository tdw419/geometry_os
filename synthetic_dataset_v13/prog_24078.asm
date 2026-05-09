; DESCRIPTION: Places a purple line segment connecting (477, 31) to (448, 188).
; PLAN: r0=477(x1), r1=31(y1), r2=448(x2), r3=188(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 31
LDI r2, 448
LDI r3, 188
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
