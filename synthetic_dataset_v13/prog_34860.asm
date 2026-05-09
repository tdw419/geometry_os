; DESCRIPTION: Renders a black line between points (157, 94) and (51, 87).
; PLAN: r0=157(x1), r1=94(y1), r2=51(x2), r3=87(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 94
LDI r2, 51
LDI r3, 87
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
