; DESCRIPTION: Renders a orange line between points (376, 143) and (11, 72).
; PLAN: r0=376(x1), r1=143(y1), r2=11(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 143
LDI r2, 11
LDI r3, 72
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
