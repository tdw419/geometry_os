; DESCRIPTION: Places a orange line segment connecting (256, 216) to (139, 36).
; PLAN: r0=256(x1), r1=216(y1), r2=139(x2), r3=36(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 216
LDI r2, 139
LDI r3, 36
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
