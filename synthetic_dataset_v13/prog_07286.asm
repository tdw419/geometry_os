; DESCRIPTION: Places a black line segment connecting (86, 216) to (330, 85).
; PLAN: r0=86(x1), r1=216(y1), r2=330(x2), r3=85(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 216
LDI r2, 330
LDI r3, 85
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
