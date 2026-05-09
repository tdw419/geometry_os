; DESCRIPTION: Places a yellow line segment connecting (41, 26) to (379, 4).
; PLAN: r0=41(x1), r1=26(y1), r2=379(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 26
LDI r2, 379
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
