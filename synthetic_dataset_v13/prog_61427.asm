; DESCRIPTION: Places a orange line segment connecting (17, 140) to (171, 122).
; PLAN: r0=17(x1), r1=140(y1), r2=171(x2), r3=122(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 140
LDI r2, 171
LDI r3, 122
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
