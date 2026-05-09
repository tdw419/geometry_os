; DESCRIPTION: Places a orange line segment connecting (125, 46) to (477, 222).
; PLAN: r0=125(x1), r1=46(y1), r2=477(x2), r3=222(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 46
LDI r2, 477
LDI r3, 222
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
