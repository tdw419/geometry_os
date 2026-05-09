; DESCRIPTION: Places a orange line segment connecting (122, 22) to (247, 93).
; PLAN: r0=122(x1), r1=22(y1), r2=247(x2), r3=93(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 22
LDI r2, 247
LDI r3, 93
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
