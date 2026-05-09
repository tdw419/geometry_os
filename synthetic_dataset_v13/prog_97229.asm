; DESCRIPTION: Places a orange line segment connecting (420, 144) to (76, 135).
; PLAN: r0=420(x1), r1=144(y1), r2=76(x2), r3=135(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 144
LDI r2, 76
LDI r3, 135
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
