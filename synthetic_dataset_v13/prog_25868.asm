; DESCRIPTION: Renders a purple line between points (451, 1) and (104, 64).
; PLAN: r0=451(x1), r1=1(y1), r2=104(x2), r3=64(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 1
LDI r2, 104
LDI r3, 64
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
