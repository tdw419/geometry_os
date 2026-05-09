; DESCRIPTION: Renders a black line between points (89, 155) and (98, 110).
; PLAN: r0=89(x1), r1=155(y1), r2=98(x2), r3=110(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 155
LDI r2, 98
LDI r3, 110
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
