; DESCRIPTION: Places a orange line segment connecting (383, 114) to (26, 190).
; PLAN: r0=383(x1), r1=114(y1), r2=26(x2), r3=190(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 114
LDI r2, 26
LDI r3, 190
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
