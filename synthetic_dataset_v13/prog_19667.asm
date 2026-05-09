; DESCRIPTION: Draws a red line from (316, 135) to (116, 81).
; PLAN: r0=316(x1), r1=135(y1), r2=116(x2), r3=81(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 135
LDI r2, 116
LDI r3, 81
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
