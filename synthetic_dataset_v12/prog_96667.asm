; DESCRIPTION: Places a red line segment connecting (163, 92) to (282, 159).
; PLAN: r0=163(x1), r1=92(y1), r2=282(x2), r3=159(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 92
LDI r2, 282
LDI r3, 159
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
