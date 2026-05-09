; DESCRIPTION: Places a black line segment connecting (482, 122) to (84, 88).
; PLAN: r0=482(x1), r1=122(y1), r2=84(x2), r3=88(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 122
LDI r2, 84
LDI r3, 88
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
