; DESCRIPTION: Places a yellow line segment connecting (28, 84) to (381, 248).
; PLAN: r0=28(x1), r1=84(y1), r2=381(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 84
LDI r2, 381
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
