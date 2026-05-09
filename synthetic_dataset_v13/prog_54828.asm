; DESCRIPTION: Places a purple line segment connecting (473, 61) to (297, 14).
; PLAN: r0=473(x1), r1=61(y1), r2=297(x2), r3=14(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 61
LDI r2, 297
LDI r3, 14
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
