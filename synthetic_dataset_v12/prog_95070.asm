; DESCRIPTION: Places a orange line segment connecting (500, 144) to (481, 241).
; PLAN: r0=500(x1), r1=144(y1), r2=481(x2), r3=241(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 144
LDI r2, 481
LDI r3, 241
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
