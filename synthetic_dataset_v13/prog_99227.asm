; DESCRIPTION: Places a orange line segment connecting (184, 20) to (125, 165).
; PLAN: r0=184(x1), r1=20(y1), r2=125(x2), r3=165(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 20
LDI r2, 125
LDI r3, 165
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
