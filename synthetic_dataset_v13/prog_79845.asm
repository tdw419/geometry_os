; DESCRIPTION: Places a yellow line segment connecting (407, 247) to (324, 157).
; PLAN: r0=407(x1), r1=247(y1), r2=324(x2), r3=157(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 247
LDI r2, 324
LDI r3, 157
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
