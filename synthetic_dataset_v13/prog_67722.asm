; DESCRIPTION: Places a purple line segment connecting (483, 250) to (255, 53).
; PLAN: r0=483(x1), r1=250(y1), r2=255(x2), r3=53(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 250
LDI r2, 255
LDI r3, 53
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
