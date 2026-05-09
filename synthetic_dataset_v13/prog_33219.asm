; DESCRIPTION: Places a purple line segment connecting (473, 57) to (142, 108).
; PLAN: r0=473(x1), r1=57(y1), r2=142(x2), r3=108(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 57
LDI r2, 142
LDI r3, 108
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
