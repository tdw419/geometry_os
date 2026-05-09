; DESCRIPTION: Places a purple line segment connecting (451, 70) to (29, 121).
; PLAN: r0=451(x1), r1=70(y1), r2=29(x2), r3=121(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 70
LDI r2, 29
LDI r3, 121
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
