; DESCRIPTION: Places a purple line segment connecting (473, 200) to (262, 35).
; PLAN: r0=473(x1), r1=200(y1), r2=262(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 200
LDI r2, 262
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
