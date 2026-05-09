; DESCRIPTION: Renders a orange line between points (318, 149) and (97, 45).
; PLAN: r0=318(x1), r1=149(y1), r2=97(x2), r3=45(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 149
LDI r2, 97
LDI r3, 45
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
