; DESCRIPTION: Places a orange line segment connecting (283, 78) to (255, 50).
; PLAN: r0=283(x1), r1=78(y1), r2=255(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 78
LDI r2, 255
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
