; DESCRIPTION: Places a orange line segment connecting (347, 157) to (71, 135).
; PLAN: r0=347(x1), r1=157(y1), r2=71(x2), r3=135(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 157
LDI r2, 71
LDI r3, 135
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
