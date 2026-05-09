; DESCRIPTION: Renders a purple line between points (49, 84) and (314, 153).
; PLAN: r0=49(x1), r1=84(y1), r2=314(x2), r3=153(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 84
LDI r2, 314
LDI r3, 153
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
