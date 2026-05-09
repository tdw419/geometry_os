; DESCRIPTION: Places a orange line segment connecting (348, 48) to (127, 64).
; PLAN: r0=348(x1), r1=48(y1), r2=127(x2), r3=64(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 48
LDI r2, 127
LDI r3, 64
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
