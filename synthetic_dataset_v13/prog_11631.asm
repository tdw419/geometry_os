; DESCRIPTION: Places a purple line segment connecting (503, 79) to (53, 118).
; PLAN: r0=503(x1), r1=79(y1), r2=53(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 79
LDI r2, 53
LDI r3, 118
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
