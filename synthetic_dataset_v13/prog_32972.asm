; DESCRIPTION: Renders a purple line between points (496, 7) and (451, 145).
; PLAN: r0=496(x1), r1=7(y1), r2=451(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 7
LDI r2, 451
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
