; DESCRIPTION: Renders a blue line between points (368, 11) and (451, 71).
; PLAN: r0=368(x1), r1=11(y1), r2=451(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 11
LDI r2, 451
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
