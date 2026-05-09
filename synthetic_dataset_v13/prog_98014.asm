; DESCRIPTION: Places a yellow line segment connecting (12, 76) to (357, 116).
; PLAN: r0=12(x1), r1=76(y1), r2=357(x2), r3=116(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 76
LDI r2, 357
LDI r3, 116
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
