; DESCRIPTION: Places a orange line segment connecting (456, 67) to (128, 124).
; PLAN: r0=456(x1), r1=67(y1), r2=128(x2), r3=124(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 67
LDI r2, 128
LDI r3, 124
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
