; DESCRIPTION: Places a orange line segment connecting (418, 17) to (136, 123).
; PLAN: r0=418(x1), r1=17(y1), r2=136(x2), r3=123(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 17
LDI r2, 136
LDI r3, 123
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
