; DESCRIPTION: Places a orange line segment connecting (339, 81) to (290, 6).
; PLAN: r0=339(x1), r1=81(y1), r2=290(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 81
LDI r2, 290
LDI r3, 6
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
