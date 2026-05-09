; DESCRIPTION: Places a orange line segment connecting (178, 117) to (472, 153).
; PLAN: r0=178(x1), r1=117(y1), r2=472(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 117
LDI r2, 472
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
