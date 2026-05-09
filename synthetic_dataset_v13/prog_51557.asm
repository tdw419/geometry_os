; DESCRIPTION: Places a black line segment connecting (156, 157) to (84, 170).
; PLAN: r0=156(x1), r1=157(y1), r2=84(x2), r3=170(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 157
LDI r2, 84
LDI r3, 170
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
