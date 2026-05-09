; DESCRIPTION: Renders a orange line between points (348, 241) and (357, 140).
; PLAN: r0=348(x1), r1=241(y1), r2=357(x2), r3=140(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 241
LDI r2, 357
LDI r3, 140
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
