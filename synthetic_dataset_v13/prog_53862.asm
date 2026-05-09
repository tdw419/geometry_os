; DESCRIPTION: Places a orange line segment connecting (68, 138) to (178, 35).
; PLAN: r0=68(x1), r1=138(y1), r2=178(x2), r3=35(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 138
LDI r2, 178
LDI r3, 35
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
