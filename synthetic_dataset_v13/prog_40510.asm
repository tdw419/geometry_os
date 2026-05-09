; DESCRIPTION: Places a black line segment connecting (6, 53) to (507, 163).
; PLAN: r0=6(x1), r1=53(y1), r2=507(x2), r3=163(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 53
LDI r2, 507
LDI r3, 163
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
