; DESCRIPTION: Places a blue line segment connecting (201, 211) to (484, 100).
; PLAN: r0=201(x1), r1=211(y1), r2=484(x2), r3=100(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 211
LDI r2, 484
LDI r3, 100
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
