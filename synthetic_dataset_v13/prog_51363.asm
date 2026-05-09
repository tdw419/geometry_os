; DESCRIPTION: Places a blue line segment connecting (355, 232) to (482, 158).
; PLAN: r0=355(x1), r1=232(y1), r2=482(x2), r3=158(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 232
LDI r2, 482
LDI r3, 158
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
