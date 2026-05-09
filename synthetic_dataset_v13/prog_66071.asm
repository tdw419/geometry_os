; DESCRIPTION: Draws a orange line from (41, 61) to (143, 252).
; PLAN: r0=41(x1), r1=61(y1), r2=143(x2), r3=252(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 61
LDI r2, 143
LDI r3, 252
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
