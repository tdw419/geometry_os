; DESCRIPTION: Places a orange line segment connecting (68, 12) to (344, 156).
; PLAN: r0=68(x1), r1=12(y1), r2=344(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 12
LDI r2, 344
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
