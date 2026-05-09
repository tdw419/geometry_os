; DESCRIPTION: Places a orange line segment connecting (232, 202) to (403, 1).
; PLAN: r0=232(x1), r1=202(y1), r2=403(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 202
LDI r2, 403
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
