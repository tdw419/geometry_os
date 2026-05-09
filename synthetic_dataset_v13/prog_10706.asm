; DESCRIPTION: Places a orange line segment connecting (23, 35) to (39, 73).
; PLAN: r0=23(x1), r1=35(y1), r2=39(x2), r3=73(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 35
LDI r2, 39
LDI r3, 73
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
