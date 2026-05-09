; DESCRIPTION: Places a red line segment connecting (116, 16) to (118, 92).
; PLAN: r0=116(x1), r1=16(y1), r2=118(x2), r3=92(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 16
LDI r2, 118
LDI r3, 92
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
