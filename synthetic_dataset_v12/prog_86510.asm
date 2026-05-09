; DESCRIPTION: Places a blue line segment connecting (434, 238) to (244, 105).
; PLAN: r0=434(x1), r1=238(y1), r2=244(x2), r3=105(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 238
LDI r2, 244
LDI r3, 105
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
