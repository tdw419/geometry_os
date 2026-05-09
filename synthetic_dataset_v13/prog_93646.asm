; DESCRIPTION: Places a yellow line segment connecting (54, 3) to (227, 247).
; PLAN: r0=54(x1), r1=3(y1), r2=227(x2), r3=247(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 3
LDI r2, 227
LDI r3, 247
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
