; DESCRIPTION: Places a orange line segment connecting (499, 28) to (192, 72).
; PLAN: r0=499(x1), r1=28(y1), r2=192(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 28
LDI r2, 192
LDI r3, 72
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
