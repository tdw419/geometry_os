; DESCRIPTION: Places a orange line segment connecting (472, 25) to (156, 193).
; PLAN: r0=472(x1), r1=25(y1), r2=156(x2), r3=193(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 25
LDI r2, 156
LDI r3, 193
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
