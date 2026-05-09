; DESCRIPTION: Places a orange line segment connecting (393, 78) to (233, 183).
; PLAN: r0=393(x1), r1=78(y1), r2=233(x2), r3=183(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 78
LDI r2, 233
LDI r3, 183
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
