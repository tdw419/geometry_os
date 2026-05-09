; DESCRIPTION: Places a purple line segment connecting (473, 191) to (60, 45).
; PLAN: r0=473(x1), r1=191(y1), r2=60(x2), r3=45(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 191
LDI r2, 60
LDI r3, 45
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
