; DESCRIPTION: Renders a orange line between points (483, 85) and (399, 25).
; PLAN: r0=483(x1), r1=85(y1), r2=399(x2), r3=25(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 85
LDI r2, 399
LDI r3, 25
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
