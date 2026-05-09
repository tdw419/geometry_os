; DESCRIPTION: Places a orange line segment connecting (252, 19) to (90, 49).
; PLAN: r0=252(x1), r1=19(y1), r2=90(x2), r3=49(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 19
LDI r2, 90
LDI r3, 49
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
