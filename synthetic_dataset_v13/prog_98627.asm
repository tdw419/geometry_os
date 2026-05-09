; DESCRIPTION: Places a blue line segment connecting (287, 5) to (315, 35).
; PLAN: r0=287(x1), r1=5(y1), r2=315(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 5
LDI r2, 315
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
