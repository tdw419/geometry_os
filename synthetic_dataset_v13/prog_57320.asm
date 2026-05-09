; DESCRIPTION: Places a blue line segment connecting (375, 88) to (423, 162).
; PLAN: r0=375(x1), r1=88(y1), r2=423(x2), r3=162(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 88
LDI r2, 423
LDI r3, 162
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
