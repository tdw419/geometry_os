; DESCRIPTION: Places a yellow line segment connecting (336, 201) to (49, 119).
; PLAN: r0=336(x1), r1=201(y1), r2=49(x2), r3=119(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 201
LDI r2, 49
LDI r3, 119
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
