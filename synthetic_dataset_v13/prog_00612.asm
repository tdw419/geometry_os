; DESCRIPTION: Renders a blue line between points (451, 214) and (396, 25).
; PLAN: r0=451(x1), r1=214(y1), r2=396(x2), r3=25(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 214
LDI r2, 396
LDI r3, 25
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
