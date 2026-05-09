; DESCRIPTION: Places a orange line segment connecting (285, 9) to (455, 183).
; PLAN: r0=285(x1), r1=9(y1), r2=455(x2), r3=183(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 9
LDI r2, 455
LDI r3, 183
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
