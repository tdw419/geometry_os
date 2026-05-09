; DESCRIPTION: Places a orange line segment connecting (507, 186) to (375, 245).
; PLAN: r0=507(x1), r1=186(y1), r2=375(x2), r3=245(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 186
LDI r2, 375
LDI r3, 245
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
