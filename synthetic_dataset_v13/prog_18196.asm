; DESCRIPTION: Places a purple line segment connecting (200, 161) to (56, 132).
; PLAN: r0=200(x1), r1=161(y1), r2=56(x2), r3=132(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 161
LDI r2, 56
LDI r3, 132
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
