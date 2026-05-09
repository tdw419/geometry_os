; DESCRIPTION: Renders a purple line between points (329, 232) and (133, 53).
; PLAN: r0=329(x1), r1=232(y1), r2=133(x2), r3=53(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 232
LDI r2, 133
LDI r3, 53
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
