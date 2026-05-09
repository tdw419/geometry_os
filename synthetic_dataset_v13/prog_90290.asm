; DESCRIPTION: Places a purple line segment connecting (133, 233) to (141, 131).
; PLAN: r0=133(x1), r1=233(y1), r2=141(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 233
LDI r2, 141
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
