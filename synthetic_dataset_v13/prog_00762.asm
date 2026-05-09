; DESCRIPTION: Places a orange line segment connecting (129, 6) to (375, 126).
; PLAN: r0=129(x1), r1=6(y1), r2=375(x2), r3=126(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 6
LDI r2, 375
LDI r3, 126
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
