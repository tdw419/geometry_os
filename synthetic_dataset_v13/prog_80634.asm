; DESCRIPTION: Places a black line segment connecting (334, 216) to (455, 84).
; PLAN: r0=334(x1), r1=216(y1), r2=455(x2), r3=84(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 216
LDI r2, 455
LDI r3, 84
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
