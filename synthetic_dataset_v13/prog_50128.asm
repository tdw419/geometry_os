; DESCRIPTION: Places a orange line segment connecting (6, 148) to (43, 0).
; PLAN: r0=6(x1), r1=148(y1), r2=43(x2), r3=0(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 148
LDI r2, 43
LDI r3, 0
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
