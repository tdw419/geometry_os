; DESCRIPTION: Places a yellow line segment connecting (184, 70) to (155, 238).
; PLAN: r0=184(x1), r1=70(y1), r2=155(x2), r3=238(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 70
LDI r2, 155
LDI r3, 238
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
