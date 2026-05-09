; DESCRIPTION: Places a blue line segment connecting (201, 14) to (304, 120).
; PLAN: r0=201(x1), r1=14(y1), r2=304(x2), r3=120(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 14
LDI r2, 304
LDI r3, 120
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
