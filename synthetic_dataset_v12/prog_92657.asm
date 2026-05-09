; DESCRIPTION: Places a white line segment connecting (345, 201) to (314, 88).
; PLAN: r0=345(x1), r1=201(y1), r2=314(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 201
LDI r2, 314
LDI r3, 88
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
