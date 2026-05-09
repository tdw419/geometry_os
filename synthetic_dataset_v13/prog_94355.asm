; DESCRIPTION: Renders a orange line between points (355, 108) and (490, 155).
; PLAN: r0=355(x1), r1=108(y1), r2=490(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 108
LDI r2, 490
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
