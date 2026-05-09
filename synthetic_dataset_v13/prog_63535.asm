; DESCRIPTION: Places a orange line segment connecting (15, 247) to (23, 206).
; PLAN: r0=15(x1), r1=247(y1), r2=23(x2), r3=206(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 247
LDI r2, 23
LDI r3, 206
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
