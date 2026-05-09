; DESCRIPTION: Renders a magenta line between points (451, 105) and (110, 155).
; PLAN: r0=451(x1), r1=105(y1), r2=110(x2), r3=155(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 105
LDI r2, 110
LDI r3, 155
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
