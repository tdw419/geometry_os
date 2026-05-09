; DESCRIPTION: Places a orange line segment connecting (339, 12) to (77, 90).
; PLAN: r0=339(x1), r1=12(y1), r2=77(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 12
LDI r2, 77
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
