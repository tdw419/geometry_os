; DESCRIPTION: Draws a blue line from (51, 4) to (478, 67).
; PLAN: r0=51(x1), r1=4(y1), r2=478(x2), r3=67(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 4
LDI r2, 478
LDI r3, 67
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
