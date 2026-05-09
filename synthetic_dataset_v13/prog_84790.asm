; DESCRIPTION: Draws a yellow line from (343, 35) to (432, 51).
; PLAN: r0=343(x1), r1=35(y1), r2=432(x2), r3=51(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 35
LDI r2, 432
LDI r3, 51
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
