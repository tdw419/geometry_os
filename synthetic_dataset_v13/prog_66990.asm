; DESCRIPTION: Places a blue line segment connecting (381, 238) to (204, 184).
; PLAN: r0=381(x1), r1=238(y1), r2=204(x2), r3=184(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 238
LDI r2, 204
LDI r3, 184
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
