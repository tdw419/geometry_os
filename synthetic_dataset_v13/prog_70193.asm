; DESCRIPTION: Places a orange line segment connecting (125, 46) to (459, 69).
; PLAN: r0=125(x1), r1=46(y1), r2=459(x2), r3=69(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 46
LDI r2, 459
LDI r3, 69
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
