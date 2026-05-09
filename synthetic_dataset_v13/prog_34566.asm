; DESCRIPTION: Places a purple line segment connecting (397, 220) to (188, 155).
; PLAN: r0=397(x1), r1=220(y1), r2=188(x2), r3=155(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 220
LDI r2, 188
LDI r3, 155
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
