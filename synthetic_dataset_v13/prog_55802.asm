; DESCRIPTION: Places a purple line segment connecting (399, 216) to (175, 94).
; PLAN: r0=399(x1), r1=216(y1), r2=175(x2), r3=94(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 216
LDI r2, 175
LDI r3, 94
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
