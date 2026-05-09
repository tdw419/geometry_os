; DESCRIPTION: Places a purple line segment connecting (440, 72) to (62, 60).
; PLAN: r0=440(x1), r1=72(y1), r2=62(x2), r3=60(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 72
LDI r2, 62
LDI r3, 60
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
