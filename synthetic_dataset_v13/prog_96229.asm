; DESCRIPTION: Places a blue line segment connecting (114, 201) to (128, 1).
; PLAN: r0=114(x1), r1=201(y1), r2=128(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 201
LDI r2, 128
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
