; DESCRIPTION: Places a orange line segment connecting (212, 225) to (383, 190).
; PLAN: r0=212(x1), r1=225(y1), r2=383(x2), r3=190(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 225
LDI r2, 383
LDI r3, 190
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
