; DESCRIPTION: Renders a orange line between points (451, 123) and (177, 132).
; PLAN: r0=451(x1), r1=123(y1), r2=177(x2), r3=132(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 123
LDI r2, 177
LDI r3, 132
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
