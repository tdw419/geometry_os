; DESCRIPTION: Places a yellow line segment connecting (287, 137) to (53, 64).
; PLAN: r0=287(x1), r1=137(y1), r2=53(x2), r3=64(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 137
LDI r2, 53
LDI r3, 64
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
