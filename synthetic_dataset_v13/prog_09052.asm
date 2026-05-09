; DESCRIPTION: Places a green line segment connecting (379, 113) to (90, 78).
; PLAN: r0=379(x1), r1=113(y1), r2=90(x2), r3=78(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 113
LDI r2, 90
LDI r3, 78
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
