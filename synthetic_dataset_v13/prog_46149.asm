; DESCRIPTION: Renders a blue line between points (396, 155) and (501, 76).
; PLAN: r0=396(x1), r1=155(y1), r2=501(x2), r3=76(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 155
LDI r2, 501
LDI r3, 76
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
