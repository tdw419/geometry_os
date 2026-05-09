; DESCRIPTION: Draws a red line from (0, 39) to (316, 165).
; PLAN: r0=0(x1), r1=39(y1), r2=316(x2), r3=165(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 39
LDI r2, 316
LDI r3, 165
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
