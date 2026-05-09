; DESCRIPTION: Places a orange line segment connecting (347, 116) to (288, 58).
; PLAN: r0=347(x1), r1=116(y1), r2=288(x2), r3=58(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 116
LDI r2, 288
LDI r3, 58
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
