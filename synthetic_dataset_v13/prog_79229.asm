; DESCRIPTION: Places a orange line segment connecting (260, 45) to (183, 15).
; PLAN: r0=260(x1), r1=45(y1), r2=183(x2), r3=15(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 45
LDI r2, 183
LDI r3, 15
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
