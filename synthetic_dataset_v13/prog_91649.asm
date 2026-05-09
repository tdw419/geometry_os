; DESCRIPTION: Renders a purple line between points (51, 199) and (73, 200).
; PLAN: r0=51(x1), r1=199(y1), r2=73(x2), r3=200(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 199
LDI r2, 73
LDI r3, 200
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
