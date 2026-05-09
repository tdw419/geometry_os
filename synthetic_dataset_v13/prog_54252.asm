; DESCRIPTION: Places a yellow line segment connecting (411, 169) to (189, 248).
; PLAN: r0=411(x1), r1=169(y1), r2=189(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 169
LDI r2, 189
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
