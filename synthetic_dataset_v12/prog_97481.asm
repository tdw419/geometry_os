; DESCRIPTION: Places a orange line segment connecting (227, 210) to (503, 78).
; PLAN: r0=227(x1), r1=210(y1), r2=503(x2), r3=78(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 210
LDI r2, 503
LDI r3, 78
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
