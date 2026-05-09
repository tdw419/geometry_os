; DESCRIPTION: Places a blue line segment connecting (304, 105) to (184, 4).
; PLAN: r0=304(x1), r1=105(y1), r2=184(x2), r3=4(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 105
LDI r2, 184
LDI r3, 4
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
