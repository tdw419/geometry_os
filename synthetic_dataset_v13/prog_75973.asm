; DESCRIPTION: Places a blue line segment connecting (38, 210) to (497, 119).
; PLAN: r0=38(x1), r1=210(y1), r2=497(x2), r3=119(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 210
LDI r2, 497
LDI r3, 119
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
