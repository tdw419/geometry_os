; DESCRIPTION: Places a orange line segment connecting (348, 225) to (111, 13).
; PLAN: r0=348(x1), r1=225(y1), r2=111(x2), r3=13(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 225
LDI r2, 111
LDI r3, 13
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
