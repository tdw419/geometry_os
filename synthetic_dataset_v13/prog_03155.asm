; DESCRIPTION: Places a orange line segment connecting (139, 101) to (455, 49).
; PLAN: r0=139(x1), r1=101(y1), r2=455(x2), r3=49(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 101
LDI r2, 455
LDI r3, 49
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
