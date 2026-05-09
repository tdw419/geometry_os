; DESCRIPTION: Draws a orange line from (348, 106) to (433, 124).
; PLAN: r0=348(x1), r1=106(y1), r2=433(x2), r3=124(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 106
LDI r2, 433
LDI r3, 124
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
