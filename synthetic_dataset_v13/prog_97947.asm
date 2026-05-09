; DESCRIPTION: Places a orange line segment connecting (43, 62) to (76, 170).
; PLAN: r0=43(x1), r1=62(y1), r2=76(x2), r3=170(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 62
LDI r2, 76
LDI r3, 170
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
