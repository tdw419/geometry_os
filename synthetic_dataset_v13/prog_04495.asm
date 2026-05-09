; DESCRIPTION: Places a orange line segment connecting (25, 66) to (77, 128).
; PLAN: r0=25(x1), r1=66(y1), r2=77(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 66
LDI r2, 77
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
