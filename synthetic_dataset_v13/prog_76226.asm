; DESCRIPTION: Places a orange line segment connecting (394, 246) to (18, 85).
; PLAN: r0=394(x1), r1=246(y1), r2=18(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 246
LDI r2, 18
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
