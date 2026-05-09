; DESCRIPTION: Renders a orange line between points (379, 89) and (59, 52).
; PLAN: r0=379(x1), r1=89(y1), r2=59(x2), r3=52(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 89
LDI r2, 59
LDI r3, 52
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
