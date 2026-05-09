; DESCRIPTION: Places a orange line segment connecting (232, 97) to (324, 190).
; PLAN: r0=232(x1), r1=97(y1), r2=324(x2), r3=190(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 97
LDI r2, 324
LDI r3, 190
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
