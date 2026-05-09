; DESCRIPTION: Renders a orange line between points (458, 165) and (100, 122).
; PLAN: r0=458(x1), r1=165(y1), r2=100(x2), r3=122(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 165
LDI r2, 100
LDI r3, 122
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
