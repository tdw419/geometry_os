; DESCRIPTION: Places a yellow line segment connecting (47, 134) to (376, 73).
; PLAN: r0=47(x1), r1=134(y1), r2=376(x2), r3=73(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 134
LDI r2, 376
LDI r3, 73
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
