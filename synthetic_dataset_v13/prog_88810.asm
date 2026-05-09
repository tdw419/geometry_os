; DESCRIPTION: Draws a black line from (51, 141) to (353, 15).
; PLAN: r0=51(x1), r1=141(y1), r2=353(x2), r3=15(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 141
LDI r2, 353
LDI r3, 15
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
