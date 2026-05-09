; DESCRIPTION: Places a blue line segment connecting (16, 135) to (153, 162).
; PLAN: r0=16(x1), r1=135(y1), r2=153(x2), r3=162(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 135
LDI r2, 153
LDI r3, 162
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
