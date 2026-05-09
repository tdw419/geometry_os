; DESCRIPTION: Renders a purple line between points (88, 51) and (141, 64).
; PLAN: r0=88(x1), r1=51(y1), r2=141(x2), r3=64(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 51
LDI r2, 141
LDI r3, 64
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
