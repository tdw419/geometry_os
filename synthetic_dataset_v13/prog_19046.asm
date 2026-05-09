; DESCRIPTION: Places a black line segment connecting (314, 200) to (419, 158).
; PLAN: r0=314(x1), r1=200(y1), r2=419(x2), r3=158(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 200
LDI r2, 419
LDI r3, 158
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
