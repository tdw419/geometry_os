; DESCRIPTION: Places a orange line segment connecting (12, 13) to (184, 183).
; PLAN: r0=12(x1), r1=13(y1), r2=184(x2), r3=183(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 13
LDI r2, 184
LDI r3, 183
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
