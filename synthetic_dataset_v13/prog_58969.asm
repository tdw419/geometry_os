; DESCRIPTION: Places a yellow line segment connecting (335, 21) to (451, 156).
; PLAN: r0=335(x1), r1=21(y1), r2=451(x2), r3=156(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 21
LDI r2, 451
LDI r3, 156
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
