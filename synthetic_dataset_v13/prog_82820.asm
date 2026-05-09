; DESCRIPTION: Places a blue line segment connecting (232, 175) to (339, 23).
; PLAN: r0=232(x1), r1=175(y1), r2=339(x2), r3=23(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 175
LDI r2, 339
LDI r3, 23
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
