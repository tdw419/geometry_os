; DESCRIPTION: Places a yellow line segment connecting (75, 184) to (323, 31).
; PLAN: r0=75(x1), r1=184(y1), r2=323(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 184
LDI r2, 323
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
