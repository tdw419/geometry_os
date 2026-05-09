; DESCRIPTION: Places a blue line segment connecting (366, 38) to (150, 110).
; PLAN: r0=366(x1), r1=38(y1), r2=150(x2), r3=110(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 38
LDI r2, 150
LDI r3, 110
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
