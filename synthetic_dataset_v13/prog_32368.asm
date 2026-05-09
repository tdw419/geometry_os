; DESCRIPTION: Places a orange line segment connecting (378, 0) to (203, 1).
; PLAN: r0=378(x1), r1=0(y1), r2=203(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 0
LDI r2, 203
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
