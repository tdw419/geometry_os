; DESCRIPTION: Places a blue line segment connecting (201, 157) to (440, 115).
; PLAN: r0=201(x1), r1=157(y1), r2=440(x2), r3=115(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 157
LDI r2, 440
LDI r3, 115
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
