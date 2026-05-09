; DESCRIPTION: Places a blue line segment connecting (160, 252) to (47, 80).
; PLAN: r0=160(x1), r1=252(y1), r2=47(x2), r3=80(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 252
LDI r2, 47
LDI r3, 80
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
