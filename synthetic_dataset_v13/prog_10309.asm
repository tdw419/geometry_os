; DESCRIPTION: Places a black line segment connecting (149, 156) to (428, 130).
; PLAN: r0=149(x1), r1=156(y1), r2=428(x2), r3=130(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 156
LDI r2, 428
LDI r3, 130
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
