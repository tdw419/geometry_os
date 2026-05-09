; DESCRIPTION: Places a blue line segment connecting (478, 51) to (498, 233).
; PLAN: r0=478(x1), r1=51(y1), r2=498(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 51
LDI r2, 498
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
