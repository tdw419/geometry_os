; DESCRIPTION: Places a orange line segment connecting (124, 224) to (9, 247).
; PLAN: r0=124(x1), r1=224(y1), r2=9(x2), r3=247(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 224
LDI r2, 9
LDI r3, 247
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
