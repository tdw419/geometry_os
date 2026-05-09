; DESCRIPTION: Places a red line segment connecting (484, 218) to (330, 102).
; PLAN: r0=484(x1), r1=218(y1), r2=330(x2), r3=102(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 218
LDI r2, 330
LDI r3, 102
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
