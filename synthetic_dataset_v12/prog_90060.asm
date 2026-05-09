; DESCRIPTION: Places a orange line segment connecting (21, 33) to (17, 181).
; PLAN: r0=21(x1), r1=33(y1), r2=17(x2), r3=181(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 33
LDI r2, 17
LDI r3, 181
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
