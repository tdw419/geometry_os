; DESCRIPTION: Places a orange line segment connecting (270, 95) to (325, 170).
; PLAN: r0=270(x1), r1=95(y1), r2=325(x2), r3=170(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 95
LDI r2, 325
LDI r3, 170
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
