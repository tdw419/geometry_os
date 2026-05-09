; DESCRIPTION: Renders a orange line between points (420, 222) and (348, 63).
; PLAN: r0=420(x1), r1=222(y1), r2=348(x2), r3=63(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 222
LDI r2, 348
LDI r3, 63
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
