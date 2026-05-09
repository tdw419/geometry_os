; DESCRIPTION: Places a blue line segment connecting (472, 200) to (189, 197).
; PLAN: r0=472(x1), r1=200(y1), r2=189(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 200
LDI r2, 189
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
