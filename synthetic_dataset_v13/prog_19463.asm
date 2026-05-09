; DESCRIPTION: Places a black line segment connecting (341, 151) to (105, 62).
; PLAN: r0=341(x1), r1=151(y1), r2=105(x2), r3=62(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 151
LDI r2, 105
LDI r3, 62
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
