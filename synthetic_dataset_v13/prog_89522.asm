; DESCRIPTION: Places a purple line segment connecting (35, 172) to (29, 218).
; PLAN: r0=35(x1), r1=172(y1), r2=29(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 172
LDI r2, 29
LDI r3, 218
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
