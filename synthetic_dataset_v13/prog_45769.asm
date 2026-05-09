; DESCRIPTION: Renders a blue line between points (477, 232) and (339, 58).
; PLAN: r0=477(x1), r1=232(y1), r2=339(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 232
LDI r2, 339
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
