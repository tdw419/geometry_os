; DESCRIPTION: Places a orange line segment connecting (52, 99) to (193, 224).
; PLAN: r0=52(x1), r1=99(y1), r2=193(x2), r3=224(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 99
LDI r2, 193
LDI r3, 224
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
