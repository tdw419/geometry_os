; DESCRIPTION: Places a blue line segment connecting (58, 203) to (271, 3).
; PLAN: r0=58(x1), r1=203(y1), r2=271(x2), r3=3(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 203
LDI r2, 271
LDI r3, 3
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
