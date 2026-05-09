; DESCRIPTION: Renders a black line between points (438, 20) and (227, 51).
; PLAN: r0=438(x1), r1=20(y1), r2=227(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 20
LDI r2, 227
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
