; DESCRIPTION: Places a orange line segment connecting (324, 136) to (97, 187).
; PLAN: r0=324(x1), r1=136(y1), r2=97(x2), r3=187(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 136
LDI r2, 97
LDI r3, 187
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
