; DESCRIPTION: Places a blue line segment connecting (7, 122) to (505, 162).
; PLAN: r0=7(x1), r1=122(y1), r2=505(x2), r3=162(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 122
LDI r2, 505
LDI r3, 162
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
