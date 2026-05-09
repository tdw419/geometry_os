; DESCRIPTION: Places a orange line segment connecting (352, 86) to (240, 190).
; PLAN: r0=352(x1), r1=86(y1), r2=240(x2), r3=190(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 86
LDI r2, 240
LDI r3, 190
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
