; DESCRIPTION: Renders a purple line between points (388, 51) and (299, 159).
; PLAN: r0=388(x1), r1=51(y1), r2=299(x2), r3=159(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 51
LDI r2, 299
LDI r3, 159
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
