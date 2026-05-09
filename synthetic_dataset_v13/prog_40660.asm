; DESCRIPTION: Draws a red line from (316, 119) to (183, 148).
; PLAN: r0=316(x1), r1=119(y1), r2=183(x2), r3=148(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 119
LDI r2, 183
LDI r3, 148
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
