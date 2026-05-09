; DESCRIPTION: Places a yellow line segment connecting (200, 204) to (133, 199).
; PLAN: r0=200(x1), r1=204(y1), r2=133(x2), r3=199(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 204
LDI r2, 133
LDI r3, 199
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
