; DESCRIPTION: Places a orange line segment connecting (334, 115) to (26, 134).
; PLAN: r0=334(x1), r1=115(y1), r2=26(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 115
LDI r2, 26
LDI r3, 134
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
