; DESCRIPTION: Places a blue line segment connecting (361, 161) to (238, 110).
; PLAN: r0=361(x1), r1=161(y1), r2=238(x2), r3=110(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 161
LDI r2, 238
LDI r3, 110
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
