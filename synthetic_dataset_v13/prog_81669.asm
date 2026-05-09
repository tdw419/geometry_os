; DESCRIPTION: Places a black line segment connecting (156, 84) to (36, 251).
; PLAN: r0=156(x1), r1=84(y1), r2=36(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 84
LDI r2, 36
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
