; DESCRIPTION: Places a yellow line segment connecting (457, 201) to (421, 2).
; PLAN: r0=457(x1), r1=201(y1), r2=421(x2), r3=2(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 201
LDI r2, 421
LDI r3, 2
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
