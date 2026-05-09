; DESCRIPTION: Renders a red line between points (477, 88) and (476, 110).
; PLAN: r0=477(x1), r1=88(y1), r2=476(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 88
LDI r2, 476
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
