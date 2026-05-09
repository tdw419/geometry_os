; DESCRIPTION: Renders a purple line between points (85, 96) and (436, 124).
; PLAN: r0=85(x1), r1=96(y1), r2=436(x2), r3=124(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 96
LDI r2, 436
LDI r3, 124
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
