; DESCRIPTION: Draws a purple rectangle at (348, 109) with width 55 and height 62.
; PLAN: r0=348(x), r1=109(y), r2=55(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 109
LDI r2, 55
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
