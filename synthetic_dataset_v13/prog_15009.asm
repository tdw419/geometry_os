; DESCRIPTION: Places a purple line segment connecting (387, 216) to (11, 26).
; PLAN: r0=387(x1), r1=216(y1), r2=11(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 216
LDI r2, 11
LDI r3, 26
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
