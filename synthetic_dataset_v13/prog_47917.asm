; DESCRIPTION: Places a yellow line segment connecting (357, 102) to (266, 188).
; PLAN: r0=357(x1), r1=102(y1), r2=266(x2), r3=188(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 102
LDI r2, 266
LDI r3, 188
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
