; DESCRIPTION: Places a blue line segment connecting (184, 3) to (311, 13).
; PLAN: r0=184(x1), r1=3(y1), r2=311(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 3
LDI r2, 311
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
