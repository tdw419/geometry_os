; DESCRIPTION: Places a purple line segment connecting (250, 250) to (483, 218).
; PLAN: r0=250(x1), r1=250(y1), r2=483(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 250
LDI r2, 483
LDI r3, 218
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
