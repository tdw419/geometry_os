; DESCRIPTION: Places a black line segment connecting (496, 6) to (153, 101).
; PLAN: r0=496(x1), r1=6(y1), r2=153(x2), r3=101(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 6
LDI r2, 153
LDI r3, 101
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
