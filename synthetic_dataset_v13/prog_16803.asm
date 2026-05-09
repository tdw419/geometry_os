; DESCRIPTION: Places a orange line segment connecting (23, 92) to (462, 224).
; PLAN: r0=23(x1), r1=92(y1), r2=462(x2), r3=224(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 92
LDI r2, 462
LDI r3, 224
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
