; DESCRIPTION: Places a yellow line segment connecting (333, 78) to (268, 116).
; PLAN: r0=333(x1), r1=78(y1), r2=268(x2), r3=116(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 78
LDI r2, 268
LDI r3, 116
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
