; DESCRIPTION: Places a red line segment connecting (408, 182) to (53, 20).
; PLAN: r0=408(x1), r1=182(y1), r2=53(x2), r3=20(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 182
LDI r2, 53
LDI r3, 20
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
