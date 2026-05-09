; DESCRIPTION: Places a orange line segment connecting (86, 222) to (283, 98).
; PLAN: r0=86(x1), r1=222(y1), r2=283(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 222
LDI r2, 283
LDI r3, 98
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
