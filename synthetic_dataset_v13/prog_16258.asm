; DESCRIPTION: Places a orange line segment connecting (63, 244) to (495, 144).
; PLAN: r0=63(x1), r1=244(y1), r2=495(x2), r3=144(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 244
LDI r2, 495
LDI r3, 144
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
