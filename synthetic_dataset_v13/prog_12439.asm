; DESCRIPTION: Places a purple line segment connecting (448, 12) to (36, 155).
; PLAN: r0=448(x1), r1=12(y1), r2=36(x2), r3=155(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 12
LDI r2, 36
LDI r3, 155
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
