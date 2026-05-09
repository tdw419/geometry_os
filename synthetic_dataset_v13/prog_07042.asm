; DESCRIPTION: Places a orange line segment connecting (285, 40) to (253, 56).
; PLAN: r0=285(x1), r1=40(y1), r2=253(x2), r3=56(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 40
LDI r2, 253
LDI r3, 56
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
