; DESCRIPTION: Places a yellow line segment connecting (185, 50) to (246, 102).
; PLAN: r0=185(x1), r1=50(y1), r2=246(x2), r3=102(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 50
LDI r2, 246
LDI r3, 102
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
