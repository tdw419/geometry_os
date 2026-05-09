; DESCRIPTION: Draws a orange line from (135, 159) to (348, 129).
; PLAN: r0=135(x1), r1=159(y1), r2=348(x2), r3=129(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 159
LDI r2, 348
LDI r3, 129
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
