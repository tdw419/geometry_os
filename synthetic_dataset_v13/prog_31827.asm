; DESCRIPTION: Places a blue line segment connecting (420, 30) to (379, 188).
; PLAN: r0=420(x1), r1=30(y1), r2=379(x2), r3=188(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 30
LDI r2, 379
LDI r3, 188
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
