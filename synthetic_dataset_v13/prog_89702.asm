; DESCRIPTION: Places a orange line segment connecting (175, 142) to (324, 159).
; PLAN: r0=175(x1), r1=142(y1), r2=324(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 142
LDI r2, 324
LDI r3, 159
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
