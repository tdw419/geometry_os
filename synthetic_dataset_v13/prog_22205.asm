; DESCRIPTION: Places a black line segment connecting (188, 102) to (2, 238).
; PLAN: r0=188(x1), r1=102(y1), r2=2(x2), r3=238(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 102
LDI r2, 2
LDI r3, 238
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
