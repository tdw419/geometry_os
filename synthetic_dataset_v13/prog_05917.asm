; DESCRIPTION: Places a purple line segment connecting (127, 45) to (334, 140).
; PLAN: r0=127(x1), r1=45(y1), r2=334(x2), r3=140(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 45
LDI r2, 334
LDI r3, 140
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
