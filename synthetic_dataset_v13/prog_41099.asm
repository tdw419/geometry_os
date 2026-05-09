; DESCRIPTION: Places a yellow line segment connecting (112, 218) to (452, 7).
; PLAN: r0=112(x1), r1=218(y1), r2=452(x2), r3=7(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 218
LDI r2, 452
LDI r3, 7
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
