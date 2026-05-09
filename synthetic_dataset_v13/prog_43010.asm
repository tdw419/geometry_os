; DESCRIPTION: Places a yellow line segment connecting (462, 182) to (238, 43).
; PLAN: r0=462(x1), r1=182(y1), r2=238(x2), r3=43(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 182
LDI r2, 238
LDI r3, 43
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
