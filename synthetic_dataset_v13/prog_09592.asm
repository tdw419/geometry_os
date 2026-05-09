; DESCRIPTION: Places a blue line segment connecting (432, 91) to (448, 91).
; PLAN: r0=432(x1), r1=91(y1), r2=448(x2), r3=91(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 91
LDI r2, 448
LDI r3, 91
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
