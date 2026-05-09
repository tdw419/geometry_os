; DESCRIPTION: Places a orange line segment connecting (364, 252) to (64, 164).
; PLAN: r0=364(x1), r1=252(y1), r2=64(x2), r3=164(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 252
LDI r2, 64
LDI r3, 164
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
