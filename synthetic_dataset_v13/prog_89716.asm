; DESCRIPTION: Draws a purple line from (478, 92) to (424, 134).
; PLAN: r0=478(x1), r1=92(y1), r2=424(x2), r3=134(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 92
LDI r2, 424
LDI r3, 134
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
