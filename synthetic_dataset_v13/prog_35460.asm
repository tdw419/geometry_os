; DESCRIPTION: Places a orange line segment connecting (39, 71) to (375, 189).
; PLAN: r0=39(x1), r1=71(y1), r2=375(x2), r3=189(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 71
LDI r2, 375
LDI r3, 189
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
