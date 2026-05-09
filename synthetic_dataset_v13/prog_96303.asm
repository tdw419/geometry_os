; DESCRIPTION: Places a purple line segment connecting (359, 156) to (419, 198).
; PLAN: r0=359(x1), r1=156(y1), r2=419(x2), r3=198(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 156
LDI r2, 419
LDI r3, 198
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
