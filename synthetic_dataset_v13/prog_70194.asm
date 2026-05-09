; DESCRIPTION: Places a blue line segment connecting (308, 157) to (24, 216).
; PLAN: r0=308(x1), r1=157(y1), r2=24(x2), r3=216(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 157
LDI r2, 24
LDI r3, 216
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
