; DESCRIPTION: Renders a white box of size 66x87 starting at (348, 9).
; PLAN: r0=348(x), r1=9(y), r2=66(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 9
LDI r2, 66
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
