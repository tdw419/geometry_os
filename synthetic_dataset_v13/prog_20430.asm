; DESCRIPTION: Places a blue line segment connecting (258, 198) to (299, 73).
; PLAN: r0=258(x1), r1=198(y1), r2=299(x2), r3=73(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 198
LDI r2, 299
LDI r3, 73
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
