; DESCRIPTION: Places a orange line segment connecting (195, 148) to (115, 9).
; PLAN: r0=195(x1), r1=148(y1), r2=115(x2), r3=9(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 148
LDI r2, 115
LDI r3, 9
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
