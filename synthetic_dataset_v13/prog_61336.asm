; DESCRIPTION: Places a orange line segment connecting (431, 192) to (156, 71).
; PLAN: r0=431(x1), r1=192(y1), r2=156(x2), r3=71(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 192
LDI r2, 156
LDI r3, 71
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
