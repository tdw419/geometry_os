; DESCRIPTION: Places a orange line segment connecting (49, 66) to (52, 151).
; PLAN: r0=49(x1), r1=66(y1), r2=52(x2), r3=151(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 66
LDI r2, 52
LDI r3, 151
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
