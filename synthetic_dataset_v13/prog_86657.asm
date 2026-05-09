; DESCRIPTION: Places a blue line segment connecting (508, 22) to (157, 238).
; PLAN: r0=508(x1), r1=22(y1), r2=157(x2), r3=238(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 22
LDI r2, 157
LDI r3, 238
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
