; DESCRIPTION: Draws a orange line from (179, 234) to (41, 199).
; PLAN: r0=179(x1), r1=234(y1), r2=41(x2), r3=199(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 234
LDI r2, 41
LDI r3, 199
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
