; DESCRIPTION: Places a orange line segment connecting (480, 122) to (105, 73).
; PLAN: r0=480(x1), r1=122(y1), r2=105(x2), r3=73(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 122
LDI r2, 105
LDI r3, 73
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
