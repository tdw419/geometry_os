; DESCRIPTION: Places a yellow line segment connecting (323, 6) to (183, 227).
; PLAN: r0=323(x1), r1=6(y1), r2=183(x2), r3=227(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 6
LDI r2, 183
LDI r3, 227
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
