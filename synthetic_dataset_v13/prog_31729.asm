; DESCRIPTION: Draws a orange line from (348, 97) to (124, 8).
; PLAN: r0=348(x1), r1=97(y1), r2=124(x2), r3=8(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 97
LDI r2, 124
LDI r3, 8
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
