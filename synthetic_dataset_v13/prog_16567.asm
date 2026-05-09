; DESCRIPTION: Renders a blue line between points (461, 51) and (351, 153).
; PLAN: r0=461(x1), r1=51(y1), r2=351(x2), r3=153(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 51
LDI r2, 351
LDI r3, 153
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
