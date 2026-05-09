; DESCRIPTION: Places a orange line segment connecting (454, 128) to (130, 234).
; PLAN: r0=454(x1), r1=128(y1), r2=130(x2), r3=234(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 128
LDI r2, 130
LDI r3, 234
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
