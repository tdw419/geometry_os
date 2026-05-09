; DESCRIPTION: Places a black line segment connecting (4, 238) to (250, 129).
; PLAN: r0=4(x1), r1=238(y1), r2=250(x2), r3=129(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 238
LDI r2, 250
LDI r3, 129
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
