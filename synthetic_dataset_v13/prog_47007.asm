; DESCRIPTION: Places a black line segment connecting (53, 76) to (11, 35).
; PLAN: r0=53(x1), r1=76(y1), r2=11(x2), r3=35(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 76
LDI r2, 11
LDI r3, 35
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
