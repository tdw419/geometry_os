; DESCRIPTION: Places a black line segment connecting (69, 49) to (100, 156).
; PLAN: r0=69(x1), r1=49(y1), r2=100(x2), r3=156(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 49
LDI r2, 100
LDI r3, 156
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
