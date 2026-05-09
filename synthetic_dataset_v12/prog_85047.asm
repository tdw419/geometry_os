; DESCRIPTION: Draws a orange line from (444, 251) to (348, 34).
; PLAN: r0=444(x1), r1=251(y1), r2=348(x2), r3=34(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 251
LDI r2, 348
LDI r3, 34
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
