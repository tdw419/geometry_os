; DESCRIPTION: Places a white line segment connecting (339, 211) to (379, 48).
; PLAN: r0=339(x1), r1=211(y1), r2=379(x2), r3=48(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 211
LDI r2, 379
LDI r3, 48
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
