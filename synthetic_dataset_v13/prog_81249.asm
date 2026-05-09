; DESCRIPTION: Places a yellow line segment connecting (212, 151) to (31, 227).
; PLAN: r0=212(x1), r1=151(y1), r2=31(x2), r3=227(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 151
LDI r2, 31
LDI r3, 227
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
