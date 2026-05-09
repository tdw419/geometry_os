; DESCRIPTION: Places a purple line segment connecting (332, 243) to (133, 142).
; PLAN: r0=332(x1), r1=243(y1), r2=133(x2), r3=142(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 243
LDI r2, 133
LDI r3, 142
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
