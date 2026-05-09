; DESCRIPTION: Places a purple line segment connecting (136, 233) to (133, 134).
; PLAN: r0=136(x1), r1=233(y1), r2=133(x2), r3=134(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 233
LDI r2, 133
LDI r3, 134
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
