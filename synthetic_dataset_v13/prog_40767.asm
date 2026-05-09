; DESCRIPTION: Renders a orange line between points (194, 241) and (94, 78).
; PLAN: r0=194(x1), r1=241(y1), r2=94(x2), r3=78(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 241
LDI r2, 94
LDI r3, 78
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
