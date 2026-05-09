; DESCRIPTION: Places a green line segment connecting (122, 158) to (149, 123).
; PLAN: r0=122(x1), r1=158(y1), r2=149(x2), r3=123(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 158
LDI r2, 149
LDI r3, 123
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
