; DESCRIPTION: Places a blue line segment connecting (141, 38) to (216, 106).
; PLAN: r0=141(x1), r1=38(y1), r2=216(x2), r3=106(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 38
LDI r2, 216
LDI r3, 106
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
