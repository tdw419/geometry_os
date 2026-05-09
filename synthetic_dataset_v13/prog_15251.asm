; DESCRIPTION: Places a red line segment connecting (408, 38) to (158, 165).
; PLAN: r0=408(x1), r1=38(y1), r2=158(x2), r3=165(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 38
LDI r2, 158
LDI r3, 165
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
