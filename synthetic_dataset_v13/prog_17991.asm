; DESCRIPTION: Places a purple line segment connecting (219, 132) to (156, 163).
; PLAN: r0=219(x1), r1=132(y1), r2=156(x2), r3=163(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 132
LDI r2, 156
LDI r3, 163
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
