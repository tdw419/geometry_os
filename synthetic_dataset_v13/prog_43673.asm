; DESCRIPTION: Places a orange line segment connecting (215, 109) to (351, 34).
; PLAN: r0=215(x1), r1=109(y1), r2=351(x2), r3=34(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 109
LDI r2, 351
LDI r3, 34
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
