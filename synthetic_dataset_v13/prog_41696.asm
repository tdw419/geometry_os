; DESCRIPTION: Places a orange line segment connecting (396, 205) to (452, 175).
; PLAN: r0=396(x1), r1=205(y1), r2=452(x2), r3=175(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 205
LDI r2, 452
LDI r3, 175
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
