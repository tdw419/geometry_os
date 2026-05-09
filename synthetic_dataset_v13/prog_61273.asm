; DESCRIPTION: Places a orange line segment connecting (81, 167) to (489, 239).
; PLAN: r0=81(x1), r1=167(y1), r2=489(x2), r3=239(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 167
LDI r2, 489
LDI r3, 239
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
