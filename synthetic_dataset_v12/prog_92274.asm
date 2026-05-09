; DESCRIPTION: Renders a purple line between points (15, 2) and (436, 62).
; PLAN: r0=15(x1), r1=2(y1), r2=436(x2), r3=62(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 2
LDI r2, 436
LDI r3, 62
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
