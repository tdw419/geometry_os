; DESCRIPTION: Places a orange line segment connecting (200, 107) to (222, 156).
; PLAN: r0=200(x1), r1=107(y1), r2=222(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 107
LDI r2, 222
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
