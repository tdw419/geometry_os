; DESCRIPTION: Places a orange line segment connecting (184, 175) to (473, 162).
; PLAN: r0=184(x1), r1=175(y1), r2=473(x2), r3=162(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 175
LDI r2, 473
LDI r3, 162
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
