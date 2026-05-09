; DESCRIPTION: Places a orange line segment connecting (351, 252) to (503, 33).
; PLAN: r0=351(x1), r1=252(y1), r2=503(x2), r3=33(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 252
LDI r2, 503
LDI r3, 33
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
