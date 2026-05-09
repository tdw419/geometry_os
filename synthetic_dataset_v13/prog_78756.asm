; DESCRIPTION: Places a black line segment connecting (379, 30) to (474, 158).
; PLAN: r0=379(x1), r1=30(y1), r2=474(x2), r3=158(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 30
LDI r2, 474
LDI r3, 158
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
