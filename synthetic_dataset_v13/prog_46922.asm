; DESCRIPTION: Places a yellow line segment connecting (391, 158) to (436, 169).
; PLAN: r0=391(x1), r1=158(y1), r2=436(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 158
LDI r2, 436
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
