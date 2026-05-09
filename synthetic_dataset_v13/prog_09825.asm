; DESCRIPTION: Places a blue line segment connecting (396, 198) to (276, 88).
; PLAN: r0=396(x1), r1=198(y1), r2=276(x2), r3=88(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 198
LDI r2, 276
LDI r3, 88
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
