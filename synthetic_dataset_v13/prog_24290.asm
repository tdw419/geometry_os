; DESCRIPTION: Places a yellow line segment connecting (232, 182) to (321, 30).
; PLAN: r0=232(x1), r1=182(y1), r2=321(x2), r3=30(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 182
LDI r2, 321
LDI r3, 30
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
