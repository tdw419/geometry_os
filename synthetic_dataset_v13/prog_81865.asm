; DESCRIPTION: Places a orange line segment connecting (226, 45) to (13, 151).
; PLAN: r0=226(x1), r1=45(y1), r2=13(x2), r3=151(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 45
LDI r2, 13
LDI r3, 151
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
