; DESCRIPTION: Places a purple line segment connecting (437, 216) to (375, 179).
; PLAN: r0=437(x1), r1=216(y1), r2=375(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 216
LDI r2, 375
LDI r3, 179
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
