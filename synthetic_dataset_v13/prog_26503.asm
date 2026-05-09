; DESCRIPTION: Places a orange line segment connecting (88, 15) to (412, 12).
; PLAN: r0=88(x1), r1=15(y1), r2=412(x2), r3=12(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 15
LDI r2, 412
LDI r3, 12
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
