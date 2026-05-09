; DESCRIPTION: Renders a black line between points (125, 89) and (308, 110).
; PLAN: r0=125(x1), r1=89(y1), r2=308(x2), r3=110(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 89
LDI r2, 308
LDI r3, 110
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
