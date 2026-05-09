; DESCRIPTION: Places a orange line segment connecting (312, 17) to (98, 175).
; PLAN: r0=312(x1), r1=17(y1), r2=98(x2), r3=175(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 17
LDI r2, 98
LDI r3, 175
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
