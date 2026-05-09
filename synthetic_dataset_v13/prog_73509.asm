; DESCRIPTION: Places a yellow line segment connecting (311, 56) to (200, 187).
; PLAN: r0=311(x1), r1=56(y1), r2=200(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 56
LDI r2, 200
LDI r3, 187
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
