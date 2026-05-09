; DESCRIPTION: Places a red line segment connecting (153, 104) to (212, 116).
; PLAN: r0=153(x1), r1=104(y1), r2=212(x2), r3=116(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 104
LDI r2, 212
LDI r3, 116
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
