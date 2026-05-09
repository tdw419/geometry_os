; DESCRIPTION: Places a orange line segment connecting (509, 68) to (316, 166).
; PLAN: r0=509(x1), r1=68(y1), r2=316(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 68
LDI r2, 316
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
