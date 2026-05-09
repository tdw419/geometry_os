; DESCRIPTION: Places a purple line segment connecting (39, 170) to (419, 243).
; PLAN: r0=39(x1), r1=170(y1), r2=419(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 170
LDI r2, 419
LDI r3, 243
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
