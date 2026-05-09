; DESCRIPTION: Places a black line segment connecting (188, 1) to (376, 189).
; PLAN: r0=188(x1), r1=1(y1), r2=376(x2), r3=189(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 1
LDI r2, 376
LDI r3, 189
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
