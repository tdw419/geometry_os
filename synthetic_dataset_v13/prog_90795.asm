; DESCRIPTION: Renders a black line between points (504, 119) and (35, 78).
; PLAN: r0=504(x1), r1=119(y1), r2=35(x2), r3=78(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 119
LDI r2, 35
LDI r3, 78
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
