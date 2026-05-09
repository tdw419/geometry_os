; DESCRIPTION: Renders a orange line between points (484, 225) and (89, 148).
; PLAN: r0=484(x1), r1=225(y1), r2=89(x2), r3=148(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 225
LDI r2, 89
LDI r3, 148
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
