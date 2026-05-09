; DESCRIPTION: Places a yellow line segment connecting (418, 122) to (232, 88).
; PLAN: r0=418(x1), r1=122(y1), r2=232(x2), r3=88(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 122
LDI r2, 232
LDI r3, 88
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
