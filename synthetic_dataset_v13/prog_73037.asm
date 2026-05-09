; DESCRIPTION: Places a blue line segment connecting (287, 38) to (317, 96).
; PLAN: r0=287(x1), r1=38(y1), r2=317(x2), r3=96(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 38
LDI r2, 317
LDI r3, 96
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
