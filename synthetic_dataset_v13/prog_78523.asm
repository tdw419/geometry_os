; DESCRIPTION: Places a red line segment connecting (477, 13) to (158, 53).
; PLAN: r0=477(x1), r1=13(y1), r2=158(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 13
LDI r2, 158
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
