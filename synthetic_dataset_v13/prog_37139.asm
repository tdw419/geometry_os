; DESCRIPTION: Renders a blue line between points (62, 218) and (302, 184).
; PLAN: r0=62(x1), r1=218(y1), r2=302(x2), r3=184(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 218
LDI r2, 302
LDI r3, 184
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
