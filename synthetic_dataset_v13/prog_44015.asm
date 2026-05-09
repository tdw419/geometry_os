; DESCRIPTION: Places a yellow line segment connecting (339, 67) to (431, 163).
; PLAN: r0=339(x1), r1=67(y1), r2=431(x2), r3=163(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 67
LDI r2, 431
LDI r3, 163
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
