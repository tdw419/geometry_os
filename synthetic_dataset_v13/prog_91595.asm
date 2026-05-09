; DESCRIPTION: Places a yellow line segment connecting (323, 184) to (148, 10).
; PLAN: r0=323(x1), r1=184(y1), r2=148(x2), r3=10(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 184
LDI r2, 148
LDI r3, 10
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
