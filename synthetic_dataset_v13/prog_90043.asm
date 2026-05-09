; DESCRIPTION: Places a green line segment connecting (442, 34) to (335, 78).
; PLAN: r0=442(x1), r1=34(y1), r2=335(x2), r3=78(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 34
LDI r2, 335
LDI r3, 78
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
