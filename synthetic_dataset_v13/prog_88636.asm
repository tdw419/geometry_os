; DESCRIPTION: Places a orange line segment connecting (88, 171) to (17, 237).
; PLAN: r0=88(x1), r1=171(y1), r2=17(x2), r3=237(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 171
LDI r2, 17
LDI r3, 237
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
