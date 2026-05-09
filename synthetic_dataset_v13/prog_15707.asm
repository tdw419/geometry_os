; DESCRIPTION: Places a blue line segment connecting (139, 210) to (505, 178).
; PLAN: r0=139(x1), r1=210(y1), r2=505(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 210
LDI r2, 505
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
