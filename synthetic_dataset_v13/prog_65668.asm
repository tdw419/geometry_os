; DESCRIPTION: Renders a red line between points (31, 118) and (316, 158).
; PLAN: r0=31(x1), r1=118(y1), r2=316(x2), r3=158(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 118
LDI r2, 316
LDI r3, 158
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
