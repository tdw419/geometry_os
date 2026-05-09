; DESCRIPTION: Places a purple line segment connecting (264, 34) to (397, 19).
; PLAN: r0=264(x1), r1=34(y1), r2=397(x2), r3=19(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 34
LDI r2, 397
LDI r3, 19
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
