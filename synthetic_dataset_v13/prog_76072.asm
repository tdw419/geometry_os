; DESCRIPTION: Places a orange line segment connecting (421, 59) to (347, 79).
; PLAN: r0=421(x1), r1=59(y1), r2=347(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 59
LDI r2, 347
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
