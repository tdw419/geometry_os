; DESCRIPTION: Places a orange line segment connecting (500, 21) to (147, 62).
; PLAN: r0=500(x1), r1=21(y1), r2=147(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 21
LDI r2, 147
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
