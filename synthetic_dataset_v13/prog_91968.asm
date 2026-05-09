; DESCRIPTION: Draws a orange line from (316, 46) to (195, 123).
; PLAN: r0=316(x1), r1=46(y1), r2=195(x2), r3=123(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 46
LDI r2, 195
LDI r3, 123
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
