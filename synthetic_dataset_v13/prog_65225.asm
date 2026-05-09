; DESCRIPTION: Places a black line segment connecting (343, 216) to (231, 67).
; PLAN: r0=343(x1), r1=216(y1), r2=231(x2), r3=67(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 216
LDI r2, 231
LDI r3, 67
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
