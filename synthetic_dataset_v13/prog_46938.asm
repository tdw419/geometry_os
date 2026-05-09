; DESCRIPTION: Renders a orange line between points (376, 161) and (56, 85).
; PLAN: r0=376(x1), r1=161(y1), r2=56(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 161
LDI r2, 56
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
