; DESCRIPTION: Places a black line segment connecting (421, 58) to (342, 49).
; PLAN: r0=421(x1), r1=58(y1), r2=342(x2), r3=49(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 58
LDI r2, 342
LDI r3, 49
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
