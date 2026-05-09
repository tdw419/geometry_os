; DESCRIPTION: Places a purple line segment connecting (478, 51) to (426, 214).
; PLAN: r0=478(x1), r1=51(y1), r2=426(x2), r3=214(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 51
LDI r2, 426
LDI r3, 214
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
