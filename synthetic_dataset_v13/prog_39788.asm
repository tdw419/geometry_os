; DESCRIPTION: Places a blue line segment connecting (489, 126) to (288, 216).
; PLAN: r0=489(x1), r1=126(y1), r2=288(x2), r3=216(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 126
LDI r2, 288
LDI r3, 216
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
