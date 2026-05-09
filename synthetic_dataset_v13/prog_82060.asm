; DESCRIPTION: Places a yellow line segment connecting (163, 169) to (202, 5).
; PLAN: r0=163(x1), r1=169(y1), r2=202(x2), r3=5(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 169
LDI r2, 202
LDI r3, 5
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
