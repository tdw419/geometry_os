; DESCRIPTION: Places a orange line segment connecting (222, 36) to (364, 98).
; PLAN: r0=222(x1), r1=36(y1), r2=364(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 36
LDI r2, 364
LDI r3, 98
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
