; DESCRIPTION: Places a blue line segment connecting (444, 232) to (189, 194).
; PLAN: r0=444(x1), r1=232(y1), r2=189(x2), r3=194(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 232
LDI r2, 189
LDI r3, 194
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
