; DESCRIPTION: Places a yellow line segment connecting (13, 224) to (302, 84).
; PLAN: r0=13(x1), r1=224(y1), r2=302(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 224
LDI r2, 302
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
