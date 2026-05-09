; DESCRIPTION: Places a yellow line segment connecting (15, 84) to (122, 1).
; PLAN: r0=15(x1), r1=84(y1), r2=122(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 84
LDI r2, 122
LDI r3, 1
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
