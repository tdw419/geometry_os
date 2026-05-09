; DESCRIPTION: Places a orange line segment connecting (481, 126) to (335, 56).
; PLAN: r0=481(x1), r1=126(y1), r2=335(x2), r3=56(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 126
LDI r2, 335
LDI r3, 56
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
