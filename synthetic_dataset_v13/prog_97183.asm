; DESCRIPTION: Renders a orange line between points (212, 250) and (399, 60).
; PLAN: r0=212(x1), r1=250(y1), r2=399(x2), r3=60(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 250
LDI r2, 399
LDI r3, 60
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
