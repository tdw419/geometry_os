; DESCRIPTION: Places a yellow line segment connecting (409, 115) to (227, 199).
; PLAN: r0=409(x1), r1=115(y1), r2=227(x2), r3=199(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 115
LDI r2, 227
LDI r3, 199
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
