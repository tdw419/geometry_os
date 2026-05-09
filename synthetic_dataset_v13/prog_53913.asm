; DESCRIPTION: Places a orange line segment connecting (413, 21) to (8, 100).
; PLAN: r0=413(x1), r1=21(y1), r2=8(x2), r3=100(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 21
LDI r2, 8
LDI r3, 100
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
