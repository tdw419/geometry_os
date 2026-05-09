; DESCRIPTION: Places a orange line segment connecting (266, 191) to (501, 234).
; PLAN: r0=266(x1), r1=191(y1), r2=501(x2), r3=234(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 191
LDI r2, 501
LDI r3, 234
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
