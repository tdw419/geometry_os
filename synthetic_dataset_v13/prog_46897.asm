; DESCRIPTION: Renders a orange line between points (78, 0) and (376, 1).
; PLAN: r0=78(x1), r1=0(y1), r2=376(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 0
LDI r2, 376
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
