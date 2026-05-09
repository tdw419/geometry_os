; DESCRIPTION: Places a orange line segment connecting (17, 174) to (144, 4).
; PLAN: r0=17(x1), r1=174(y1), r2=144(x2), r3=4(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 174
LDI r2, 144
LDI r3, 4
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
