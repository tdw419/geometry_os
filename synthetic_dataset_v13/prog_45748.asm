; DESCRIPTION: Draws a blue line from (44, 92) to (507, 51).
; PLAN: r0=44(x1), r1=92(y1), r2=507(x2), r3=51(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 92
LDI r2, 507
LDI r3, 51
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
