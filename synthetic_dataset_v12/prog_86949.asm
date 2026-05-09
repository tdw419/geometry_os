; DESCRIPTION: Renders a orange line between points (85, 250) and (61, 247).
; PLAN: r0=85(x1), r1=250(y1), r2=61(x2), r3=247(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 250
LDI r2, 61
LDI r3, 247
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
