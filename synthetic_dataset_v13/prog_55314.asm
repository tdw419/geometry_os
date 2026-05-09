; DESCRIPTION: Places a blue line segment connecting (420, 14) to (115, 201).
; PLAN: r0=420(x1), r1=14(y1), r2=115(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 14
LDI r2, 115
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
