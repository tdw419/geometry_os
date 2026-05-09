; DESCRIPTION: Places a blue line segment connecting (450, 92) to (287, 31).
; PLAN: r0=450(x1), r1=92(y1), r2=287(x2), r3=31(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 92
LDI r2, 287
LDI r3, 31
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
