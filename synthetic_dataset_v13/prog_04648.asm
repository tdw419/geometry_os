; DESCRIPTION: Places a white line segment connecting (158, 193) to (379, 176).
; PLAN: r0=158(x1), r1=193(y1), r2=379(x2), r3=176(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 193
LDI r2, 379
LDI r3, 176
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
