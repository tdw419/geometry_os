; DESCRIPTION: Draws a red line from (118, 232) to (116, 58).
; PLAN: r0=118(x1), r1=232(y1), r2=116(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 232
LDI r2, 116
LDI r3, 58
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
