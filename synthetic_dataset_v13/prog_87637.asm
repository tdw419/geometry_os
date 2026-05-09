; DESCRIPTION: Places a purple line segment connecting (55, 24) to (18, 156).
; PLAN: r0=55(x1), r1=24(y1), r2=18(x2), r3=156(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 24
LDI r2, 18
LDI r3, 156
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
