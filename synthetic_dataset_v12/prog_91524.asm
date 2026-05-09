; DESCRIPTION: Draws a orange line from (345, 1) to (348, 221).
; PLAN: r0=345(x1), r1=1(y1), r2=348(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 1
LDI r2, 348
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
