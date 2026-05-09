; DESCRIPTION: Places a green line segment connecting (314, 158) to (457, 119).
; PLAN: r0=314(x1), r1=158(y1), r2=457(x2), r3=119(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 158
LDI r2, 457
LDI r3, 119
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
