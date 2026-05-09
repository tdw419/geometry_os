; DESCRIPTION: Places a green line segment connecting (99, 78) to (285, 184).
; PLAN: r0=99(x1), r1=78(y1), r2=285(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 78
LDI r2, 285
LDI r3, 184
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
