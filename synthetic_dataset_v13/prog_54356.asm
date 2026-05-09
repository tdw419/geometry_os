; DESCRIPTION: Places a yellow line segment connecting (90, 119) to (376, 0).
; PLAN: r0=90(x1), r1=119(y1), r2=376(x2), r3=0(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 119
LDI r2, 376
LDI r3, 0
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
