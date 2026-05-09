; DESCRIPTION: Draws a black line from (155, 28) to (460, 121).
; PLAN: r0=155(x1), r1=28(y1), r2=460(x2), r3=121(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 28
LDI r2, 460
LDI r3, 121
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
