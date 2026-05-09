; DESCRIPTION: Places a yellow line segment connecting (62, 204) to (253, 102).
; PLAN: r0=62(x1), r1=204(y1), r2=253(x2), r3=102(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 204
LDI r2, 253
LDI r3, 102
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
