; DESCRIPTION: Places a orange line segment connecting (23, 189) to (58, 128).
; PLAN: r0=23(x1), r1=189(y1), r2=58(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 189
LDI r2, 58
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
