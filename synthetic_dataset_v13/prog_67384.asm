; DESCRIPTION: Places a blue line segment connecting (132, 39) to (397, 49).
; PLAN: r0=132(x1), r1=39(y1), r2=397(x2), r3=49(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 39
LDI r2, 397
LDI r3, 49
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
