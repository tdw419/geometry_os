; DESCRIPTION: Places a yellow line segment connecting (83, 100) to (68, 197).
; PLAN: r0=83(x1), r1=100(y1), r2=68(x2), r3=197(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 100
LDI r2, 68
LDI r3, 197
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
