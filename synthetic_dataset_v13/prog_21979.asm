; DESCRIPTION: Renders a orange line between points (67, 140) and (348, 21).
; PLAN: r0=67(x1), r1=140(y1), r2=348(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 140
LDI r2, 348
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
