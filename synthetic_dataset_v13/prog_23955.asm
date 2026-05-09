; DESCRIPTION: Places a blue line segment connecting (379, 101) to (241, 126).
; PLAN: r0=379(x1), r1=101(y1), r2=241(x2), r3=126(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 101
LDI r2, 241
LDI r3, 126
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
