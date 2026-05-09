; DESCRIPTION: Places a orange line segment connecting (501, 148) to (52, 143).
; PLAN: r0=501(x1), r1=148(y1), r2=52(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 148
LDI r2, 52
LDI r3, 143
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
