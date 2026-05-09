; DESCRIPTION: Places a red line segment connecting (261, 116) to (411, 118).
; PLAN: r0=261(x1), r1=116(y1), r2=411(x2), r3=118(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 116
LDI r2, 411
LDI r3, 118
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
