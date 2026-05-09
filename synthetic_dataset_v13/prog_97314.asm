; DESCRIPTION: Places a yellow line segment connecting (181, 13) to (201, 20).
; PLAN: r0=181(x1), r1=13(y1), r2=201(x2), r3=20(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 13
LDI r2, 201
LDI r3, 20
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
