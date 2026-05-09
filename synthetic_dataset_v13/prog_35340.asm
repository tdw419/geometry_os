; DESCRIPTION: Places a blue line segment connecting (57, 123) to (413, 88).
; PLAN: r0=57(x1), r1=123(y1), r2=413(x2), r3=88(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 123
LDI r2, 413
LDI r3, 88
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
