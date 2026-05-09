; DESCRIPTION: Places a orange line segment connecting (174, 190) to (232, 116).
; PLAN: r0=174(x1), r1=190(y1), r2=232(x2), r3=116(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 190
LDI r2, 232
LDI r3, 116
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
