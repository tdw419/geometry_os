; DESCRIPTION: Places a black line segment connecting (84, 156) to (55, 24).
; PLAN: r0=84(x1), r1=156(y1), r2=55(x2), r3=24(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 156
LDI r2, 55
LDI r3, 24
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
