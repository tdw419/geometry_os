; DESCRIPTION: Draws a black line from (141, 76) to (432, 217).
; PLAN: r0=141(x1), r1=76(y1), r2=432(x2), r3=217(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 76
LDI r2, 432
LDI r3, 217
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
