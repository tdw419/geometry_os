; DESCRIPTION: Places a orange line segment connecting (256, 192) to (366, 67).
; PLAN: r0=256(x1), r1=192(y1), r2=366(x2), r3=67(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 192
LDI r2, 366
LDI r3, 67
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
