; DESCRIPTION: Places a blue line segment connecting (379, 9) to (349, 44).
; PLAN: r0=379(x1), r1=9(y1), r2=349(x2), r3=44(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 9
LDI r2, 349
LDI r3, 44
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
