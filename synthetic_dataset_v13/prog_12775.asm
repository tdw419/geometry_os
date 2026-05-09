; DESCRIPTION: Places a orange line segment connecting (313, 2) to (211, 214).
; PLAN: r0=313(x1), r1=2(y1), r2=211(x2), r3=214(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 2
LDI r2, 211
LDI r3, 214
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
