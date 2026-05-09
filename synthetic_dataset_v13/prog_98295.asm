; DESCRIPTION: Places a purple line segment connecting (77, 216) to (59, 23).
; PLAN: r0=77(x1), r1=216(y1), r2=59(x2), r3=23(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 216
LDI r2, 59
LDI r3, 23
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
