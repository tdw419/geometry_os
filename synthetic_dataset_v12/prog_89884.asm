; DESCRIPTION: Places a blue line segment connecting (451, 123) to (440, 138).
; PLAN: r0=451(x1), r1=123(y1), r2=440(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 123
LDI r2, 440
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
