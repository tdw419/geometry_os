; DESCRIPTION: Places a yellow line segment connecting (297, 182) to (15, 155).
; PLAN: r0=297(x1), r1=182(y1), r2=15(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 182
LDI r2, 15
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
