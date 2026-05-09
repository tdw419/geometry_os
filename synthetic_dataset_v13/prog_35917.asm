; DESCRIPTION: Places a yellow line segment connecting (428, 89) to (422, 66).
; PLAN: r0=428(x1), r1=89(y1), r2=422(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 89
LDI r2, 422
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
