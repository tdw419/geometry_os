; DESCRIPTION: Renders a black box of size 87x54 starting at (348, 101).
; PLAN: r0=348(x), r1=101(y), r2=87(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 101
LDI r2, 87
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
