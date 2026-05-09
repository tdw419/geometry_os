; DESCRIPTION: Renders a red line between points (476, 60) and (89, 17).
; PLAN: r0=476(x1), r1=60(y1), r2=89(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 60
LDI r2, 89
LDI r3, 17
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
