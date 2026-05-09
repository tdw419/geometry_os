; DESCRIPTION: Places a black line segment connecting (53, 53) to (472, 128).
; PLAN: r0=53(x1), r1=53(y1), r2=472(x2), r3=128(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 53
LDI r2, 472
LDI r3, 128
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
