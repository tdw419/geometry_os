; DESCRIPTION: Places a black line segment connecting (37, 156) to (236, 10).
; PLAN: r0=37(x1), r1=156(y1), r2=236(x2), r3=10(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 156
LDI r2, 236
LDI r3, 10
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
