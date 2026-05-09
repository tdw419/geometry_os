; DESCRIPTION: Places a orange line segment connecting (49, 183) to (111, 125).
; PLAN: r0=49(x1), r1=183(y1), r2=111(x2), r3=125(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 183
LDI r2, 111
LDI r3, 125
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
