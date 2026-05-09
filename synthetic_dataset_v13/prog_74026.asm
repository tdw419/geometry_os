; DESCRIPTION: Renders a blue line between points (286, 163) and (451, 92).
; PLAN: r0=286(x1), r1=163(y1), r2=451(x2), r3=92(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 163
LDI r2, 451
LDI r3, 92
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
