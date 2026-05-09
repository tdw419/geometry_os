; DESCRIPTION: Renders a purple line between points (35, 245) and (476, 53).
; PLAN: r0=35(x1), r1=245(y1), r2=476(x2), r3=53(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 245
LDI r2, 476
LDI r3, 53
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
