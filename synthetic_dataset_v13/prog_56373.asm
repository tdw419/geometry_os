; DESCRIPTION: Places a blue line segment connecting (336, 251) to (47, 73).
; PLAN: r0=336(x1), r1=251(y1), r2=47(x2), r3=73(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 251
LDI r2, 47
LDI r3, 73
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
