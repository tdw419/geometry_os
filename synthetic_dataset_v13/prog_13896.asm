; DESCRIPTION: Places a yellow line segment connecting (354, 3) to (97, 137).
; PLAN: r0=354(x1), r1=3(y1), r2=97(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 3
LDI r2, 97
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
