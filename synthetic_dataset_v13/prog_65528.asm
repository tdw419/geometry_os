; DESCRIPTION: Draws a green line from (75, 185) to (316, 248).
; PLAN: r0=75(x1), r1=185(y1), r2=316(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 185
LDI r2, 316
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
