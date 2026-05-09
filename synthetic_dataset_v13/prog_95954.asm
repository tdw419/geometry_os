; DESCRIPTION: Places a black line segment connecting (341, 76) to (153, 40).
; PLAN: r0=341(x1), r1=76(y1), r2=153(x2), r3=40(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 76
LDI r2, 153
LDI r3, 40
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
