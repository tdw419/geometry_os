; DESCRIPTION: Places a blue line segment connecting (137, 188) to (505, 93).
; PLAN: r0=137(x1), r1=188(y1), r2=505(x2), r3=93(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 188
LDI r2, 505
LDI r3, 93
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
