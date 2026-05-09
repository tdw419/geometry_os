; DESCRIPTION: Draws a orange line from (316, 146) to (98, 58).
; PLAN: r0=316(x1), r1=146(y1), r2=98(x2), r3=58(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 146
LDI r2, 98
LDI r3, 58
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
