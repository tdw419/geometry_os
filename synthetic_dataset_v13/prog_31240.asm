; DESCRIPTION: Renders a purple line between points (476, 252) and (138, 74).
; PLAN: r0=476(x1), r1=252(y1), r2=138(x2), r3=74(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 252
LDI r2, 138
LDI r3, 74
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
