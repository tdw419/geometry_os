; DESCRIPTION: Places a blue line segment connecting (312, 51) to (355, 121).
; PLAN: r0=312(x1), r1=51(y1), r2=355(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 51
LDI r2, 355
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
