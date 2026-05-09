; DESCRIPTION: Places a purple line segment connecting (452, 70) to (219, 199).
; PLAN: r0=452(x1), r1=70(y1), r2=219(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 70
LDI r2, 219
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
