; DESCRIPTION: Renders a orange line between points (427, 102) and (451, 90).
; PLAN: r0=427(x1), r1=102(y1), r2=451(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 102
LDI r2, 451
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
