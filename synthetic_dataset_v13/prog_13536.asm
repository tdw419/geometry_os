; DESCRIPTION: Places a orange line segment connecting (265, 71) to (334, 87).
; PLAN: r0=265(x1), r1=71(y1), r2=334(x2), r3=87(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 71
LDI r2, 334
LDI r3, 87
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
