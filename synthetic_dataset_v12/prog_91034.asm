; DESCRIPTION: Places a orange line segment connecting (378, 244) to (485, 227).
; PLAN: r0=378(x1), r1=244(y1), r2=485(x2), r3=227(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 244
LDI r2, 485
LDI r3, 227
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
