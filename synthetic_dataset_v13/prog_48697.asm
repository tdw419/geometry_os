; DESCRIPTION: Places a orange line segment connecting (246, 191) to (330, 40).
; PLAN: r0=246(x1), r1=191(y1), r2=330(x2), r3=40(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 191
LDI r2, 330
LDI r3, 40
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
