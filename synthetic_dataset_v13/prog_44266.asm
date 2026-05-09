; DESCRIPTION: Places a orange line segment connecting (430, 58) to (269, 175).
; PLAN: r0=430(x1), r1=58(y1), r2=269(x2), r3=175(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 58
LDI r2, 269
LDI r3, 175
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
