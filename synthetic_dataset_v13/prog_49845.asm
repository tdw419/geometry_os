; DESCRIPTION: Places a blue line segment connecting (336, 238) to (260, 102).
; PLAN: r0=336(x1), r1=238(y1), r2=260(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 238
LDI r2, 260
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
