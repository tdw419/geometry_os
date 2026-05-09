; DESCRIPTION: Renders a purple line between points (424, 51) and (77, 78).
; PLAN: r0=424(x1), r1=51(y1), r2=77(x2), r3=78(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 51
LDI r2, 77
LDI r3, 78
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
