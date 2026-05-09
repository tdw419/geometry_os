; DESCRIPTION: Renders a orange line between points (194, 174) and (94, 99).
; PLAN: r0=194(x1), r1=174(y1), r2=94(x2), r3=99(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 174
LDI r2, 94
LDI r3, 99
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
