; DESCRIPTION: Draws a red line from (316, 232) to (207, 248).
; PLAN: r0=316(x1), r1=232(y1), r2=207(x2), r3=248(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 232
LDI r2, 207
LDI r3, 248
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
