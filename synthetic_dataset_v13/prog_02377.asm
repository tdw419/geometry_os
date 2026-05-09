; DESCRIPTION: Places a orange line segment connecting (63, 175) to (101, 43).
; PLAN: r0=63(x1), r1=175(y1), r2=101(x2), r3=43(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 175
LDI r2, 101
LDI r3, 43
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
