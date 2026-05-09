; DESCRIPTION: Places a blue line segment connecting (492, 36) to (311, 89).
; PLAN: r0=492(x1), r1=36(y1), r2=311(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 36
LDI r2, 311
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
