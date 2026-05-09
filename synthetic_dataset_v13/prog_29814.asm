; DESCRIPTION: Places a orange line segment connecting (58, 12) to (458, 93).
; PLAN: r0=58(x1), r1=12(y1), r2=458(x2), r3=93(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 12
LDI r2, 458
LDI r3, 93
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
