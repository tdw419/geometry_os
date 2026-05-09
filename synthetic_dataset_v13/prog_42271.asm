; DESCRIPTION: Places a orange line segment connecting (281, 123) to (375, 91).
; PLAN: r0=281(x1), r1=123(y1), r2=375(x2), r3=91(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 123
LDI r2, 375
LDI r3, 91
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
