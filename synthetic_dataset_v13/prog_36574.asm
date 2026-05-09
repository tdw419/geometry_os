; DESCRIPTION: Renders a orange line between points (26, 216) and (348, 78).
; PLAN: r0=26(x1), r1=216(y1), r2=348(x2), r3=78(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 216
LDI r2, 348
LDI r3, 78
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
