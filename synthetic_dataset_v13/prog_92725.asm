; DESCRIPTION: Renders a black line between points (149, 200) and (315, 105).
; PLAN: r0=149(x1), r1=200(y1), r2=315(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 200
LDI r2, 315
LDI r3, 105
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
