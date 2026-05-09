; DESCRIPTION: Places a orange line segment connecting (230, 162) to (101, 224).
; PLAN: r0=230(x1), r1=162(y1), r2=101(x2), r3=224(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 162
LDI r2, 101
LDI r3, 224
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
