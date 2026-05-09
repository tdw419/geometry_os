; DESCRIPTION: Places a purple line segment connecting (191, 68) to (397, 105).
; PLAN: r0=191(x1), r1=68(y1), r2=397(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 68
LDI r2, 397
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
