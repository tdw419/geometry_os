; DESCRIPTION: Places a orange line segment connecting (160, 175) to (3, 227).
; PLAN: r0=160(x1), r1=175(y1), r2=3(x2), r3=227(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 175
LDI r2, 3
LDI r3, 227
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
