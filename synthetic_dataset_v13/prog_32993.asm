; DESCRIPTION: Places a purple line segment connecting (509, 4) to (379, 191).
; PLAN: r0=509(x1), r1=4(y1), r2=379(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 4
LDI r2, 379
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
