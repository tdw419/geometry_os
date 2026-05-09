; DESCRIPTION: Renders a blue line between points (406, 219) and (477, 217).
; PLAN: r0=406(x1), r1=219(y1), r2=477(x2), r3=217(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 219
LDI r2, 477
LDI r3, 217
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
