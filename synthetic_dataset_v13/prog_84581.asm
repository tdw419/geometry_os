; DESCRIPTION: Draws a orange line from (15, 109) to (477, 129).
; PLAN: r0=15(x1), r1=109(y1), r2=477(x2), r3=129(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 109
LDI r2, 477
LDI r3, 129
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
