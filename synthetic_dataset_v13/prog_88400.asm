; DESCRIPTION: Places a yellow line segment connecting (336, 246) to (336, 149).
; PLAN: r0=336(x1), r1=246(y1), r2=336(x2), r3=149(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 246
LDI r2, 336
LDI r3, 149
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
