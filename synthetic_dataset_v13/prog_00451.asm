; DESCRIPTION: Places a orange line segment connecting (430, 128) to (116, 229).
; PLAN: r0=430(x1), r1=128(y1), r2=116(x2), r3=229(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 128
LDI r2, 116
LDI r3, 229
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
