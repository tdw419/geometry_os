; DESCRIPTION: Renders a white box of size 26x80 starting at (348, 97).
; PLAN: r0=348(x), r1=97(y), r2=26(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 97
LDI r2, 26
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
