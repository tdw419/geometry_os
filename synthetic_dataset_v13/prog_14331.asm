; DESCRIPTION: Places a orange line segment connecting (129, 250) to (474, 28).
; PLAN: r0=129(x1), r1=250(y1), r2=474(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 250
LDI r2, 474
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
