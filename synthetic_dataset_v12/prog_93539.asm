; DESCRIPTION: Places a yellow line segment connecting (56, 118) to (247, 100).
; PLAN: r0=56(x1), r1=118(y1), r2=247(x2), r3=100(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 118
LDI r2, 247
LDI r3, 100
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
