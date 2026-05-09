; DESCRIPTION: Places a magenta line segment connecting (234, 83) to (448, 34).
; PLAN: r0=234(x1), r1=83(y1), r2=448(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 83
LDI r2, 448
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
