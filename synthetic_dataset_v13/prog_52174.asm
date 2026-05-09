; DESCRIPTION: Renders a orange line between points (95, 106) and (99, 217).
; PLAN: r0=95(x1), r1=106(y1), r2=99(x2), r3=217(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 106
LDI r2, 99
LDI r3, 217
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
