; DESCRIPTION: Places a blue line segment connecting (451, 164) to (20, 252).
; PLAN: r0=451(x1), r1=164(y1), r2=20(x2), r3=252(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 164
LDI r2, 20
LDI r3, 252
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
