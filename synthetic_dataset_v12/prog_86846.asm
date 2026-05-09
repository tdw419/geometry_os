; DESCRIPTION: Renders a black line between points (125, 143) and (51, 106).
; PLAN: r0=125(x1), r1=143(y1), r2=51(x2), r3=106(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 143
LDI r2, 51
LDI r3, 106
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
