; DESCRIPTION: Places a blue line segment connecting (355, 117) to (219, 62).
; PLAN: r0=355(x1), r1=117(y1), r2=219(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 117
LDI r2, 219
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
