; DESCRIPTION: Places a orange line segment connecting (379, 221) to (469, 1).
; PLAN: r0=379(x1), r1=221(y1), r2=469(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 221
LDI r2, 469
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
