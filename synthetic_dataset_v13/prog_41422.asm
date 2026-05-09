; DESCRIPTION: Places a orange line segment connecting (219, 234) to (109, 156).
; PLAN: r0=219(x1), r1=234(y1), r2=109(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 234
LDI r2, 109
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
