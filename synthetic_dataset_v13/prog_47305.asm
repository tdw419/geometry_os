; DESCRIPTION: Renders a black line between points (315, 159) and (51, 2).
; PLAN: r0=315(x1), r1=159(y1), r2=51(x2), r3=2(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 159
LDI r2, 51
LDI r3, 2
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
