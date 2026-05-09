; DESCRIPTION: Places a orange line segment connecting (441, 83) to (167, 59).
; PLAN: r0=441(x1), r1=83(y1), r2=167(x2), r3=59(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 83
LDI r2, 167
LDI r3, 59
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
