; DESCRIPTION: Places a orange line segment connecting (290, 123) to (176, 93).
; PLAN: r0=290(x1), r1=123(y1), r2=176(x2), r3=93(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 123
LDI r2, 176
LDI r3, 93
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
