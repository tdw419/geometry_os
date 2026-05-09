; DESCRIPTION: Places a blue line segment connecting (57, 157) to (287, 9).
; PLAN: r0=57(x1), r1=157(y1), r2=287(x2), r3=9(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 157
LDI r2, 287
LDI r3, 9
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
