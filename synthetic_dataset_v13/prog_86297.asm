; DESCRIPTION: Places a orange line segment connecting (344, 168) to (376, 88).
; PLAN: r0=344(x1), r1=168(y1), r2=376(x2), r3=88(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 168
LDI r2, 376
LDI r3, 88
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
