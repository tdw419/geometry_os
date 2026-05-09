; DESCRIPTION: Places a orange line segment connecting (324, 218) to (32, 191).
; PLAN: r0=324(x1), r1=218(y1), r2=32(x2), r3=191(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 218
LDI r2, 32
LDI r3, 191
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
