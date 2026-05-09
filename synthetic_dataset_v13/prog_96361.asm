; DESCRIPTION: Draws a orange line from (348, 66) to (81, 223).
; PLAN: r0=348(x1), r1=66(y1), r2=81(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 66
LDI r2, 81
LDI r3, 223
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
