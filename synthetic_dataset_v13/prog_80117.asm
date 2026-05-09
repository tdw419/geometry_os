; DESCRIPTION: Places a orange line segment connecting (149, 232) to (215, 80).
; PLAN: r0=149(x1), r1=232(y1), r2=215(x2), r3=80(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 232
LDI r2, 215
LDI r3, 80
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
