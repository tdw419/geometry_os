; DESCRIPTION: Places a yellow line segment connecting (408, 91) to (495, 232).
; PLAN: r0=408(x1), r1=91(y1), r2=495(x2), r3=232(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 91
LDI r2, 495
LDI r3, 232
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
