; DESCRIPTION: Places a purple line segment connecting (440, 86) to (133, 168).
; PLAN: r0=440(x1), r1=86(y1), r2=133(x2), r3=168(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 86
LDI r2, 133
LDI r3, 168
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
