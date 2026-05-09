; DESCRIPTION: Places a yellow line segment connecting (102, 103) to (137, 205).
; PLAN: r0=102(x1), r1=103(y1), r2=137(x2), r3=205(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 103
LDI r2, 137
LDI r3, 205
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
