; DESCRIPTION: Renders a purple line between points (233, 92) and (501, 99).
; PLAN: r0=233(x1), r1=92(y1), r2=501(x2), r3=99(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 92
LDI r2, 501
LDI r3, 99
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
