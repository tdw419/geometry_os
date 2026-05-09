; DESCRIPTION: Renders a orange line between points (86, 106) and (451, 162).
; PLAN: r0=86(x1), r1=106(y1), r2=451(x2), r3=162(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 106
LDI r2, 451
LDI r3, 162
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
