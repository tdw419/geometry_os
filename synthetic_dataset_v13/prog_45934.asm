; DESCRIPTION: Places a yellow line segment connecting (250, 148) to (158, 96).
; PLAN: r0=250(x1), r1=148(y1), r2=158(x2), r3=96(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 148
LDI r2, 158
LDI r3, 96
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
