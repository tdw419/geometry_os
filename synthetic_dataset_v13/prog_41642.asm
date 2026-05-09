; DESCRIPTION: Places a orange line segment connecting (382, 99) to (89, 189).
; PLAN: r0=382(x1), r1=99(y1), r2=89(x2), r3=189(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 99
LDI r2, 89
LDI r3, 189
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
