; DESCRIPTION: Places a blue line segment connecting (323, 121) to (21, 238).
; PLAN: r0=323(x1), r1=121(y1), r2=21(x2), r3=238(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 121
LDI r2, 21
LDI r3, 238
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
