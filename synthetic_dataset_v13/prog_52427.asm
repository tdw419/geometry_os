; DESCRIPTION: Draws a black line from (134, 118) to (432, 72).
; PLAN: r0=134(x1), r1=118(y1), r2=432(x2), r3=72(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 118
LDI r2, 432
LDI r3, 72
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
