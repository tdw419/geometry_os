; DESCRIPTION: Places a black line segment connecting (97, 156) to (196, 155).
; PLAN: r0=97(x1), r1=156(y1), r2=196(x2), r3=155(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 156
LDI r2, 196
LDI r3, 155
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
