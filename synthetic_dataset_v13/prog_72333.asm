; DESCRIPTION: Draws a black line from (89, 24) to (318, 51).
; PLAN: r0=89(x1), r1=24(y1), r2=318(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 24
LDI r2, 318
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
