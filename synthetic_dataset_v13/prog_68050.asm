; DESCRIPTION: Places a orange line segment connecting (334, 191) to (421, 179).
; PLAN: r0=334(x1), r1=191(y1), r2=421(x2), r3=179(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 191
LDI r2, 421
LDI r3, 179
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
