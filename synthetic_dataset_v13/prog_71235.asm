; DESCRIPTION: Draws a purple rectangle at (348, 3) with width 24 and height 91.
; PLAN: r0=348(x), r1=3(y), r2=24(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 3
LDI r2, 24
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
