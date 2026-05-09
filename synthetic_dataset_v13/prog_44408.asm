; DESCRIPTION: Renders a purple line between points (476, 251) and (389, 83).
; PLAN: r0=476(x1), r1=251(y1), r2=389(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 251
LDI r2, 389
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
