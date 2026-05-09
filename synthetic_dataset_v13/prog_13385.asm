; DESCRIPTION: Renders a orange line between points (96, 227) and (376, 72).
; PLAN: r0=96(x1), r1=227(y1), r2=376(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 227
LDI r2, 376
LDI r3, 72
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
