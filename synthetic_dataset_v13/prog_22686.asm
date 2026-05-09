; DESCRIPTION: Places a orange line segment connecting (241, 21) to (116, 2).
; PLAN: r0=241(x1), r1=21(y1), r2=116(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 21
LDI r2, 116
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
