; DESCRIPTION: Renders a orange line between points (491, 85) and (216, 97).
; PLAN: r0=491(x1), r1=85(y1), r2=216(x2), r3=97(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 85
LDI r2, 216
LDI r3, 97
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
