; DESCRIPTION: Places a blue line segment connecting (15, 106) to (327, 22).
; PLAN: r0=15(x1), r1=106(y1), r2=327(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 106
LDI r2, 327
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
