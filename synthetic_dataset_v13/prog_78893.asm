; DESCRIPTION: Renders a blue line between points (359, 208) and (451, 3).
; PLAN: r0=359(x1), r1=208(y1), r2=451(x2), r3=3(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 208
LDI r2, 451
LDI r3, 3
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
