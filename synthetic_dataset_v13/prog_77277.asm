; DESCRIPTION: Places a yellow line segment connecting (184, 102) to (130, 251).
; PLAN: r0=184(x1), r1=102(y1), r2=130(x2), r3=251(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 102
LDI r2, 130
LDI r3, 251
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
