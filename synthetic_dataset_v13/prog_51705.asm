; DESCRIPTION: Places a green line segment connecting (422, 227) to (169, 119).
; PLAN: r0=422(x1), r1=227(y1), r2=169(x2), r3=119(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 227
LDI r2, 169
LDI r3, 119
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
