; DESCRIPTION: Places a blue line segment connecting (271, 252) to (493, 88).
; PLAN: r0=271(x1), r1=252(y1), r2=493(x2), r3=88(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 252
LDI r2, 493
LDI r3, 88
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
