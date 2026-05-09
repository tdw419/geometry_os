; DESCRIPTION: Renders a black line between points (472, 115) and (84, 35).
; PLAN: r0=472(x1), r1=115(y1), r2=84(x2), r3=35(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 115
LDI r2, 84
LDI r3, 35
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
