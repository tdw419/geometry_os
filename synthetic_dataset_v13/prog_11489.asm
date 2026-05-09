; DESCRIPTION: Places a orange line segment connecting (187, 114) to (492, 245).
; PLAN: r0=187(x1), r1=114(y1), r2=492(x2), r3=245(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 114
LDI r2, 492
LDI r3, 245
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
