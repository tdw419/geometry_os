; DESCRIPTION: Places a blue line segment connecting (424, 75) to (287, 172).
; PLAN: r0=424(x1), r1=75(y1), r2=287(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 75
LDI r2, 287
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
