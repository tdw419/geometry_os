; DESCRIPTION: Places a orange line segment connecting (407, 250) to (194, 71).
; PLAN: r0=407(x1), r1=250(y1), r2=194(x2), r3=71(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 250
LDI r2, 194
LDI r3, 71
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
