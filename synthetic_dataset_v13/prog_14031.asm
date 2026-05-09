; DESCRIPTION: Draws a orange line from (316, 252) to (98, 205).
; PLAN: r0=316(x1), r1=252(y1), r2=98(x2), r3=205(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 252
LDI r2, 98
LDI r3, 205
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
