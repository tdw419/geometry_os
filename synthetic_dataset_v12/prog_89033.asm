; DESCRIPTION: Renders a black line between points (47, 14) and (273, 145).
; PLAN: r0=47(x1), r1=14(y1), r2=273(x2), r3=145(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 14
LDI r2, 273
LDI r3, 145
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
