; DESCRIPTION: Places a purple line segment connecting (251, 157) to (133, 59).
; PLAN: r0=251(x1), r1=157(y1), r2=133(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 157
LDI r2, 133
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
